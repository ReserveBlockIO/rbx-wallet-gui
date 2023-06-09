import 'dart:convert';
import 'dart:io';
import 'package:mime/mime.dart';
import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
import 'package:csv/csv.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rbx_wallet/features/bridge/providers/log_provider.dart';
import 'package:rbx_wallet/features/raw/raw_service.dart';
import 'package:rbx_wallet/features/smart_contracts/providers/sc_wizard_log_provider.dart';
import '../../../core/utils.dart';
import '../../sc_property/models/sc_property.dart';
import '../features/evolve/evolve.dart';
import '../features/evolve/evolve_phase.dart';
import '../features/evolve/evolve_phase_wizard_form_provider.dart';
import '../models/multi_asset.dart';
import 'package:path/path.dart';
import '../../../utils/guards.dart';
import '../../../utils/validation.dart';

import '../../../core/providers/session_provider.dart';
import '../../../core/providers/web_session_provider.dart';
import '../../../utils/toast.dart';
import '../../asset/asset.dart';
import '../../nft/providers/minted_nft_list_provider.dart';
import '../../nft/providers/nft_list_provider.dart';
import '../../nft/services/nft_service.dart';
import '../components/sc_wizard_minting_progress_dialog.dart';
import '../features/royalty/royalty.dart';
import '../models/bulk_smart_contract_entry.dart';
import '../models/smart_contract.dart';
import '../services/smart_contract_service.dart';
import 'my_smart_contracts_provider.dart';
import 'property_wizard_form_provider.dart';
import 'sc_wizard_minting_progress_provider.dart';

const LOG_HISTORY_LENGTH = 1000;

class ScWizardItem {
  final BulkSmartContractEntry entry;
  final int index;
  final int x;
  final int y;

  const ScWizardItem({
    required this.entry,
    this.index = 0,
    this.x = 0,
    this.y = 0,
  });

