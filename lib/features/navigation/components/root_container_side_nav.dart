import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'root_container_expander.dart';
import '../root_container.dart';

import '../../../core/base_component.dart';
import '../../../core/theme/colors.dart';
import 'root_container_side_nav_list.dart';

class RootContainerSideNav extends BaseComponent {
  final bool isExpanded;
  final VoidCallback? onToggleExpanded;
  const RootContainerSideNav({super.key, required this.isExpanded, this.onToggleExpanded});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabsRouter = AutoTabsRouter.of(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 2.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: ROOT_CONTAINER_TRANSITION_DURATION,
              curve: ROOT_CONTAINER_TRANSITION_CURVE,
              width: isExpanded ? SIDE_NAV_WIDTH_EXPANDED : SIDE_NAV_WIDTH_CONTRACTED,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8),
                  bottomRight: Radius.circular(8),
                ),
                border: Border.all(
                  color: AppColors.getGray(ColorShade.s50),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: RootContainerSideNavList(isExpanded: isExpanded),
            ),
            if (onToggleExpanded != null)
              Align(
                alignment: Alignment.centerLeft,
                child: RootContainerExpander(onToggleExpanded: onToggleExpanded!, isExpanded: isExpanded),
              )
          ],
        ),
      ),
    );
  }
}
