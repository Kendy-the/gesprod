import '../models/product.dart';
import 'Controller.dart';

class ProductController extends Controller {
    static Future<bool> create(
        String name,
        String category,
        int price,
        int quantity,
    ) async {
        if (!Controller.checkField(name, category, price, quantity)) {
        return false;
        }

        return await Product(
        name: name,
        category: category,
        price: price,
        quantity: quantity,
        ).create();
    }

    static Future<bool> update(
        String name,
        String category,
        int price,
        int quantity,
        int id,
    ) async {
        if (!Controller.checkFieldWithId(name, category, price, quantity, id)) {
        return false;
        }

        return await Product(
            id: id,
            name: name,
            category: category,
            price: price,
            quantity: quantity,
        ).update();
    }

    static Future<bool> delete(int id) async {
        if (!Controller.checkId(id)) {
            return false;
        }

        return await Product(id: id).delete();
    }

    static Future<bool> availlableStock(String name) async {
        if (!Controller.checkName(name)) {
            return false;
        }

        Product? tempProduct = await Product.findByName(name);

        if(tempProduct == null){
            return false;
        }

        if (!Controller.checkIntField(tempProduct.getQuantity())) {
            return false;
        }

        return true;
    }

    static Future<bool> decreaseStock(String name, int value) async {
        if (!Controller.checkName(name)) {
            return false;
        }

        Product? tempProduct = await Product.findByName(name);

        if(tempProduct == null){
            return false;
        }

        if (!Controller.checkIntField(tempProduct.getQuantity()! - value)) {
            return false;
        }

        tempProduct.setQuantity(tempProduct.getQuantity()! - value);

        return await Product(
            id: tempProduct.getId(),
            name: tempProduct.getName(),
            category: tempProduct.getCategory(),
            price: tempProduct.getPrice(),
            quantity: tempProduct.getQuantity(),
        ).decreaseStock(value);
    }

    static Future<bool> increaseStock(String name, int value) async {
        if (!Controller.checkName(name)) {
            return false;
        }

        Product? tempProduct = await Product.findByName(name);

        if(tempProduct == null){
            return false;
        }

        tempProduct.setQuantity(tempProduct.getQuantity()! + value);

        return await Product(
            id: tempProduct.getId(),
            name: tempProduct.getName(),
            category: tempProduct.getCategory(),
            price: tempProduct.getPrice(),
            quantity: tempProduct.getQuantity(),
        ).increaseStock(value);
    }

    static Future<Product?> findById(int id) async {
        if (!Controller.checkId(id)) {
        return null;
        }

        return await Product.findById(id);
    }

    static Future<Product?> findByName(String name) async {
        if (!Controller.checkName(name)) {
        return null;
        }

        return await Product.findByName(name);
    }

    static Future<List<Product>> all() async {
        return await Product.all();
    }

    static Future<List<Product>> findClothing() async {
        return await Product.findClothing();
    }

    static Future<List<Product>> findJewelry() async {
        return await Product.findJewelry();
    }

    static Future<List<Product>> findOutOfStock() async {
        return await Product.findOutOfStock();
    }

    static Future<List<Product>> findWithPrice(int price) async {
        List<Product> list = [];

        if(!Controller.checkId(price)) {
            return list;
        }

        return await Product.findWithPrice(price);
    }
}