  ScWizardItem copyWith({BulkSmartContractEntry? entry, int? index, int? x, int? y}) {
    return ScWizardItem(
      entry: entry ?? this.entry,
      index: index ?? this.index,
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  factory ScWizardItem.empty([int x = 0, int y = 0, int index = 0]) {
    return ScWizardItem(
      x: x,
      index: index,
      y: y,
      entry: BulkSmartContractEntry.empty(),
    );
  }
}

class ScWizardProvider extends StateNotifier<List<ScWizardItem>> {
  final Ref ref;
  final ScrollController scrollController = ScrollController();

  ScWizardProvider(this.ref, [List<ScWizardItem> model = const []]) : super(model);

  void insert({
    required BulkSmartContractEntry entry,
    required int index,
    required int y,
    required int x,
  }) {
    state = [
      ...state,
      ScWizardItem(
        entry: entry,
        index: index,
        y: y,
        x: x,
      )
    ];
  }

  ScWizardItem? itemAtCoords(int x, int y) {
    return state.firstWhereOrNull((item) => item.x == x && item.y == y);
  }

  ScWizardItem? itemAtIndex(int index) {
    return state[index];
  }

  void updateName(int index, String value) {
    ScWizardItem? item = itemAtIndex(index);
    if (item == null) return;
    item = item.copyWith(entry: item.entry.copyWith(name: value));

    state = [...state]
      ..removeAt(index)
      ..insert(index, item);
  }

  void updateCreatorName(int index, String value) {
    ScWizardItem? item = itemAtIndex(index);
    if (item == null) return;
    item = item.copyWith(entry: item.entry.copyWith(creatorName: value));

    state = [...state]
      ..removeAt(index)
      ..insert(index, item);
  }

  void updateDescription(int index, String value) {
    ScWizardItem? item = itemAtIndex(index);
    if (item == null) return;
    item = item.copyWith(entry: item.entry.copyWith(description: value));

    state = [...state]
      ..removeAt(index)
      ..insert(index, item);
  }

  void updateQuantity(int index, int value) {
    ScWizardItem? item = itemAtIndex(index);
    if (item == null) return;
    item = item.copyWith(entry: item.entry.copyWith(quantity: value));

    state = [...state]
      ..removeAt(index)
      ..insert(index, item);
  }

  void updatePrimaryAsset(int index, Asset? value) {
    ScWizardItem? item = itemAtIndex(index);

    if (item == null) return;

    item = item.copyWith(entry: item.entry.copyWith(primaryAsset: value));

    state = [...state]
      ..removeAt(index)
      ..insert(index, item);
  }

  void updateRoyalty(int index, Royalty? value) {
    ScWizardItem? item = itemAtIndex(index);

    if (item == null) return;

    item = item.copyWith(entry: item.entry.copyWith(royalty: value));

    state = [...state]
      ..removeAt(index)
      ..insert(index, item);
  }

  void addEvolvePhase(int index, EvolvePhase? value) {
    ScWizardItem? item = itemAtIndex(index);

    if (item == null) return;
    if (value != null) {
      item = item.copyWith(
        entry: item.entry.copyWith(
          evolve: item.entry.evolve.copyWith(
            phases: [...item.entry.evolve.phases, value],
          ),
        ),
      );
    }

    state = [...state]
      ..removeAt(index)
      ..insert(index, item);
  }

  void addProperty(int index, ScProperty? value) {
    ScWizardItem? item = itemAtIndex(index);

    if (item == null) return;
    if (value != null) {
      item = item.copyWith(
        entry: item.entry.copyWith(properties: [...item.entry.properties, value]),
      );
    }

    state = [...state]
      ..removeAt(index)
      ..insert(index, item);
  }

  void addAdditionalAsset(int index, Asset asset) {
    ScWizardItem? item = itemAtIndex(index);

    if (item == null) return;

    item = item.copyWith(
      entry: item.entry.copyWith(
        additionalAssets: [...item.entry.additionalAssets, asset],
      ),
    );
    state = [...state]
      ..removeAt(index)
      ..insert(index, item);
  }

  void removeAdditionalAsset(int index, int assetIndex) {
    ScWizardItem? item = itemAtIndex(index);

    if (item == null) return;

    item = item.copyWith(
      entry: item.entry.copyWith(
        additionalAssets: [...item.entry.additionalAssets]..removeAt(assetIndex),
      ),
    );
    state = [...state]
      ..removeAt(index)
      ..insert(index, item);
  }

  void removeEvolutionPhase(int index, int assetIndex) {
    ScWizardItem? item = itemAtIndex(index);
    ref.read(evolvePhaseWizardFormProvider(assetIndex).notifier).clear();

    if (item == null) return;

    item = item.copyWith(
      entry: item.entry.copyWith(
        evolve: item.entry.evolve.copyWith(
          phases: [...item.entry.evolve.phases]..removeAt(assetIndex),
        ),
      ),
    );
    state = [...state]
      ..removeAt(index)
      ..insert(index, item);
  }

  void removeProperty(int index, int assetIndex) {
    ScWizardItem? item = itemAtIndex(index);
    ref.read(propertyWizardFormProvider(assetIndex).notifier).clear();

    if (item == null) return;

    item = item.copyWith(
      entry: item.entry.copyWith(
        properties: [...item.entry.properties]..removeAt(assetIndex),
      ),
    );
    state = [...state]
      ..removeAt(index)
      ..insert(index, item);
  }

  void setEvolvingType(int index, EvolveType type) {
    ScWizardItem? item = itemAtIndex(index);

    if (item == null) return;

    item = item.copyWith(
      entry: item.entry.copyWith(
        evolve: item.entry.evolve.copyWith(type: type),
      ),
    );
    state = [...state]
      ..removeAt(index)
      ..insert(index, item);
  }

  void removePhase(int index, int phaseIndex) {
    ScWizardItem? item = itemAtIndex(index);

    if (item == null) return;

    item = item.copyWith(
      entry: item.entry.copyWith(
        additionalAssets: [...item.entry.additionalAssets]..removeAt(phaseIndex),
      ),
    );
    state = [...state]
      ..removeAt(index)
      ..insert(index, item);
  }

  Future<PlatformFile?> _getFile(List<String> extensions) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: extensions,
      allowMultiple: false,
      type: FileType.custom,
    );
    if (result == null) {
      return null;
    }
    if (result.files.isEmpty) {
      return null;
    }

    final file = result.files.first;

    return file;
  }

