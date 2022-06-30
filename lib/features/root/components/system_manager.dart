import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_window_close/flutter_window_close.dart';
import 'package:rbx_wallet/core/providers/is_active_provider.dart';
import 'package:rbx_wallet/features/bridge/services/bridge_service.dart';

class AppSystemManager extends ConsumerStatefulWidget {
  final Widget child;
  const AppSystemManager({Key? key, required this.child}) : super(key: key);

  @override
  _AppSystemManagerState createState() => _AppSystemManagerState();
}

class _AppSystemManagerState extends ConsumerState<AppSystemManager>
    with WidgetsBindingObserver {
  bool shouldActivateOnTick = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    activityTick();

    ref.read(isActiveProvider.notifier).init();
    FlutterWindowClose.setWindowShouldCloseHandler(() async {
      await BridgeService().killCli();
      return true;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<void> activityTick() async {
    if (shouldActivateOnTick) {
      ref.read(isActiveProvider.notifier).activate();
      setState(() {
        shouldActivateOnTick = false;
      });
    }

    await Future.delayed(const Duration(seconds: 5));
    activityTick();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onHover: (_) {
          if (!shouldActivateOnTick) {
            shouldActivateOnTick = true;
          }
        },
        child: widget.child);
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
