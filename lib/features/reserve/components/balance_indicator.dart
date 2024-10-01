import 'package:flutter/material.dart';

class BalanceIndicator extends StatelessWidget {
  final String label;
  final double? value;
  final Color bgColor;
  final Color fgColor;
  final String currencyLabel;
  final bool withLabel;
  const BalanceIndicator({
    super.key,
    required this.label,
    required this.value,
    required this.bgColor,
    required this.fgColor,
    this.currencyLabel = "VFX",
    this.withLabel = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (withLabel)
            Text(
              "$label: ",
              style: TextStyle(fontSize: 12),
            ),
          ConstrainedBox(
            constraints: BoxConstraints(minWidth: 200),
            child: Container(
              decoration: BoxDecoration(
                  color: bgColor, borderRadius: BorderRadius.circular(4.0)),
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 1, left: 4, right: 4, bottom: 2),
                child: Text(
                  "$value $currencyLabel",
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: fgColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
