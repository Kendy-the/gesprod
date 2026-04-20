import '../repositories/ProductPromoRepository.dart';
import 'Product.dart';

class ProductPromo extends Product{
    double promo;

    ProductPromo({
        int? id,
        String? name,
        String? category,
        int? price,
        int? quantity,
        required this.promo
    })
    : super(
        id: id,
        name: name,
        category: category,
        price: price,
        quantity: quantity
    );

    void setPromo(promo) => this.promo = promo;
    double getPromo() => this.promo;

    int? getId() => id;
    void setId(int value) => id = value;

    String? getName() => name;
    void setName(String value) => name = value;


    // int getPrice() => this.price! - (this.price! * this.promo).toInt();

    static Future<List<ProductPromo>> allPromo() async {
        return ProductPromoRepository.allPromo();
    }

    static Future<bool> createPromo(String name, double promo) async {
        return ProductPromoRepository.createPromo(name, promo);
    }

    static Future<bool> updatePromo(String name, double promo) async {
        return ProductPromoRepository.updatePromo(name, promo);
    }

    static Future<bool> deletePromo(String name) async {
        return ProductPromoRepository.deletePromo(name);
    }

    static Future<ProductPromo?> findByName(String name) async {
        return ProductPromoRepository.findByName(name);
    }
}
