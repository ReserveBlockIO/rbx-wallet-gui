import 'package:flutter/material.dart';

import '../../../core/theme/colors.dart';

class RootContainerBalanceRowConnector extends StatelessWidget {
  const RootContainerBalanceRowConnector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: Transform.scale(
        scale: 1.5,
        child: Container(
          width: 16,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.03),
            border: Border.symmetric(
              horizontal: BorderSide(
                color: Colors.white.withOpacity(0.075),
                width: 2,
              ),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.getBlue().withOpacity(0.2),
                blurRadius: 12,
              )
            ],
          ),
        ),
      ),
    );
  }
}
