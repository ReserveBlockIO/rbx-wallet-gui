import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../breakpoints.dart';

class BigButton extends StatelessWidget {
  final String title;
  final String body;
  final IconData iconData;
  final Function() onPressed;
  const BigButton({
    Key? key,
    required this.title,
    required this.body,
    required this.iconData,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isMobile = BreakPoints.useMobileLayout(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 600,
        decoration: BoxDecoration(
          color: AppColors.getBlue(ColorShade.s400),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColors.getBlue(ColorShade.s50).withOpacity(0.75), width: 1),
          boxShadow: [
            BoxShadow(
                blurRadius: 12.0,
                color: AppColors.getBlue(
                  ColorShade.s300,
                )),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    iconData,
                    size: isMobile ? 20 : 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: isMobile
                          ? Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                          : Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      body,
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
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