  Future<bool> uploadJson() async {
    state = [];
    final file = await _getFile(['json']);
    if (!kIsWeb) {
      if (file == null || file.path == null) {
        return false;
      }
    } else {
      if (file == null || file.bytes == null) {
        return false;
      }
    }

    final input = kIsWeb ? utf8.decode(file.bytes!.toList()) : File(file.path!).readAsStringSync();

    List<dynamic> data = [];
    try {
      data = jsonDecode(input);
    } catch (e) {
      print(e);
      Toast.error("Invalid JSON");
      return false;
    }

    final List<BulkSmartContractEntry> entries = [];
    final List<Map<String, dynamic>> items = data.map((e) => e as Map<String, dynamic>).toList();

    for (final item in items) {
      final name = item['name'].toString();
      final description = item['description'].toString();
      final primaryAssetUrl = item['image'].toString();
      final creatorName = item['creator_name'].toString() == "null" ? " " : item['creator_name'];

      final royaltyAmount = item.containsKey('royalty') ? item['royalty']['amount'].toString() : null;
      final royaltyAddress = item.containsKey('royalty') ? item['royalty']['address'].toString() : null;
      final List<String>? additionalAssetUrls =
          item.containsKey('additional_images') ? item['additional_images'].map<String>((e) => e as String).toList() : null;

      final quantity = item.containsKey('quantity') ? item['quantity'] : 1;
      final evolve = item.containsKey('evolve') ? item['evolve'] : null;

      final List<ScProperty> properties = [];

      if (item.containsKey('attributes')) {
        final attributes = item['attributes'].map<Map<String, dynamic>>((e) => e as Map<String, dynamic>).toList();
        print(attributes);
        print("***********");
        for (final attribute in attributes) {
          final String name = attribute['trait_type']?.toString() ?? '';
          final String value = attribute['value']?.toString() ?? '';

          ScPropertyType type = ScPropertyType.text;

          if (isNumeric(value)) {
            type = ScPropertyType.number;
          }

          if (value.length == 7 && value.startsWith("#")) {
            type = ScPropertyType.color;
          }

          if (name.isNotEmpty && value.isNotEmpty) {
            properties.add(ScProperty(name: name, value: value, type: type));
          }
        }
      }

      final entry = await _propertiesToEntry(
        name: name,
        description: description,
        primaryAssetUrl: primaryAssetUrl,
        creatorName: creatorName,
        quantity: quantity,
        royaltyAmount: royaltyAmount,
        royaltyAddress: royaltyAddress,
        additionalAssetUrls: additionalAssetUrls,
        evolve: evolve,
        properties: properties,
      );

      if (entry != null) {
        entries.add(entry);
      }
    }

    state = entries
        .asMap()
        .entries
        .map((e) => ScWizardItem(
              entry: e.value,
              index: e.key,
              x: 0,
              y: 0,
            ))
        .toList();

    return entries.isNotEmpty;
  }

