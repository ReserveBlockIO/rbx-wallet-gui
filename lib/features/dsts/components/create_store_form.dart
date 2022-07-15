import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rbx_wallet/core/base_component.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/web_router.gr.dart';
import 'package:rbx_wallet/features/dsts/providers/create_store_provider.dart';
import 'package:rbx_wallet/utils/toast.dart';

class CreateStoreForm extends BaseComponent {
  final String accountId;
  const CreateStoreForm({
    Key? key,
    required this.accountId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(createStoreProvider(accountId).notifier);
    final store = ref.watch(createStoreProvider(accountId));

    return Form(
      key: provider.formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: provider.stripeController,
            validator: provider.stripeValidator,
            readOnly: true,
            decoration: InputDecoration(
              label: Text("Stripe Account"),
              suffixIcon: ElevatedButton(
                child: Text("Setup Account"),
                onPressed: () async {
                  provider.onboardStripe();
                },
              ),
            ),
          ),
          TextFormField(
            controller: provider.nameController,
            validator: provider.nameValidator,
            decoration: InputDecoration(label: Text("Store Name")),
          ),
          Divider(),
          AppButton(
            label: "Create",
            onPressed: () async {
              final s = await provider.submit();
              if (s != null) {
                Toast.message("Store created");
                AutoRouter.of(context).push(StoreScreenRoute(slug: s.slug));
              }
            },
          )
        ],
      ),
    );
  }
}
