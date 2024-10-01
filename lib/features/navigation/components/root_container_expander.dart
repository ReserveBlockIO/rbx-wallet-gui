import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../root_container.dart';

class RootContainerExpander extends StatelessWidget {
  const RootContainerExpander({
    super.key,
    required this.onToggleExpanded,
    required this.isExpanded,
  });

  final VoidCallback onToggleExpanded;
  final bool isExpanded;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onToggleExpanded,
        child: Row(
          children: [
            Container(
              width: 3,
              height: 16,
              decoration: BoxDecoration(
                color: Colors.white30,
                border: Border(
                  left: BorderSide(
                    color: AppColors.getGray(ColorShade.s200),
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.getGray(ColorShade.s100),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(6),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
                child: AnimatedRotation(
                  duration: ROOT_CONTAINER_TRANSITION_DURATION,
                  curve: ROOT_CONTAINER_TRANSITION_CURVE,
                  turns: isExpanded ? 0.5 : 0,
                  child: Icon(
                    Icons.double_arrow,
                    size: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