  Future<bool> uploadCsv() async {
    state = [];
    final file = await _getFile(['csv']);
    if (!kIsWeb) {
      if (file == null || file.path == null) {
        return false;
      }
    } else {
      if (file == null || file.bytes == null) {
        return false;
      }
    }

    // final input = File(file.path!).openRead();

    final List<List<dynamic>> fields = kIsWeb
        ? CsvToListConverter().convert(utf8.decode(file.bytes!.toList()))
        : await File(file.path!).openRead().transform(utf8.decoder).transform(const CsvToListConverter()).toList();

    final headers = fields.first;
    if (!headers
        .join(',')
        .toLowerCase()
        .contains('Name,Description,Primary Asset URL,Creator Name,Royalty Amount,Royalty Address,Additional Asset URLs,Quantity'.toLowerCase())) {
      Toast.error("The CSV headers are not in the correct format, please check the example file");
      return false;
    }

    final rows = [...fields]..removeAt(0);
    final List<BulkSmartContractEntry> entries = [];
    for (final row in rows) {
      final name = row[0].toString();
      final description = row[1].toString();
      final primaryAssetUrl = row[2].toString();
      final creatorName = row[3].toString();

      final royaltyAmount = row[4].toString();
      final royaltyAddress = row[5].toString();
      final additionalAssetUrls = row[6].toString().isNotEmpty ? row[6].toString().split(',').map((e) => e.trim()).toList() : null;

      final quantity = row[7];

      final List<ScProperty> properties = [];

      print(rows.length);

      for (int i = 8; i < row.length; i++) {
        final String name = fields.first[i]?.toString() ?? '';
        final String value = row[i]?.toString() ?? '';

        ScPropertyType type = ScPropertyType.text;

        if (isNumeric(value)) {
          type = ScPropertyType.number;
        }

        if (value.length == 7 && value.startsWith("#")) {
          type = ScPropertyType.color;
        }

        if (name.isNotEmpty && value.isNotEmpty) {
          properties.add(ScProperty(name: name, value: value, type: type));
        }
      }

      final entry = await _propertiesToEntry(
        name: name,
        description: description,
        primaryAssetUrl: primaryAssetUrl,
        creatorName: creatorName,
        quantity: quantity,
        royaltyAmount: royaltyAmount,
        royaltyAddress: royaltyAddress,
        additionalAssetUrls: additionalAssetUrls,
        properties: properties,
      );

      if (entry != null) {
        entries.add(entry);
      }
    }

    state = entries
        .asMap()
        .entries
        .map((e) => ScWizardItem(
              entry: e.value,
              index: e.key,
              x: 0,
              y: 0,
            ))
        .toList();

    return entries.isNotEmpty;
  }

