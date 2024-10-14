import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_component.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/components.dart';
import '../../smart_contracts/components/sc_creator/common/modal_container.dart';
import '../models/transaction.dart';
import '../../wallet/components/wallet_selector.dart';
import '../../wallet/providers/wallet_list_provider.dart';

import '../providers/vfx_transaction_filter_provider.dart';
import '../tx_helpers.dart';

class VfxTransactionFilterButton extends BaseComponent {
  const VfxTransactionFilterButton({
    super.key,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final model = ref.watch(vfxTransactionFilterProvider);

    return IconButton(
      icon: SizedBox(
        width: 32,
        height: 32,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Icon(Icons.filter_alt),
            if (model.filterCount > 0)
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.red.shade700,
                    borderRadius: BorderRadius.circular(7.0),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.7),
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Transform.translate(
                      offset: Offset(0, 1),
                      child: Text(
                        "${model.filterCount}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) {
            return _VfxTransactionFilterBottomSheet();
          },
        );
      },
    );
  }
}

class _VfxTransactionFilterBottomSheet extends BaseComponent {
  const _VfxTransactionFilterBottomSheet({
    super.key,
  });

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final provider = ref.read(vfxTransactionFilterProvider.notifier);
    final model = ref.watch(vfxTransactionFilterProvider);
    final txHelpers = TxHelper.getAllTypes();

    return ModalContainer(
      withClose: false,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Transaction Filters",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {
                    provider.clear();
                  },
                  child: Text(
                    "Clear Filters",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Close",
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 8),
        SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Text(
                "Tx Type${model.txTypes.isEmpty ? '' : ' (${model.txTypes.length})'}:",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            if (!kIsWeb)
              PopupMenuButton<String>(
                constraints: BoxConstraints(minWidth: 300),
                color: Colors.black,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      model.address.isEmpty ? "All Addresses" : model.address,
                      style: TextStyle(
                        fontSize: 16,
                        color: model.address.isEmpty
                            ? Colors.white
                            : model.address.startsWith("xRBX")
                                ? AppColors.getReserve()
                                : AppColors.getBlue(ColorShade.s50),
                      ),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                onSelected: (address) {
                  if (address.isEmpty) {
                    provider.setAddress(null);
                  } else {
                    provider.setAddress(address);
                  }
                },
                itemBuilder: (context) {
                  final wallets = ref.watch(walletListProvider);

                  return [
                    PopupMenuItem(
                      value: "",
                      child: Row(
                        children: [
                          Icon(
                            model.address == "" ? Icons.check_box : Icons.check_box_outline_blank,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Text("All Addresses"),
                        ],
                      ),
                    ),
                    ...wallets.map((w) {
                      final color = w.address.startsWith("xRBX") ? AppColors.getReserve() : AppColors.getBlue(ColorShade.s50);
                      return PopupMenuItem<String>(
                        value: w.address,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              w.address == model.address ? Icons.check_box : Icons.check_box_outline_blank,
                              color: color,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              w.address,
                              style: TextStyle(color: color),
                            ),
                          ],
                        ),
                      );
                    }).toList()
                  ];
                },
              ),
          ],
        ),
        SizedBox(height: 8),
        AppCard(
          fullWidth: true,
          padding: 8,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: txHelpers.map((t) {
              return SizedBox(
                width: 180,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Checkbox(
                        value: model.txTypes.contains(t.type),
                        onChanged: (value) {
                          if (value == true) {
                            provider.addTxType(t.type);
                          } else if (value == false) {
                            provider.removeTxType(t.type);
                          }
                        }),
                    SizedBox(
                      width: 2,
                    ),
                    Text(t.typeName),
                  ],
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
