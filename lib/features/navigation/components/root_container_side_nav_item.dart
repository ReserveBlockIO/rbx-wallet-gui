import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';
import '../../../core/theme/pretty_icons.dart';
import '../root_container.dart';

class RootContainerSideNavItem extends StatefulWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isActive;
  final bool isExpanded;
  final PrettyIconType iconType;
  final IconData? icon;
  const RootContainerSideNavItem({
    super.key,
    required this.title,
    required this.onPressed,
    required this.isActive,
    required this.isExpanded,
    required this.iconType,
    this.icon,
  });

  @override
  State<RootContainerSideNavItem> createState() => _RootContainerSideNavItemState();
}

class _RootContainerSideNavItemState extends State<RootContainerSideNavItem> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (_) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovering = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: ROOT_CONTAINER_TRANSITION_DURATION,
          decoration: BoxDecoration(color: widget.isActive ? AppColors.getBlue() : Colors.white30),
          child: Padding(
            padding: const EdgeInsets.only(left: 2),
            child: AnimatedContainer(
              duration: ROOT_CONTAINER_TRANSITION_DURATION,
              decoration: BoxDecoration(
                  color: widget.isActive
                      ? AppColors.getGray(ColorShade.s50)
                      : isHovering
                          ? AppColors.getGray(ColorShade.s100)
                          : AppColors.getGray(ColorShade.s200),
                  border: Border(
                    top: BorderSide(
                      color: widget.isActive ? AppColors.getBlue().withOpacity(0.1) : Colors.transparent,
                    ),
                    bottom: BorderSide(
                      color: widget.isActive ? AppColors.getBlue().withOpacity(0.05) : Colors.transparent,
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
                      child: Tooltip(
                          message: widget.isExpanded ? "" : widget.title,
                          child: PrettyIcon(
                            customIcon: widget.icon,
                            type: widget.iconType,
                            glow: isHovering || widget.isActive,
                          )),
                    ),
                    Flexible(
                      child: AnimatedOpacity(
                        duration: ROOT_CONTAINER_TRANSITION_DURATION,
                        opacity: widget.isExpanded ? 1 : 0,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Text(
                            widget.title,
                            overflow: TextOverflow.visible,
                            softWrap: false,
                            style: TextStyle(
                              fontSize: 15,
                              color: widget.isActive
                                  ? AppColors.getBlue(ColorShade.s100)
                                  : isHovering
                                      ? AppColors.getWhite(ColorShade.s200)
                                      : AppColors.getWhite(ColorShade.s400).withOpacity(0.9),
                            ),
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
