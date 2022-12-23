import 'package:rbx_wallet/core/env.dart';

bool isInt(String number) {
  return int.tryParse(number) == null ? false : true;
}

bool isNumber(String number) {
  return double.tryParse(number) == null ? false : true;
}

bool isValidEmail(String email) {
  return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(email);
}

bool isValidUrl(String url) {
  var urlPattern = r"^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-]+)+[\w\-\._~:/?#[\]@!\$&'\(\)\*\+,;=.]+$";
  return RegExp(urlPattern, caseSensitive: false).hasMatch(url);
}

bool isValidUsername(String username) {
  // 3 - 20 characters (alpha numberic + hyphen and underbar)
  return RegExp(r'^(?!\s*$)[a-zA-Z0-9_-]{3,20}$').hasMatch(username);
}

bool isValidPassword(String password) {
  return password.length > 7;

  // 8+ chars, number, symbol, 1 uppercase

  // return RegExp(
  //         r'^(?=[^A-Z\n]*[A-Z])(?=[^a-z\n]*[a-z])(?=[^0-9\n]*[0-9])(?=[^#?!@$%^&*\n-]*[#?!@$%^&*-]).{8,}$')
  //     .hasMatch(password);
}

bool isValidRbxAddress(String address) {
  if (address.length != 34) {
    return false;
  }

  String firstChar = "R";
  if (Env.isTestNet) {
    firstChar = "x";
  }
  if (address[0] != firstChar) {
    return false;
  }

  return true;
}

bool isValidPhoneNumber(String value) {
  String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(patttern);
  if (!regExp.hasMatch(value)) {
    return false;
  }

  return true;
}

String? formValidatorEmail(String? value) {
  if (value == null || value.isEmpty) {
    return "Email required.";
  }
  if (!isValidEmail(value)) {
    return "Invalid email.";
  }
  return null;
}

String? formValidatorUsername(String? value) {
  if (value == null || value.isEmpty) {
    return "Username required.";
  }

  if (!isValidUsername(value)) {
    return "Username not valid.";
  }

  return null;
}

String? formValidatorPhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return "Phone Number required.";
  }
  if (!isValidPhoneNumber(value)) {
    return "Invalid Phone Number.";
  }
  return null;
}

String? formValidatorPassword(String? value) {
  if (value == null || value.isEmpty) {
    return "Password required.";
  }

  if (!isValidPassword(value)) {
    return "Password not strong enough.";
  }

  return null;
}

String? formValidatorNotEmpty(String? value, String label) {
  if (value == null || value.isEmpty) {
    return "$label is required.";
  }

  return null;
}

String? formValidatorRbxAddress(String? value, [bool allowAdnr = false]) {
  if (value == null || value.isEmpty) {
    return "Address or RBX domain required";
  }

  if (allowAdnr && value.contains(".rbx")) {
    return null;
  }

  if (!isValidRbxAddress(value)) {
    return "Invalid Address.";
  }

  return null;
}

String? formValidatorRbxAddressOrEmpty(String? value) {
  if (value == null || value.isEmpty) {
    return null;
  }

  if (!isValidRbxAddress(value)) {
    return "Invalid Address.";
  }

  return null;
}

String? formPercentValidator(String? val) {
  if (val == null || val.isEmpty) {
    return "Required";
  }
  final amount = double.tryParse(val);
  if (amount == null) {
    return "Invalid";
  }

  if (amount > 100) {
    return "Can not be more than 100%";
  }

  if (amount <= 0) {
    return "Must be more than 0%";
  }

  return null;
}

String? formValidatorNumber(String? value, String label) {
  if (value == null || value.isEmpty) {
    return "$label is required.";
  }

  if (!isNumber(value)) {
    return "Invalid $label.";
  }

  return null;
}

String? formValidatorInteger(String? value, String label) {
  if (value == null || value.isEmpty) {
    return "$label is required.";
  }

  if (!isInt(value)) {
    return "Invalid $label.";
  }

  return null;
}

String? formValidatorAlphaNumeric(String? value, String label) {
  if (value == null || value.isEmpty) {
    return "$label is required.";
  }

  return RegExp(r"^[a-zA-Z0-9]+$").hasMatch(value) ? null : "A DNR may only contain letters and numbers.";

  return null;
}
