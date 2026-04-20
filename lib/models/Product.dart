import './../repositories/ProductRepository.dart';
import 'product.dart' as prefix0;

class Product {
    int? id;
    String? name;
    String? category;
    int? price;
    int? quantity;

    late ProductRepository? productRepository;

    // Constructeur complet
    Product({
        this.id,
        this.name,
        this.category,
        this.price,
        this.quantity,
    }) {
        if (runtimeType == Product) {
            productRepository = ProductRepository(this as prefix0.Product?);
        }
    }

    // Constructeur vide
    Product.empty() {
        if (runtimeType == Product) {
            productRepository = ProductRepository(this as prefix0.Product?);
        }
    }

    // Getters & Setters

    int? getId() => id;
    void setId(int value) => id = value;

    String? getName() => name;
    void setName(String value) => name = value;

    String? getCategory() => category;
    void setCategory(String value) => category = value;

    int? getPrice() => price;
    void setPrice(int value) => price = value;

    int? getQuantity() => quantity;
    void setQuantity(int value) => quantity = value;

    // CRUD Methods

    Future<bool> create() {
        return productRepository!.create();
    }

    Future<bool> update() {
        return productRepository!.update();
    }

    Future<bool> delete() {
        return productRepository!.delete();
    }

    Future<bool> decreaseStock(int value) {
        return productRepository!.decreaseStock(value);
    }

    Future<bool> increaseStock(int value) {
        return productRepository!.increaseStock(value);
    }

    static Future<prefix0.Product?> findById(int id) {
        return ProductRepository.findById(id);
    }

    static Future<prefix0.Product?> findByName(String name) {
        return ProductRepository.findByName(name);
    }

    static Future<List<prefix0.Product>> all() {
        return ProductRepository.all();
    }

    static Future<List<prefix0.Product>> findClothing() {
        return ProductRepository.findClothing();
    }

    static Future<List<prefix0.Product>> findJewelry() {
        return ProductRepository.findJewelry();
    }

    static Future<List<prefix0.Product>> findOutOfStock() {
        return ProductRepository.findOutOfStock();
    }


    static Future<List<prefix0.Product>> findWithPrice(int price) {
        return ProductRepository.findWithPrice(price);
    }
}
