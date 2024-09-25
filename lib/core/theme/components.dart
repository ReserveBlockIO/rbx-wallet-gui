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
        child: Container(
          width: widget.size.wrapSize,
          color: Colors.transparent,
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

class VBtcButton extends StatefulWidget {
  final String label;
  final Function()? onPressed;
  final IconData? icon;

  const VBtcButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
  });

  @override
  State<VBtcButton> createState() => _VBtcButtonState();
}

class _VBtcButtonState extends State<VBtcButton> {
  bool isHovering = false;
  bool isPressingDown = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: MouseRegion(
        cursor: widget.onPressed != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
        onExit: (_) {
          setState(() {
            isHovering = false;
            isPressingDown = false;
          });
        },
        onHover: (_) {
          setState(() {
            isHovering = true;
          });
        },
        child: GestureDetector(
          onTap: widget.onPressed,
          onTapDown: (_) {
            setState(() {
              isPressingDown = true;
            });
          },
          onTapUp: (_) {
            setState(() {
              isPressingDown = false;
            });
          },
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 100),
            opacity: isPressingDown ? 0.8 : 1,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: isHovering ? 1 : 0.2,
                  child: Image.asset(
                    'assets/images/connector1.png',
                    width: 155 / 6,
                    height: 118 / 6,
                    isAntiAlias: true,
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: isHovering ? Colors.white : AppColors.getBlue(ColorShade.s100),
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: isHovering ? Colors.white : Colors.black,
                        blurRadius: isHovering ? 8 : 4,
                      )
                    ],
                    gradient: LinearGradient(
                      begin: isHovering ? Alignment.bottomCenter : Alignment.topCenter,
                      end: isHovering ? Alignment.topCenter : Alignment.bottomCenter,
                      stops: isHovering ? [0, .5, .7] : [0, .3, .8],
                      colors: [
                        AppColors.getBlue(ColorShade.s100),
                        AppColors.getBlue(ColorShade.s200),
                        AppColors.getBtc(),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.icon != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              widget.icon,
                              size: 16,
                              shadows: [
                                Shadow(
                                  color: Colors.black,
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        Transform.translate(
                          offset: Offset(0, 2),
                          child: Text(
                            widget.label,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: 16,
                              letterSpacing: .4,
                              height: 1,
                              shadows: [
                                Shadow(
                                  color: Colors.black.withOpacity(.8),
                                  blurRadius: 4,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedOpacity(
                  duration: Duration(milliseconds: 300),
                  opacity: isHovering ? 1 : 0.2,
                  child: Image.asset(
                    'assets/images/connector2.png',
                    width: 155 / 6,
                    height: 118 / 6,
                    isAntiAlias: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
