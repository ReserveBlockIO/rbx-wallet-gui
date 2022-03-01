import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/breakpoints.dart';

abstract class BaseComponent extends ConsumerWidget {
  const BaseComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BreakPoints.useMobileLayout(context)
        ? body(context, ref)
        : desktopBody(context, ref);
  }

  Widget body(BuildContext context, WidgetRef ref) {
    return Container();
  }

  Widget desktopBody(BuildContext context, WidgetRef ref) {
    // defaults to using standard body if not overridden
    return body(context, ref);
  }
}

abstract class BaseStatefulComponent extends ConsumerStatefulWidget {
  const BaseStatefulComponent({
    Key? key,
  }) : super(key: key);

  @override
  BaseComponentState createState() => BaseComponentState();
}

class BaseComponentState<T extends BaseStatefulComponent>
    extends ConsumerState<T> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BreakPoints.useMobileLayout(context)
        ? body(context)
        : desktopBody(context);
  }

  Widget body(BuildContext context) {
    return Container();
  }

  Widget desktopBody(BuildContext context) {
    return body(context);
  }
}
