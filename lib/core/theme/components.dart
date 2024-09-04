import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/theme/colors.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final bool fullWidth;
  const AppCard({
    super.key,
    required this.child,
    this.fullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: fullWidth ? double.infinity : null,
      decoration: BoxDecoration(
          color: AppColors.getGray(ColorShade.s200),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.white.withOpacity(0.075),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.getBlue().withOpacity(0.2),
              blurRadius: 12,
            )
          ]),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: child,
      ),
    );
  }
}
