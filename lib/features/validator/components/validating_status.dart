import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/features/validator/providers/validating_status_provider.dart';
import 'package:rbx_wallet/features/validator/screens/validator_screen.dart';

class ValidatingStatus extends BaseComponent {
  const ValidatingStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final status = ref.watch(validatingStatusProvider);

    if (status) {
      return Container(
        width: double.infinity,
        color: Colors.green.shade800,
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const RotatingGear(
                size: 18,
              ),
              const Text(
                "Validating...",
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