  Future<BulkSmartContractEntry?> _propertiesToEntry({
    required String name,
    required String description,
    required String primaryAssetUrl,
    required String creatorName,
    required int quantity,
    required String? royaltyAmount,
    required String? royaltyAddress,
    required List<String>? additionalAssetUrls,
    List<ScProperty> properties = const [],
    Map<String, dynamic>? evolve,
  }) async {
    final logProvider = ref.read(scWizardLogProvider.notifier);
    logProvider.append("Creating $name...");

    logProvider.append("Downloading $primaryAssetUrl...");

    final primaryAsset = kIsWeb
        ? Asset(
            id: '',
            fileSize: 0,
            location: primaryAssetUrl,
          )
        : await urlToAsset(
            primaryAssetUrl,
            creatorName,
          );

    if (primaryAsset == null) {
      Toast.error("Problem downloading $primaryAssetUrl. Skipping.");
      logProvider.append("Problem downloading $primaryAssetUrl. Skipping.");
      return null;
    }

    Royalty? royalty;
    if (royaltyAmount != null && royaltyAddress != null && royaltyAmount.isNotEmpty && royaltyAddress.isNotEmpty) {
      if (isValidRbxAddress(royaltyAddress)) {
        if (royaltyAmount.contains('%')) {
          final parsed = double.tryParse(royaltyAmount.replaceAll("%", ''));
          if (parsed != null) {
            royalty = Royalty(amount: parsed / 100, address: royaltyAddress, type: RoyaltyType.percent);
          }
        } else {
          final parsed = double.tryParse(royaltyAmount);
          if (parsed != null) {
            royalty = Royalty(amount: parsed, address: royaltyAddress, type: RoyaltyType.fixed);
          }
        }
      }
    }
    Evolve? entryEvolve;
    if (evolve != null) {
      if (evolve.containsKey('type')) {
        switch (evolve['type']) {
          case 'date':
            if (evolve.containsKey('phases')) {
              List<EvolvePhase> phases = [];
              for (var e in (evolve['phases'] as List)) {
                Asset? asset = await urlToAsset(e['image'], name);
                phases.add(EvolvePhase(
                  name: e['name'],
                  description: e['description'],
                  asset: asset,
                  dateTime: DateTime.parse(e['date']),
                ));
              }
              print("Date phases: $phases");

              entryEvolve = Evolve(type: EvolveType.time, phases: phases);
            }
            break;
          case 'height':
            if (evolve.containsKey('phases')) {
              List<EvolvePhase> phases = [];
              for (var e in (evolve['phases'] as List)) {
                Asset? asset = await urlToAsset(e['image'], name);
                phases.add(EvolvePhase(
                  name: e['name'],
                  description: e['description'],
                  asset: asset,
                  blockHeight: e['height'],
                ));
              }
              print("Height phases: $phases");
              entryEvolve = Evolve(type: EvolveType.time, phases: phases);
            }
            break;
          default:
            if (evolve.containsKey('phases')) {
              List<EvolvePhase> phases = [];
              for (var e in (evolve['phases'] as List)) {
                Asset? asset = await urlToAsset(e['image'], name);
                phases.add(EvolvePhase(
                  name: e['name'],
                  description: e['description'],
                  asset: asset,
                ));
              }
              print("Default phases: $phases");

              entryEvolve = Evolve(type: EvolveType.time, phases: phases);
            }
        }
      }
    }

    final List<Asset> additionalAssets = [];
    if (additionalAssetUrls != null && additionalAssetUrls.isNotEmpty) {
      for (final url in additionalAssetUrls) {
        final a = kIsWeb
            ? Asset(
                id: '',
                fileSize: 0,
                location: url,
              )
            : await urlToAsset(
                url,
                creatorName,
              );
        if (a != null) {
          additionalAssets.add(a);
        }
      }
    }

    logProvider.append("Created $name");

    return BulkSmartContractEntry(
        name: name,
        description: description,
        primaryAsset: primaryAsset,
        creatorName: creatorName,
        quantity: quantity,
        royalty: royalty,
        additionalAssets: additionalAssets,
        properties: properties,
        evolve: entryEvolve ?? const Evolve());
  }

  EvolveType getEvolveType(int index) {
    return state[index].entry.evolve.type;
  }

