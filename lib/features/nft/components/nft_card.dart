import 'package:flutter/material.dart';
import 'package:rbx_wallet/core/components/badges.dart';
import 'package:rbx_wallet/core/components/buttons.dart';
import 'package:rbx_wallet/core/theme/app_theme.dart';
import 'package:rbx_wallet/features/nft/models/nft.dart';
import 'package:rbx_wallet/features/nft/screens/nft_detail_screen.dart';
import 'package:rbx_wallet/features/nft/services/nft_service.dart';
import 'package:rbx_wallet/utils/toast.dart';

class NftCard extends StatelessWidget {
  final Nft nft;
  const NftCard(this.nft, {Key? key}) : super(key: key);

  Future<void> _showDetails(BuildContext context) async {
    final details = await NftService().retrieve(nft.id);
    if (details == null) {
      Toast.error();
      return;
    }
    final _nft = nft.copyWith(code: details.code);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) {
          return NftDetailScreen(_nft);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // return ListTile(
    //   onTap: () {
    //     _showDetails(context);
    //   },
    //   title: Text(nft.name),
    //   subtitle: Text(nft.description),
    //   leading: Builder(
    //     builder: (context) {
    //       if (nft.primaryAsset.isImage) {
    //         return Image.file(
    //           nft.primaryAsset.file,
    //           width: 32,
    //           height: 32,
    //           fit: BoxFit.contain,
    //         );
    //       }
    //       return Icon(Icons.file_present_outlined);
    //     },
    //   ),
    //   trailing: Icon(Icons.chevron_right),
    // );

    return InkWell(
      onTap: () async {
        _showDetails(context);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                nft.name,
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                nft.description,
                style: Theme.of(context).textTheme.subtitle1,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Divider(),
              Text(
                "Asset type: ${nft.primaryAsset.fileType}",
                style: Theme.of(context).textTheme.caption,
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                // color: Colors.black87,
                child: nft.primaryAsset.isImage
                    ? AspectRatio(
                        aspectRatio: 3,
                        child: Image.file(
                          nft.primaryAsset.file,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Icon(Icons.file_present_outlined),
              ),
              Divider(),
              // Text("Features:", style: Theme.of(context).textTheme.bodyMedium),
              // if (nft.features.isEmpty) Text("No features"),
              SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: nft.featureList
                      .map(
                        (f) => ListTile(
                          dense: true,
                          visualDensity: VisualDensity.compact,
                          contentPadding: EdgeInsets.zero,
                          // leading: Icon(f.icon),
                          title: Text(f.nameLabel),
                          subtitle: Text(f.description),
                        ),
                      )
                      .toList(),
                ),
              ),
              // AppButton(
              //   label: "View",
              //   onPressed: () {
              //     _showDetails(context);
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
