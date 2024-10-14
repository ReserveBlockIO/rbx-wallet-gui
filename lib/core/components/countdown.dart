import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import '../theme/components.dart';

class AppCountdown extends StatelessWidget {
  final DateTime dueDate;
  final String prefix;
  final TextStyle? textStyle;

  const AppCountdown({
    Key? key,
    required this.dueDate,
    required this.prefix,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _textStyle = textStyle ??
        TextStyle(
          fontSize: 22,
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.w500,
        );

    return AppCard(
      padding: 8,
      child: Padding(
        padding: const EdgeInsets.only(left: 6.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$prefix: ",
              style: _textStyle.copyWith(
                color: Colors.white.withOpacity(0.9),
                letterSpacing: 1,
              ),
            ),
            CountDownText(
              due: dueDate,
              finishedText: "",
              style: _textStyle,
              longDateName: true,
              showLabel: true,
              daysTextLong: "d ",
              hoursTextLong: "h ",
              minutesTextLong: "m ",
              secondsTextLong: "s ",
            ),
          ],
        ),
      ),
    );
  }
}
