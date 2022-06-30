import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/utils/files.dart';
import 'package:rbx_wallet/utils/toast.dart';

class NftQrCode extends StatelessWidget {
  final String data;
  const NftQrCode({
    Key? key,
    required this.data,
  }) : super(key: key);

  Future<void> writeToFile(ByteData data, String path) async {
    final buffer = data.buffer;
    await File(path).writeAsBytes(
        buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

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
            const SizedBox(
              height: 8,
            ),
            AppButton(
              label: "Save",
              onPressed: () async {
                final qrValidationResult = QrValidator.validate(
                  data: data,
                  version: QrVersions.auto,
                  errorCorrectionLevel: QrErrorCorrectLevel.L,
                );
                final qrCode = qrValidationResult.qrCode;
                if (qrCode == null) {
                  Toast.error();
                  return;
                }

                final painter = QrPainter.withQr(
                  qr: qrCode,
                  color: const Color(0xFF000000),
                  gapless: true,
                  embeddedImageStyle: null,
                  embeddedImage: null,
                  emptyColor: Colors.white,
                );

                Directory tempDir = await getTemporaryDirectory();
                String tempPath = tempDir.path;
                final ts = DateTime.now().millisecondsSinceEpoch.toString();
                String path =
                    '$tempPath${Platform.isWindows ? '\\' : '/'}$ts.png';

                final picData = await painter.toImageData(2048,
                    format: ImageByteFormat.png);
                if (picData == null) {
                  return;
                }

                await writeToFile(picData, path);
                openFile(File(path));
              },
              icon: Icons.download,
            )
          ],
        ),
      ),
    );
  }
}
