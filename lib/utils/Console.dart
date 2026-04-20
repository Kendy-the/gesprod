import 'dart:io';

import '../controllers/ProductController.dart';
import '../controllers/ProductPromoController.dart';
import '../models/ProductPromo.dart';
import '../models/product.dart';

class Console {

    // INPUT SCAN
    static dynamic launch({String? type}) {
        var number;

        while (true) {
            String? value = stdin.readLineSync();

            if(type != null && type == "double"){
                number = double.tryParse(value ?? '') ?? -1;
            }else{
                number = int.tryParse(value ?? '') ?? -1;
            }

            if (number != -1) break;

            print("\nErreur : saisie invalide.");
            stdout.write("Entrez un entier : ");
        }

        return number;
    }

    static void pause(){
        stdin.readLineSync();
    }

    // ALL PRODUCTS
    static Future<void> all() async {
        List<Product> products = await ProductController.all();

        if (products.isNotEmpty) {
            for (var product in products) {
                print(
                "\nID : ${product.id} | Name : ${product.name} | Category : ${product.category} | Price : ${product.price} | Quantity : ${product.quantity}",
                );
            }
        } else {
            print("Aucun Produit");
        }

        pause();
    }

    // ALL PROMOS
    static Future<void> allPromo() async {
        List<ProductPromo> products = await ProductPromoController.allPromo();

        if (products.isNotEmpty) {
            for (var product in products) {
                print(
                "\nID : ${product.id} | Name : ${product.name} | Promo : ${product.promo}",
                );
            }
        } else {
            print("Aucune Promotion");
        }

        pause();
    }

    // NEW PROMO
    static Future<void> createPromo() async {
        stdout.write("Enter the product name : ");
        String name = stdin.readLineSync()!;

        stdout.write("Enter the promo percent (eg. 1.5) : ");
        double promo = launch(type: "double");

        if (await ProductPromoController.createPromo(name, promo)) {
            print("\nPromo Applied Successfully !");
        } else {
            print("\nFailed To apply Promo !");
        }

        pause();
    }

    // DELETE PROMO
    static Future<void> deletePromo() async {
        stdout.write("Enter the product name : ");
        String name = stdin.readLineSync()!;

        if (await ProductPromoController.deletePromo(name)) {
            print("\nPromo deleted Successfully !");
        } else {
            print("\nFailed To delete Promo !");
        }

        pause();
    }

    // PRODUCT BY ID
    static Future<void> findById() async {
        stdout.write("Enter the product ID : ");
        int id = launch();

        Product? product = await ProductController.findById(id);

        if (product != null) {
            print(
                "\nID : ${product.id} | Name : ${product.name} | Category : ${product.category} | Price : ${product.price} | Quantity : ${product.quantity}",
            );
        } else {
            print("Aucun Produit");
        }

        pause();
    }

    // PRODUCT BY NAME
    static Future<void> findByName() async {
        stdout.write("Enter the product Name : ");
        String name = stdin.readLineSync()!;

        Product? product = await ProductController.findByName(name);

        if (product != null) {
            print(
                "\nID : ${product.id} | Name : ${product.name} | Category : ${product.category} | Price : ${product.price} | Quantity : ${product.quantity}",
            );
        } else {
            print("Aucun Produit");
        }

        pause();
    }

    // PRODUCT BY CLOTHING
    static Future<void> findClothing() async {
        List<Product> products = await ProductController.findClothing();

        if (products.isNotEmpty) {
        for (var product in products) {
            print(
                "\nID : ${product.id} | Name : ${product.name} | Category : ${product.category} | Price : ${product.price} | Quantity : ${product.quantity}",
            );
        }
        } else {
            print("Aucun Produit");
        }

        pause();
    }

    // PRODUCT BY JEWELRY
    static Future<void> findJewelry() async {
        List<Product> products = await ProductController.findJewelry();

        if (products.isNotEmpty) {
        for (var product in products) {
            print(
                "\nID : ${product.id} | Name : ${product.name} | Category : ${product.category} | Price : ${product.price} | Quantity : ${product.quantity}",
            );
        }
        } else {
            print("Aucun Produit");
        }

        pause();
    }

    // PRODUCT OUT OF STOCK
    static Future<void> findOutOfStock() async {
        List<Product> products = await ProductController.findOutOfStock();

        if (products.isNotEmpty) {
            for (var product in products) {
                print(
                    "\nID : ${product.id} | Name : ${product.name} | Category : ${product.category} | Price : ${product.price} | Quantity : ${product.quantity}",
                );
            }
        } else {
            print("Aucun Produit");
        }

        pause();
    }


    // PRODUCT BY PRICE
    static Future<void> findWithPrice() async {
        stdout.write("Enter the product price : ");
        int price = launch();

        List<Product> products = await ProductController.findWithPrice(price);

    if (products.isNotEmpty) {
            for (var product in products) {
                print(
                    "\nID : ${product.id} | Name : ${product.name} | Category : ${product.category} | Price : ${product.price} | Quantity : ${product.quantity}",
                );
            }
        } else {
            print("Aucun Produit");
        }

        pause();
    }

