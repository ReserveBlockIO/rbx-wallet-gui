import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../theme/colors.dart';

class AppBadge extends StatelessWidget {
  final AppColorVariant variant;
  final String label;
  final bool progressAnimation;
  final ColorShade shade;
  const AppBadge({
    Key? key,
    required this.label,
    this.progressAnimation = false,
    this.variant = AppColorVariant.Primary,
    this.shade = ColorShade.s100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.colorVariantToColor(variant, shade),
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(
            color: Colors.white.withOpacity(0.3),
          )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3).copyWith(top: 5),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (progressAnimation)
              Padding(
                padding: const EdgeInsets.only(right: 6.0),
                child: SizedBox(
                  width: 12,
                  height: 12,
                  child: CircularProgressIndicator(
                    color: AppColors.colorVariantToColorFg(variant),
                    strokeWidth: 2.0,
                  ),
                ),
              ),
            Text(
              label,
              style: TextStyle(
                color: AppColors.colorVariantToColorFg(variant),
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
