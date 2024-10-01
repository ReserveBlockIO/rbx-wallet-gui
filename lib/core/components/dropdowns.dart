import 'package:flutter/material.dart';

class AppDropdownOption<T> {
  final String label;
  final T value;

  const AppDropdownOption({required this.label, required this.value});
}

class AppDropdown<T> extends StatelessWidget {
  final String label;
  final T selectedValue;
  final String selectedLabel;
  final List<AppDropdownOption> options;
  final Function(T option) onChange;

  const AppDropdown({
    Key? key,
    required this.label,
    required this.selectedValue,
    required this.selectedLabel,
    this.options = const [],
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<AppDropdownOption>(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "$label:",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(selectedLabel),
            ],
          ),
          const Icon(Icons.arrow_drop_down),
        ],
      ),
      onSelected: (option) {
        onChange(option.value);
        // _provider.updateType(val);
      },
      itemBuilder: (context) {
        return options
            .map<PopupMenuEntry<AppDropdownOption>>(
              (option) => PopupMenuItem(
                value: option,
                child: Text(option.label),
              ),
            )
            .toList();
      },
    );
  }
}
