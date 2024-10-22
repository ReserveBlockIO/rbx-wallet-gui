import 'dart:ui';

import 'package:flutter/material.dart';
import 'colors.dart';

enum PrettyIconType {
  bitcoin('bitcoin'),
  dashboard('dashboard'),
  fungibleToken('fungible_token'),
  lock('lock'),
  nft('nft'),
  operations('operations'),
  domain('domain'),
  p2p('p2p', 1.1),
  receive('receive'),
  send('send'),
  smartContract('smart_contract'),
  transactions('transactions'),
  validator('validator'),
  custom('custom'),
  topCards('custom', 1.4),
  ;

  final String assetName;
  final double scale;
  const PrettyIconType(this.assetName, [this.scale = 1.0]);
}

class PrettyIcon extends StatelessWidget {
  final PrettyIconType type;
  final IconData? customIcon;
  final Color? customIconColor;
  final bool glow;
  final double iconScale;

  const PrettyIcon({
    super.key,
    required this.type,
    this.glow = false,
    this.customIcon,
    this.customIconColor,
    this.iconScale = 1,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: glow ? Color(0xffffedce).withOpacity(0.44) : Colors.transparent,
              blurRadius: 8.0,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Transform.scale(
          scale: type.scale,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/images/icons/${type.assetName}.png',
                width: 24,
                height: 24,
                isAntiAlias: true,
              ),
              if ((type == PrettyIconType.custom || type == PrettyIconType.topCards) && customIcon != null)
                Icon(
                  customIcon,
                  color: customIconColor ?? AppColors.getGray(),
                  size: iconScale * 18,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class PrettyIconButton extends StatefulWidget {
  final PrettyIconType type;
  final VoidCallback? onPressed;
  final IconData? customIcon;
  final Color? customIconColor;
  final double iconScale;

  const PrettyIconButton({
    super.key,
    required this.type,
    required this.onPressed,
    this.customIcon,
    this.customIconColor,
    this.iconScale = 1.0,
  });

  @override
  State<PrettyIconButton> createState() => _PrettyIconButtonState();
}

class _PrettyIconButtonState extends State<PrettyIconButton> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        cursor: widget.onPressed != null ? SystemMouseCursors.click : MouseCursor.defer,
        onHover: (_) {
          if (widget.onPressed == null) return;

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
          child: PrettyIcon(
            type: widget.type,
            customIcon: widget.customIcon,
            customIconColor: widget.customIconColor,
            glow: isHovering,
            iconScale: widget.iconScale,
          ),
        ),
      ),
    );
  }
}
