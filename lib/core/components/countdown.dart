import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';

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
    final _textStyle = textStyle ?? TextStyle(fontSize: 22, color: Theme.of(context).colorScheme.secondary, fontWeight: FontWeight.bold);

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF040f26),
        boxShadow: [
          BoxShadow(
            offset: Offset.zero,
            blurRadius: 5,
            color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            spreadRadius: 4,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
              finishedText: "Reload Page!",
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
