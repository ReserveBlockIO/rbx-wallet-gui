import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../features/keygen/models/keypair.dart';
import '../features/keygen/services/keygen_service.dart';

Future<Keypair?> create(String emailValue, String passwordValue) async {
  String email = emailValue.toLowerCase();
  String password = passwordValue;

  String seed = "$email|$password|";
  seed = "$seed${seed.length}|!@${((password.length * 7) + email.length) * 7}";

  final regChars = RegExp(r'/[a-z]+/g');
  final regUpperChars = RegExp(r'/[A-Z]+/g');
  final regNumbers = RegExp(r'/[0-9]+/g');

  final chars = regChars.hasMatch(password) ? regChars.allMatches(password).length : 1;
  final upperChars = regUpperChars.hasMatch(password) ? regUpperChars.allMatches(password).length : 1;
  final upperNumbers = regNumbers.hasMatch(password) ? regNumbers.allMatches(password).length : 1;

  seed = "$seed${(chars + upperChars + upperNumbers) * password.length}3571";
  seed = "$seed$seed";

  for (int i = 0; i <= 50; i++) {
    seed = sha256.convert(utf8.encode(seed)).toString();
  }
  final keypair = await KeygenService.seedToKeypair(seed, 0);

  // if (keypair != null) {
  //   return [keypair.private, keypair.public, keypair.privateCorrected];
  // }

  return keypair;
}

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890\$!*&^()_-@';
Random _rnd = Random();

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length,
      (_) => _chars.codeUnitAt(
        _rnd.nextInt(_chars.length),
      ),
    ));

void runTests() async {
  final List<Keypair> values = [];

  final List<List<String>> tests = [];

  for (int i = 0; i < 100; i++) {
    final emailLength = _rnd.nextInt(20);
    final email2Length = _rnd.nextInt(20);
    final passwordLength = _rnd.nextInt(20);
    final email = "${getRandomString(emailLength)}@${getRandomString(email2Length)}.com";
    final password = getRandomString(passwordLength);
    tests.add([email, password]);
  }

  for (final test in tests) {
    final value = await create(test[0], test[1]);
    if (value != null) {
      values.add(value);
    }
  }

  String output = "";
  for (final v in values) {
    final needsFix = v.private != v.privateCorrected;
    final value = "${v.public},${v.private},${v.privateCorrected},${needsFix ? 1 : 0}";
    output = "$output\n$value";
  }

  await Clipboard.setData(ClipboardData(text: output));

  int successes = 0;
  for (final v in values) {
    final response = await Dio().get("http://localhost:7292/api/V1/ImportPrivateKey/${v.privateCorrected}");

    final data = jsonDecode(response.data);

    if (data['Address'] == v.public) {
      successes += 1;
    } else {
      print("PROBLEM");
    }
  }
}

void otherTest() {
  const key = "9a9bde3b1db515bca6b1143ab635d2ae291ec7a281affc5353146f7aec1b52c6";
  final b = BigInt.parse(key, radix: 16).toSigned(1);
  print(b);
}
