import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/dialogs.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/utils/toast.dart';
import 'package:rbx_wallet/utils/validation.dart';

class VerifyNftOwnershipButton extends StatelessWidget {
  const VerifyNftOwnershipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppButton(
      label: "Verify NFT Ownership",
      icon: Icons.security,
      onPressed: () async {
        final sig = await PromptModal.show(
          title: "Validate Ownership",
          body: "Paste in the signature provided by the owner to validate its ownership.",
          validator: (val) => formValidatorNotEmpty(val, "Signature"),
          labelText: "Signature",
        );

        if (sig != null && sig.isNotEmpty) {
          final components = sig.split("<>");
          if (components.length != 4) {
            Toast.error("Invalid ownership verification signature");
            return;
          }

          final address = components.first;
          final scId = components.last;

          final verified = await NftService().verifyOwnership(sig);

          if (verified == null) {
            return;
          }
          final color = verified ? Theme.of(context).colorScheme.success : Theme.of(context).colorScheme.danger;
          final iconData = verified ? Icons.check : Icons.close;
          final title = verified ? "Verified" : "Not Verified";
          final subtitle = verified ? "Ownership Verified" : "Ownership NOT Verified";
          final body = verified ? "$address\nOWNS\n$scId" : "$address\ndoes NOT own\n$scId";

          InfoDialog.show(
            title: title,
            content: SizedBox(
              width: 420,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        iconData,
                        color: color,
                        size: 32,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 20,
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    body,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
