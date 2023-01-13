import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/base_screen.dart';
import '../../../core/components/centered_loader.dart';
import '../components/store_listings.dart';
import '../providers/store_detail_provider.dart';

class StoreScreen extends BaseScreen {
  final String slug;

  const StoreScreen({
    Key? key,
    @PathParam('slug') required this.slug,
  }) : super(key: key, verticalPadding: 0, horizontalPadding: 0, backgroundColor: Colors.black);

  @override
  AppBar? appBar(BuildContext context, WidgetRef ref) {
    final data = ref.watch(storeDetailProvider(slug));

    return data.when(
      loading: () => AppBar(
        backgroundColor: Colors.black,
        shadowColor: Colors.transparent,
      ),
      error: (_, __) => AppBar(
        title: Text("Error"),
        backgroundColor: Colors.black,
        shadowColor: Colors.transparent,
      ),
      data: (store) => store == null
          ? AppBar(
              title: Text("404 Error"),
              backgroundColor: Colors.black,
              shadowColor: Colors.transparent,
            )
          : AppBar(
              // title: Text("ReserveBlock"),

              backgroundColor: Colors.black,
              shadowColor: Colors.transparent,
              title: Text(store.name)),
    );
  }

  @override
  Widget body(BuildContext context, WidgetRef ref) {
    final data = ref.watch(storeDetailProvider(slug));

    return data.when(
      loading: () => CenteredLoader(),
      error: (_, __) => Center(child: Text("404 not found.")),
      data: (store) => store == null ? Center(child: Text("404 not found.")) : StoreListings(store),
    );
  }
}
