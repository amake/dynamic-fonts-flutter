import 'dart:io';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

bool get isMacOS => Platform.isMacOS;
bool get isAndroid => Platform.isAndroid;
bool get isTest => Platform.environment.containsKey('FLUTTER_TEST');

Future<void> saveFontToDeviceFileSystem({
  required String name,
  required String fileHash,
  required List<int> bytes,
}) async {
  final File file = await _localFile(name, fileHash);
  await file.writeAsBytes(bytes);
}

Future<ByteData?> loadFontFromDeviceFileSystem({
  required String name,
  required String fileHash,
}) async {
  try {
    final File file = await _localFile(name, fileHash);
    final bool fileExists = file.existsSync();
    if (fileExists) {
      final List<int> contents = await file.readAsBytes();
      if (contents.isNotEmpty) {
        return ByteData.view(Uint8List.fromList(contents).buffer);
      }
    }
  } catch (e) {
    return null;
  }
  return null;
}

Future<String> get _localPath async {
  final Directory directory = await getApplicationSupportDirectory();
  return directory.path;
}

Future<File> _localFile(String name, String fileHash) async {
  final String path = await _localPath;
  // We expect only ttf files to be provided to us by the Google Fonts API.
  // That's why we can be sure a previously saved Google Font is in the ttf
  // format instead of, for example, otf.
  return File('$path/${name}_$fileHash.ttf');
}
