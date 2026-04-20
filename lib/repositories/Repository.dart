import 'dart:convert';
import 'dart:io';

class Repository {
    static Uri scriptUri = Platform.script;

    static String getFilePath({String name = "products"}){
        String scriptDir = File(scriptUri.toFilePath()).parent.path;
        return '$scriptDir\\..\\lib\\data\\$name.json';
    }

    // Lire fichier JSON
    static Future<List<dynamic>> readFile({String name = "products"}) async {

        final file = File(getFilePath(name: name));

        if (!await file.exists()) {
        await file.writeAsString(jsonEncode([]));
        }

        String content = await file.readAsString();

        if (content.trim().isEmpty) {
        return [];
        }

        return jsonDecode(content);
    }

    // Sauvegarder fichier JSON
    static Future<void> writeFile({required List<dynamic> data, String name = "products"}) async {
        final file = File(getFilePath(name: name));
        await file.writeAsString(
        JsonEncoder.withIndent('  ').convert(data),
        );
    }
}
