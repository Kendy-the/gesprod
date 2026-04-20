import '../models/ProductPromo.dart';
import 'Repository.dart';

class ProductPromoRepository extends Repository{

    static Future<List<ProductPromo>> allPromo() async {
        List<ProductPromo> list = [];

        try {
            List<dynamic> data = await Repository.readFile(name: "promo");

            for (var item in data) {
                list.add(ProductPromo(
                    id: item["id"],
                    name: item["name"],
                    promo: item["promo"],
                ));
            }
        } catch (e) {
            print("Error : $e");
        }

        return list;
    }

    static Future<bool> createPromo(String name, double promo) async {
        try {
            List<dynamic> data = await Repository.readFile(name: "promo");

            int newId = 1;

            if (data.isNotEmpty) {
                newId =
                    data.map((e) => e['id'] as int).reduce((a, b) => a > b ? a : b) + 1;
            }

            data.add({
                "id": newId,
                "name": name,
                "promo": promo
            });

            await Repository.writeFile(data: data, name: "promo");

            return true;
        } catch (e) {
            print("Error Promo insertion : $e");
            return false;
        }
    }

    static Future<bool> updatePromo(String name, double promo) async {
        try {
            List<dynamic> data = await Repository.readFile(name: "promo");

            int index =
                data.indexWhere((item) => item["name"] == name);

            if (index == -1) return false;

            data[index] = {
                "id": data[index]["id"],
                "name": name,
                "promo":promo
            };

            await Repository.writeFile(data : data, name: "promo");

            return true;
        } catch (e) {
            print("Error Product update : $e");
            return false;
        }
    }

    static Future<bool> deletePromo(String name) async {
        try {
            List<dynamic> data = await Repository.readFile(name: "promo");

            data.removeWhere((item) => item["name"] == name);

            await Repository.writeFile(data : data, name: "promo");

            return true;
        } catch (e) {
            print("Error Product delete : $e");
            return false;
        }
    }

    static Future<ProductPromo?> findByName(String name) async {
        try {
            List<dynamic> data = await Repository.readFile(name: "promo");

            for (var item in data) {
                if (item["name"] == name) {
                return ProductPromo(
                    id: item["id"],
                    name: item["name"],
                    promo: item["promo"],
                );
                }
            }
        } catch (e) {
            print("Error : $e");
        }
        return null;
    }

}
