import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/theme/colors.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final bool fullWidth;
  final Color? color;
  final Color? borderColor;
  final double glowOpacity;
  final double padding;
  final Duration? animationDuration;
  final bool fullHeight;
  final EdgeInsets? margin;
  const AppCard({
    super.key,
    required this.child,
    this.fullWidth = false,
    this.color,
    this.glowOpacity = 0.2,
    this.padding = 20.0,
    this.borderColor,
    this.animationDuration,
    this.fullHeight = false,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: margin ?? EdgeInsets.zero,
      duration: animationDuration ?? Duration(milliseconds: 150),
      width: fullWidth ? double.infinity : null,
      height: fullHeight ? double.infinity : null,
      decoration: BoxDecoration(
          color: color ?? AppColors.getGray(ColorShade.s200),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor ?? Colors.white.withOpacity(0.075),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.getBlue().withOpacity(glowOpacity),
              blurRadius: 12,
            )
          ]),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: child,
      ),
    );
  }
}

enum AppVerticalIconButtonSize {
  sm(60, 24, 18, 12),
  md(80, 32, 24, 16),
  lg(120, 48, 36, 24);

  final double wrapSize;
  final double circleSize;
  final double iconSize;
  final double fontSize;
  const AppVerticalIconButtonSize(
    this.wrapSize,
    this.circleSize,
    this.iconSize,
    this.fontSize,
  );
}

class AppVerticalIconButton extends StatefulWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;
  final Color? color;
  final Color? hoverColor;
  final AppVerticalIconButtonSize size;
  const AppVerticalIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    this.color,
    this.hoverColor,
    this.size = AppVerticalIconButtonSize.md,
  });

  @override
  State<AppVerticalIconButton> createState() => _AppVerticalIconButtonState();
}

class _AppVerticalIconButtonState extends State<AppVerticalIconButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final isFontAwesome = widget.icon.fontPackage.toString().contains("font_awesome_flutter");

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (v) {
        setState(() {
          isHovering = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onPressed,
        child: SizedBox(
          width: widget.size.wrapSize,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    width: widget.size.circleSize,
                    height: widget.size.circleSize,
                    decoration: BoxDecoration(
                      color:
                          isHovering ? widget.hoverColor ?? AppColors.getWhite(ColorShade.s50) : widget.color ?? AppColors.getWhite(ColorShade.s400),
                      borderRadius: isHovering ? BorderRadius.circular(8) : BorderRadius.circular(widget.size.circleSize / 2),
                    ),
                    child: Center(
                      child: Transform.scale(
                        scale: isFontAwesome ? 0.7 : 1,
                        child: Icon(
                          widget.icon,
                          color: Colors.black,
                          size: widget.size.iconSize,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.label,
                    style: TextStyle(
                      color:
                          isHovering ? widget.hoverColor ?? AppColors.getWhite(ColorShade.s50) : widget.color ?? AppColors.getWhite(ColorShade.s400),
                      fontSize: widget.size.fontSize,
                      height: 1.1,
                    ),
                    textAlign: TextAlign.center,
                    softWrap: false,
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
