import 'package:flutter/material.dart';
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
        decoration: BoxDecoration(
          // color: Theme.of(context).colorScheme.primary,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Theme.of(context).colorScheme.secondary.withOpacity(0.1), width: 3),
          boxShadow: const [
            BoxShadow(blurRadius: 12.0, color: Colors.white12),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    iconData,
                    size: isMobile ? 24 : 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: isMobile
                          ? Theme.of(context).textTheme.headline6!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              )
                          : Theme.of(context).textTheme.headline4!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: Text(
                      body,
                      style: Theme.of(context).textTheme.bodyText2,
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
