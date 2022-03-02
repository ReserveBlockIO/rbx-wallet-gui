import 'package:flutter/material.dart';
import 'package:flutter_window_close/flutter_window_close.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';

class AppSystemManager extends StatefulWidget {
  final Widget child;
  const AppSystemManager({Key? key, required this.child}) : super(key: key);

  @override
  _AppSystemManagerState createState() => _AppSystemManagerState();
}

class _AppSystemManagerState extends State<AppSystemManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);

    FlutterWindowClose.setWindowShouldCloseHandler(() async {
      await BridgeService().killCli();
      return true;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // I don't think this does anything on desktop apps but keeping it incase
    switch (state) {
      case AppLifecycleState.inactive:
        print('inactive');
        break;
      case AppLifecycleState.paused:
        print('paused');
        break;
      case AppLifecycleState.resumed:
        print('resumed');
        break;
      case AppLifecycleState.detached:
        print('detached');
        break;
      default:
    }
  }
}