  Future<Asset?> urlToAsset(String url, String creatorName) async {
    final logProvider = ref.read(scWizardLogProvider.notifier);

    try {
      final uri = Uri.parse(url).replace(queryParameters: {});
      final f = File(uri.toString().replaceAll("?", ""));
      String filename = basename(f.path);
      String ext = extension(f.path);

      print(filename);

      // final filename = url.split('/').last;
      // final extension = filename.split(".").last;

      final downloadDirectory = await getTemporaryDirectory();
      String path = "${downloadDirectory.path}/$filename";

      await Dio().download(url, path, onReceiveProgress: (value1, value2) {
        // print("Downloading $value1/$value2");
      });

      final bytes = await File(path).readAsBytes();

      final fileSize = (bytes).length;

      if (ext.isEmpty) {
        logProvider.append("No Extension on file. Parsing mime from file...");

        final mime = lookupMimeType(path, headerBytes: bytes);

        if (mime != null) {
          ext = getExtensionFromMimeType(mime);

          if (ext.isNotEmpty) {
            final newPath = "$path.$ext";

            await File(path).rename(newPath);
            path = newPath;
            filename = "$filename.$ext";
            logProvider.append("Renaming file to $filename");
          }
        }
      }

      final asset = Asset(
        id: "00000000-0000-0000-0000-000000000000",
        name: filename,
        authorName: creatorName,
        location: path,
        extension: ext,
        fileSize: fileSize,
      );
      return asset;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> removeAt(int index, {int delay = 0}) async {
    await Future.delayed(Duration(milliseconds: delay));
    state = [...state]..removeAt(index);
  }

  void clear() {
    state = [];
  }

  Future<void> mint(BuildContext context) async {
    if (!kDebugMode && !kIsWeb) {
      if (!guardWalletIsSynced(ref)) {
        return;
      }
    }

    ref.read(scWizardMintingProgress.notifier).setPercent(0);

    showDialog(
      context: context,
      builder: (context) {
        return ScWizardMintingProgressDialog(
          contextOverride: context,
        );
      },
    ).then((value) {
      if (kIsWeb) {
        AutoRouter.of(context).pop();
      }
    });

    final totalItems = state.map((e) => e.entry.quantity).toList().sum;
    int totalProgress = 0;

    for (final item in state) {
      final entry = item.entry;

      final owner = kIsWeb ? ref.read(webSessionProvider).currentWallet : ref.read(sessionProvider).currentWallet;

      if (owner == null) {
        Toast.error("No wallet selected.");
        return;
      }

      final sc = SmartContract(
        owner: owner,
        name: entry.name,
        minterName: entry.creatorName,
        description: entry.description,
        primaryAsset: entry.primaryAsset,
        evolves: [entry.evolve],
        royalties: entry.royalty != null ? [entry.royalty!] : [],
        properties: entry.properties,
        multiAssets: entry.additionalAssets.isNotEmpty ? [MultiAsset(assets: entry.additionalAssets)] : [],
      );

      final timezoneName = ref.read(sessionProvider).timezoneName;
      final payload = sc.serializeForCompiler(timezoneName);

      int i = 0;
      while (i < entry.quantity) {
        i += 1;

        ref.read(scWizardMintingProgress.notifier).setLabel("Minting ${totalProgress + 1}/$totalItems...");

        if (kIsWeb) {
          final success = await RawService().compileAndMintSmartContract(payload, ref.read(webSessionProvider).keypair!, ref);
          if (!success) {
            Toast.error();
            print("Mint error");
            return;
          }
        } else {
          final csc = await SmartContractService().compileSmartContract(payload);

          if (csc == null) {
            Toast.error();
            print("CSC was null");
            return;
          }

          if (!csc.success) {
            Toast.error();
            print("CSC not successful");
            return;
          }

          final details = await SmartContractService().retrieve(csc.smartContract.id);
          if (details == null) {
            Toast.error();
            print("Details null");
            return;
          }
          final id = details.smartContract.id;

          final success = await SmartContractService().mint(id);
          if (!success) {
            Toast.error();
            print("Mint error");
            return;
          }

          NftService().saveId(id);
        }

        await Future.delayed(const Duration(milliseconds: kIsWeb ? 500 : 1500));
        totalProgress += 1;

        final percent = totalProgress / totalItems;

        ref.read(scWizardMintingProgress.notifier).setPercent(percent);
      }

      // clear();
    }
    ref.read(scWizardMintingProgress.notifier).setPercent(1);
    ref.read(scWizardMintingProgress.notifier).setLabel("Complete");

    ref.read(mintedNftListProvider.notifier).reloadCurrentPage();

    ref.read(mySmartContractsProvider.notifier).load();

    kIsWeb
        ? ref.read(nftListProvider.notifier).reloadCurrentPage(address: ref.read(webSessionProvider).keypair?.address)
        : ref.read(nftListProvider.notifier).reloadCurrentPage();
  }
}

final scWizardProvider = StateNotifierProvider<ScWizardProvider, List<ScWizardItem>>((ref) {
  return ScWizardProvider(ref);
});
