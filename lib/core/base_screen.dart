import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../features/root/navigation/components/web_drawer.dart';
import 'breakpoints.dart';

abstract class BaseScreen extends ConsumerWidget {
  const BaseScreen({
    Key? key,
    this.verticalPadding = 8.0,
    this.horizontalPadding = 16.0,
    this.includeWebDrawer = false,
    this.backgroundColor,
  }) : super(key: key);

  final double verticalPadding;
  final double horizontalPadding;
  final Color? backgroundColor;
  final bool includeWebDrawer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Color(0xff050505),
      appBar: appBar(context, ref),
      // drawer: includeWebDrawer && BreakPoints.useMobileLayout(context) ? const WebDrawer() : null,
      floatingActionButton: floatingActionButton(context, ref),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: BreakPoints.useMobileLayout(context) ? body(context, ref) : desktopBody(context, ref),
      ),
    );
  }

  AppBar? appBar(BuildContext context, WidgetRef ref) {
    return null;
  }

  FloatingActionButton? floatingActionButton(BuildContext context, WidgetRef ref) {
    return null;
  }

  Widget body(BuildContext context, WidgetRef ref) {
    return Container();
  }

  Widget desktopBody(BuildContext context, WidgetRef ref) {
    // defaults to using standard body if not overridden
    return body(context, ref);
  }
}

abstract class BaseStatefulScreen extends ConsumerStatefulWidget {
  const BaseStatefulScreen({
    Key? key,
    this.verticalPadding = 8.0,
    this.horizontalPadding = 8.0,
    this.includeMainDrawer = false,
    this.backgroundColor,
  }) : super(key: key);

  final double verticalPadding;
  final double horizontalPadding;
  final bool includeMainDrawer;
  final Color? backgroundColor;

  @override
  BaseScreenState createState() => BaseScreenState();
}

class BaseScreenState<T extends BaseStatefulScreen> extends ConsumerState<T> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      backgroundColor: widget.backgroundColor ?? Color(0xff050505),

      // drawer: widget.includeMainDrawer ? const MainDrawer() : null,
      floatingActionButton: floatingActionButton(context),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widget.horizontalPadding,
          vertical: widget.verticalPadding,
        ),
        child: BreakPoints.useMobileLayout(context) ? body(context) : desktopBody(context),
      ),
    );
  }

  AppBar? appBar(BuildContext context) {
    return null;
  }

  FloatingActionButton? floatingActionButton(BuildContext context) {
    return null;
  }

  Widget body(BuildContext context) {
    return Container();
  }

  Widget desktopBody(BuildContext context) {
    // defaults to using standard body if not overridden
    return body(context);
  }
}
