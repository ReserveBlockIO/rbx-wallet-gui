import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/providers/web_session_provider.dart';

class WebWalletDetails extends BaseComponent {
  const WebWalletDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionModel = ref.watch(webSessionProvider);
    final keypair = sessionModel.keypair;
    if (keypair == null) {
      return Container();
    }

    return Card(
      margin: EdgeInsets.zero,
      // color: Color(0xFF050505),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
      child: ListTile(
        title: SelectableText(
          keypair.public,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 13),
        ),
        subtitle: sessionModel.balance != null
            ? Text(
                "${sessionModel.balance} RBX",
                style: Theme.of(context).textTheme.caption,
              )
            : null,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.copy,
                    size: 20,
                  ),
                )),
            InkWell(
                onTap: () {},
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.remove_red_eye,
                    size: 20,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
