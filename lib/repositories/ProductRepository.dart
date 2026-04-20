import '../models/product.dart';
import 'Repository.dart';

class ProductRepository extends Repository{
    Product? product;

    ProductRepository(this.product);

    Future<bool> create() async {
        try {
            List<dynamic> data = await Repository.readFile();

            int newId = 1;

            if (data.isNotEmpty) {
                newId =
                    data.map((e) => e['id'] as int).reduce((a, b) => a > b ? a : b) + 1;
            }

            data.add({
                "id": newId,
                "name": product!.name,
                "category": product!.category,
                "price": product!.price,
                "quantity": product!.quantity,
            });

            await Repository.writeFile(data : data);

            return true;
        } catch (e) {
            print("Error Product insertion : $e");
            return false;
        }
    }

    Future<bool> update() async {
        try {
        List<dynamic> data = await Repository.readFile();

        int index =
            data.indexWhere((item) => item["id"] == product!.id);

        if (index == -1) return false;

        data[index] = {
            "id": product!.id,
            "name": product!.name,
            "category": product!.category,
            "price": product!.price,
            "quantity": product!.quantity,
        };

        await Repository.writeFile(data : data);

        return true;
        } catch (e) {
        print("Error Product update : $e");
        return false;
        }
    }

    Future<bool> delete() async {
        try {
            List<dynamic> data = await Repository.readFile();

            data.removeWhere((item) => item["id"] == product!.id);

            await Repository.writeFile(data : data);

            return true;
        } catch (e) {
            print("Error Product delete : $e");
            return false;
        }
    }

    Future<bool> decreaseStock(int value) async {
        try {
            List<dynamic> data = await Repository.readFile();

            int index =
                data.indexWhere((item) => item["name"] == product!.name);

            if (index == -1) return false;

            data[index] = {
                "id": product!.id,
                "name": product!.name,
                "category": product!.category,
                "price": product!.price,
                "quantity": product!.quantity ,
            };

            await Repository.writeFile(data : data);

            return true;
        } catch (e) {
            print("Error Product decrease stock : $e");
            return false;
        }
    }

    Future<bool> increaseStock(int value) async {
        try {
            List<dynamic> data = await Repository.readFile();

            int index =
                data.indexWhere((item) => item["name"] == product!.name);

            if (index == -1) return false;

            data[index] = {
                "id": product!.id,
                "name": product!.name,
                "category": product!.category,
                "price": product!.price,
                "quantity": product!.quantity ,
            };

            await Repository.writeFile(data : data);

            return true;
        } catch (e) {
            print("Error Product increase stock : $e");
            return false;
        }
    }

    static Future<Product?> findById(int id) async {
        try {
        List<dynamic> data = await Repository.readFile();

        for (var item in data) {
            if (item["id"] == id) {
            return Product(
                id: item["id"],
                name: item["name"],
                category: item["category"],
                price: item["price"],
                quantity: item["quantity"],
            );
            }
        }
        } catch (e) {
        print("Error : $e");
        }

        return null;
    }

    static Future<Product?> findByName(String name) async {
        try {
            List<dynamic> data = await Repository.readFile();

            for (var item in data) {
                if (item["name"] == name) {
                return Product(
                    id: item["id"],
                    name: item["name"],
                    category: item["category"],
                    price: item["price"],
                    quantity: item["quantity"],
                );
                }
            }
        } catch (e) {
            print("Error : $e");
        }

        return null;
    }

    static Future<List<Product>> all() async {
        List<Product> list = [];

        try {
        List<dynamic> data = await Repository.readFile();

        for (var item in data) {
            list.add(Product(
            id: item["id"],
            name: item["name"],
            category: item["category"],
            price: item["price"],
            quantity: item["quantity"],
            ));
        }
        } catch (e) {
        print("Error : $e");
        }

        return list;
    }

    static Future<List<Product>> findClothing() async {
        List<Product> list = [];

        try {
            List<dynamic> data = await Repository.readFile();

            for(var item in data) {

                if(item["category"] == "clothing"){
                    list.add(Product(
                        id: item["id"],
                        name: item["name"],
                        category: item["category"],
                        price: item["price"],
                        quantity: item["quantity"],
                    ));
                }
            }
        } catch (e) {
            print("Error : $e");
        }

        return list;
    }

    static Future<List<Product>> findJewelry() async {
        List<Product> list = [];

        try {
            List<dynamic> data = await Repository.readFile();

            for(var item in data) {

                if(item["category"] == "jewelry"){
                    list.add(Product(
                        id: item["id"],
                        name: item["name"],
                        category: item["category"],
                        price: item["price"],
                        quantity: item["quantity"],
                    ));
                }
            }
        } catch (e) {
            print("Error : $e");
        }

        return list;
    }

    static Future<List<Product>> findOutOfStock() async {
        List<Product> list = [];

        try {
            List<dynamic> data = await Repository.readFile();

            for(var item in data) {

                if(item["quantity"] <= 5){
                    list.add(Product(
                        id: item["id"],
                        name: item["name"],
                        category: item["category"],
                        price: item["price"],
                        quantity: item["quantity"],
                    ));
                }
            }
        } catch (e) {
            print("Error : $e");
        }

        return list;
    }

    static Future<List<Product>> findWithPrice(price) async {
        List<Product> list = [];

        try {
            List<dynamic> data = await Repository.readFile();

            for(var item in data) {

                if(item["price"] > price){
                    list.add(Product(
                        id: item["id"],
                        name: item["name"],
                        category: item["category"],
                        price: item["price"],
                        quantity: item["quantity"],
                    ));
                }
            }
        } catch (e) {
            print("Error : $e");
        }

        return list;
    }

}
