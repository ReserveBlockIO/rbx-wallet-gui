import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import '../../../core/components/buttons.dart';
import '../../../core/providers/session_provider.dart';
import '../../../core/theme/app_theme.dart';
import '../../../utils/files.dart';
import '../../../utils/formatting.dart';

class SnapshotDownloader extends StatefulWidget {
  final String downloadUrl;
  final Ref ref;

  const SnapshotDownloader({
    Key? key,
    required this.downloadUrl,
    required this.ref,
  }) : super(key: key);

  @override
  State<SnapshotDownloader> createState() => _SnapshotDownloaderState();
}

class _SnapshotDownloaderState extends State<SnapshotDownloader> {
  int progress = 0;
  int? total;
  bool isInitializating = true;
  bool isDownloading = false;
  bool isInstalling = false;
  bool isReady = false;
  String? backupDir;

  List<String> installLog = [];

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 300)).then((_) {
      init();
    });
  }

  Future<void> init() async {
    await widget.ref.read(sessionProvider.notifier).stopCli();

    download();
  }

  Future<void> download() async {
    setState(() {
      isInitializating = false;
      isDownloading = true;
    });
    final downloadDirectory = await getTemporaryDirectory();
    final path = "${downloadDirectory.path}/snapshot.zip";

    Dio().download(widget.downloadUrl, path, onReceiveProgress: (value1, value2) {
      setState(() {
        progress = value1;
        total = value2;
      });
      // print("Downloading $value1/$value2");
    }).then((value) => downloadReady(path));
  }

  installLogAdd(String string) {
    installLog.add(string);
    setState(() {});
  }

  Future<void> downloadReady(String zipPath) async {
    setState(() {
      isDownloading = false;
      isInstalling = true;
    });

    final _dbPath = await dbPath();
    final dir = Directory(_dbPath);

    final date = DateTime.now();
    String backupDirName = "${_dbPath.replaceAll('rbx', '').replaceAll('RBX', '')}\\RBX_BACKUP_${(date.microsecondsSinceEpoch / 1000).round()}";
    if (Platform.isMacOS) {
      backupDirName = backupDirName.toLowerCase().replaceAll("\\", '/').replaceAll('//', '/');
    }
    setState(() {
      backupDir = backupDirName;
    });

    installLogAdd("Backing up current RBX folder as '$backupDirName'...");

    await dir.rename(backupDirName);
    installLogAdd("Backed up.");
    await Directory(_dbPath).create();

    installLogAdd("Extracting Snapshot...");

    final bytes = await File(zipPath).readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);
    for (final file in archive) {
      String filename = file.name;
      print("filename before: $filename");

      if (filename.contains('/')) {
        filename = filename.split('/').last;
      }

      print("filename after: $filename");
      if (file.isFile) {
        final data = file.content as List<int>;

        final p = "$_dbPath/Databases/$filename";
        installLogAdd("Extracting '$p'...");
        File(p)
          ..createSync(recursive: true)
          ..writeAsBytesSync(data);
      } else {
        Directory("$_dbPath/Databases/$filename").create(recursive: true);
      }
    }

    installLogAdd("Snapshot extracted");
    installLogAdd("Starting CLI");
    setState(() {
      isInstalling = false;
      isReady = true;
    });

    await widget.ref.read(sessionProvider.notifier).init(false);
    await widget.ref.read(sessionProvider.notifier).fetchConfig();
  }

  @override
  Widget build(BuildContext context) {
    final double percent = total != null ? progress / total! : 0;

    String title = "Initializing...";
    if (isDownloading) {
      title = "Downloading...";
    }

    if (isInstalling) {
      title = "Installing...";
    }

    if (isReady) {
      title = "All done!";
    }

    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        width: 600,
        child: Builder(builder: (context) {
          if (isInstalling) {
            return Container(
              color: Colors.black87,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: installLog.length,
                  itemBuilder: (context, index) {
                    return Text(
                      installLog[index],
                      style: Theme.of(context).textTheme.caption,
                    );
                  },
                ),
              ),
            );
          }

          if (isInitializating) {
            return const Text("Shutting down CLI...");
          }

          if (isDownloading) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${(percent * 100).round()}%",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: LinearProgressIndicator(
                    color: Colors.green,
                    minHeight: 12,
                    backgroundColor: Colors.black45,
                    value: percent,
                  ),
                ),
                if (total != null)
                  Text(
                    "${readableFileSize(progress)} / ${readableFileSize(total!)}",
                    style: Theme.of(context).textTheme.caption,
                  ),
              ],
            );
          }

          if (isReady) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.check,
                  size: 40,
                  color: Theme.of(context).colorScheme.success,
                ),
                const Text("Database Snapshot Imported."),
                const Text(
                  "Starting up CLI now...",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Divider(),
                if (backupDir != null) ...[
                  Text(
                    "Note: In case your mistakenly imported this snapshot, your previous database folder was backed up to\n$backupDir",
                    style: Theme.of(context).textTheme.caption,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  AppButton(
                    label: "Open Folder",
                    variant: AppColorVariant.Light,
                    type: AppButtonType.Text,
                    icon: Icons.folder,
                    onPressed: () {
                      openFile(File(backupDir!));
                    },
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "Close",
                          style: TextStyle(color: Colors.white70),
                        )),
                  )
                ]
              ],
            );
          }

          return const Text("An error occurred. Please restart and try again.");
        }),
      ),
    );
  }
}