    // DELETE PRODUCT
    static Future<void> delete() async {
        stdout.write("Enter the product ID : ");
        int id = launch();

        if (await ProductController.delete(id)) {
            print("\nProduct deleted Successfully !");
        } else {
            print("\nFailed To delete Product !");
        }

        pause();
    }

    // UPDATE PRODUCT
    static Future<void> update() async {
        stdout.write("Enter the product ID : ");
        int id = launch();

        stdout.write("Enter the product name : ");
        String name = stdin.readLineSync()!;

        stdout.write("Enter the product category (clothing or jewelry) : ");
        String category = stdin.readLineSync()!;

        stdout.write("Enter the product price : ");
        int price = launch();

        stdout.write("Enter the stock Quantity : ");
        int quantity = launch();

        if (await ProductController.update(name, category, price, quantity, id)) {
            print("\nProduct updated Successfully !");
        } else {
            print("\nFailed To update Product !");
        }

        pause();
    }

    // DECREASE STOCK
    static Future<void> decreaseStock() async {
        stdout.write("Enter the product name : ");
        String name = stdin.readLineSync()!;

        stdout.write("Decrease it of : ");
        int value = launch();

        if (await ProductController.decreaseStock(name, value)) {
            print("\n$name stock decrease Successfully !");
        } else {
            print("Failed to decrease $name stock");
        }

        pause();
    }

    // AVAILLABLE STOCK
    static Future<void> availlableStock() async {
        stdout.write("Enter the product name : ");
        String name = stdin.readLineSync()!;

        if (await ProductController.availlableStock(name)) {
            print("\n$name stock is availlable !");
        } else {
            print("$name stock is not availlable !");
        }

        pause();
    }

    // INCREASE STOCK
    static Future<void> increaseStock() async {
        stdout.write("Enter the product name : ");
        String name = stdin.readLineSync()!;

        stdout.write("Increase it of : ");
        int value = launch();

        if (await ProductController.increaseStock(name, value)) {
            print("\n$name stock increase Successfully !");
        } else {
            print("Failed to increase $name stock");
        }

        pause();
    }


    // NEW PRODUCT
    static Future<void> create() async {
        stdout.write("Enter the product name : ");
        String name = stdin.readLineSync()!;

        stdout.write("Enter the product category (clothing or jewelry) : ");
        String category = stdin.readLineSync()!;

        stdout.write("Enter the product price : ");
        int price = launch();

        stdout.write("Enter the stock Quantity : ");
        int quantity = launch();

        if (await ProductController.create(name, category, price, quantity)) {
            print("\nProduct Created Successfully !");
        } else {
            print("\nFailed To create Product !");
        }

        pause();
    }

    // EXIT
    static void quit() {
        print("\n╔════════════════════════════════════════════════════════════╗");
        print("║                 📦 PRODUCT MANAGEMENT SYSTEM               ║");
        print("╠════════════════════════════════════════════════════════════╣");
        print("║                                                            ║");
        print("║         🙏 Thank you for using our application             ║");
        print("║                                                            ║");
        print("║                👋 See you again soon !                     ║");
        print("║                                                            ║");
        print("╠════════════════════════════════════════════════════════════╣");
        print("║                    🔒 Session Closed                       ║");
        print("╚════════════════════════════════════════════════════════════╝\n");
    }

    // DASHBOARD
    static void menu() {
        print("\n╔════════════════════════════════════════════════════════════╗");
        print("║                 📦 PRODUCT MANAGEMENT SYSTEM               ║");
        print("╠════════════════════════════════════════════════════════════╣");

        print("║ 🟢 BASIC OPERATIONS                                     ║");
        print("║   1  ➜ Add New Product                                  ║");
        print("║   2  ➜ View All Products                                ║");
        print("║   3  ➜ Find Product By ID                               ║");
        print("║   4  ➜ Find Product By Name                             ║");
        print("║   5  ➜ Update Product                                   ║");
        print("║   6  ➜ Delete Product                                   ║");

        print("╠════════════════════════════════════════════════════════════╣");

        print("║ 🔍 FILTER / SEARCH OPTIONS                              ║");
        print("║   7  ➜ Clothing Products                                ║");
        print("║   8  ➜ Jewelry Products                                 ║");
        print("║   9  ➜ Out Of Stock Products                            ║");
        print("║  10  ➜ Products With Price > X                          ║");

        print("╠════════════════════════════════════════════════════════════╣");

        print("║ ⚙️ ADVANCED OPERATIONS                                  ║");
        print("║  11  ➜ Show All Promotions                              ║");
        print("║  12  ➜ Apply Promo To Product                           ║");
        print("║  13  ➜ Delete Promo                                     ║");
        print("║  14  ➜ Check Product Availability                       ║");
        print("║  15  ➜ Decrease Stock                                   ║");
        print("║  16  ➜ Increase Stock                                   ║");

        print("╠════════════════════════════════════════════════════════════╣");

        print("║ 🚪   0  ➜ Exit Application                                 ║");
        print("╚════════════════════════════════════════════════════════════╝");

        stdout.write("\n👉 Enter your choice : ");
    }
}
