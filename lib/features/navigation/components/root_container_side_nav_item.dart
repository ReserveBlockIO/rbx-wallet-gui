import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../root_container.dart';

class RootContainerSideNavItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final IconData icon;
  final bool isActive;
  final bool isExpanded;
  const RootContainerSideNavItem({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
    required this.isActive,
    required this.isExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPressed,
        child: AnimatedContainer(
          duration: ROOT_CONTAINER_TRANSITION_DURATION,
          decoration: BoxDecoration(color: isActive ? AppColors.getBlue() : Colors.white30),
          child: Padding(
            padding: const EdgeInsets.only(left: 2),
            child: AnimatedContainer(
              duration: ROOT_CONTAINER_TRANSITION_DURATION,
              decoration: BoxDecoration(
                  color: isActive ? AppColors.getGray(ColorShade.s50) : AppColors.getGray(ColorShade.s200),
                  border: Border(
                    top: BorderSide(
                      color: isActive ? AppColors.getBlue().withOpacity(0.1) : Colors.transparent,
                    ),
                    bottom: BorderSide(
                      color: isActive ? AppColors.getBlue().withOpacity(0.05) : Colors.transparent,
                    ),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  children: [
                    AnimatedContainer(
                      duration: ROOT_CONTAINER_TRANSITION_DURATION,
                      decoration: BoxDecoration(
                        color: AppColors.getIndigo(),
                      ),
                      width: 3,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        icon,
                        size: 20,
                        color: isActive ? AppColors.getBlue(ColorShade.s100) : AppColors.getWhite(ColorShade.s400),
                      ),
                    ),
                    Flexible(
                      child: AnimatedOpacity(
                        duration: ROOT_CONTAINER_TRANSITION_DURATION,
                        opacity: isExpanded ? 1 : 0,
                        child: Text(
                          title,
                          overflow: TextOverflow.visible,
                          softWrap: false,
                          style: TextStyle(
                            color: isActive ? AppColors.getBlue(ColorShade.s100) : AppColors.getWhite(ColorShade.s400),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
