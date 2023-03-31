import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/bridge/providers/wallet_info_provider.dart';
import '../app_constants.dart';

class IsActiveModel {
  final bool isActive;
  final DateTime latestActivity;

  const IsActiveModel({required this.isActive, required this.latestActivity});

  IsActiveModel copyWith({bool? isActive, DateTime? latestActivity}) {
    return IsActiveModel(
      isActive: isActive ?? this.isActive,
      latestActivity: latestActivity ?? this.latestActivity,
    );
  }
}

class IsActiveProvider extends StateNotifier<IsActiveModel> {
  final Ref ref;
  IsActiveProvider(this.ref, IsActiveModel model) : super(model);

  init() {
    checkForRecentActivity();
  }

  Future<void> checkForRecentActivity() async {
    await Future.delayed(const Duration(seconds: 10));

    if (state.isActive) {
      final now = DateTime.now();
      if (now.difference(state.latestActivity) > const Duration(seconds: 5)) {
        deactivate();
      }
    }

    checkForRecentActivity();
  }

  activate() {
    if (!state.isActive) {
      catchUpAfterDeactivation();
    }
    state = IsActiveModel(isActive: true, latestActivity: DateTime.now());
  }

  deactivate() {
    state = IsActiveModel(isActive: false, latestActivity: DateTime.now());
  }

  Future<void> catchUpAfterDeactivation() async {
    final loopCount = (REFRESH_TIMEOUT_SECONDS_INACTIVE / REFRESH_TIMEOUT_SECONDS).round();

    for (var i = 0; i < loopCount; i++) {
      ref.read(walletInfoProvider.notifier).infoLoop(false);
      if (!state.isActive) {
        return;
      }
      await Future.delayed(const Duration(seconds: REFRESH_TIMEOUT_SECONDS));
      catchUpAfterDeactivation();
    }
  }
}

final isActiveProvider = StateNotifierProvider<IsActiveProvider, IsActiveModel>(
  (ref) {
    final model = IsActiveModel(isActive: true, latestActivity: DateTime.now());
    return IsActiveProvider(ref, model);
  },
);
