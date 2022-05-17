import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rbx_wallet/core/components/buttons.dart';

class NftQrCode extends StatelessWidget {
  final String data;
  const NftQrCode({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: Colors.white,
              child: QrImage(
                data: data,
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            AppButton(
              label: "Save",
              onPressed: () {
                //TODO: implement save
              },
              icon: Icons.download,
            )
          ],
        ),
      ),
    );
  }
}
