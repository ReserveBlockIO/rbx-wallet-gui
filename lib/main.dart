import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/app.dart';
import 'package:rbx_wallet/core/env.dart';
import 'package:rbx_wallet/core/singletons.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:url_strategy/url_strategy.dart';


const MIN_WIDTH = 1200.0;
const MIN_HEIGHT = 800.0;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.init();
  setPathUrlStrategy();
  await initSingletons();

  if (!kIsWeb && Platform.isMacOS) {
    await DesktopWindow.setWindowSize(const Size(MIN_WIDTH, MIN_HEIGHT));
    await DesktopWindow.setMinWindowSize(const Size(MIN_WIDTH, MIN_HEIGHT));
  }

  tz.initializeTimeZones();

  runApp(const RootRestorationScope(
    restorationId: "root",
    child: ProviderScope(
      child: App(),
    ),
  ));
}
