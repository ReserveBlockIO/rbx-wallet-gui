import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:uni_links_desktop/uni_links_desktop.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';

import 'app.dart';
import 'core/env.dart';
import 'core/singletons.dart';

const DEFAULT_WIDTH = 1200.0;
const DEFAULT_HEIGHT = 780.0;

const MIN_WIDTH = 1200.0;
const MIN_HEIGHT = 780.0;
late final Box rbxBox;

final rootAppWindow = appWindow;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Env.init();
  if (kIsWeb) {
    await Hive.initFlutter();
    rbxBox = await Hive.openBox('VFX');
  }
  await initSingletons();

  // if (!kIsWeb && Platform.isMacOS) {
  //   await DesktopWindow.setWindowSize(const Size(DEFAULT_WIDTH, DEFAULT_HEIGHT));
  //   await DesktopWindow.setMinWindowSize(const Size(MIN_WIDTH, MIN_HEIGHT));
  // }

  tz.initializeTimeZones();

  if (!kIsWeb) {
    if (Platform.isWindows) {
      registerProtocol('vfx');
    }
  }

  runApp(const RootRestorationScope(
    restorationId: "root",
    child: ProviderScope(
      child: App(),
    ),
  ));

  doWhenWindowReady(() {
    rootAppWindow.size = Size(DEFAULT_WIDTH, DEFAULT_HEIGHT);
    rootAppWindow.minSize = Size(MIN_WIDTH, MIN_HEIGHT);
    rootAppWindow.alignment = Alignment.center;
    rootAppWindow.title = "VFX Switchblade";
    rootAppWindow.show();
  });
}
