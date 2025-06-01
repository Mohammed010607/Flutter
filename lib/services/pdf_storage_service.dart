import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:file_picker/file_picker.dart';

class PDFStorageService {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> savePDF(PlatformFile file) async {
    final path = await _localPath;
    final fileName = file.name;
    final savedFile = File('$path/$fileName');

    // Copy the file to app's local storage
    await savedFile.writeAsBytes(file.bytes!);
    return savedFile;
  }

  Future<List<File>> getAllPDFs() async {
    final path = await _localPath;
    final directory = Directory(path);
    final files = await directory.list().toList();
    return files
        .where((file) => file.path.toLowerCase().endsWith('.pdf'))
        .map((file) => File(file.path))
        .toList();
  }

  Future<void> deletePDF(String fileName) async {
    final path = await _localPath;
    final file = File('$path/$fileName');
    if (await file.exists()) {
      await file.delete();
    }
  }
}
