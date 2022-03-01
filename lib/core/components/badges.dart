import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';

class AppBadge extends StatelessWidget {
  final AppColorVariant variant;
  final String label;

  const AppBadge({
    Key? key,
    required this.label,
    this.variant = AppColorVariant.Primary,
  }) : super(key: key);

  Color get _textColor {
    switch (variant) {
      case AppColorVariant.Light:
        return Colors.black;
      default:
        return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.appVariantToColor(context, variant),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          label,
          style: TextStyle(
            color: _textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
