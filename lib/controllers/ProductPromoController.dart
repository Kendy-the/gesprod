import '../models/ProductPromo.dart';
import '../models/Product.dart';
import 'Controller.dart';


class ProductPromoController extends Controller{

    static Future<List<ProductPromo>> allPromo() async {
        return await ProductPromo.allPromo();
    }

    static Future<bool> createPromo(String name, double promo) async {

        if(!Controller.checkName(name)) return false;
        if(!checkPromo(promo)) return false;

        var tempProduct = await Product.findByName(name);

        if(tempProduct == null){
            print("\nError : No Product *$name");
            return false;
        }

        var tempPromo = await ProductPromo.findByName(name);

        if (tempPromo != null) {
            print("\nPromo already exist for *$name");
            print("\nTry to Update...");

            if(await ProductPromo.updatePromo(name, promo)){
                print("\nUpdate successfully !");
                return true;
            }

            print("\nFailed to update promo for *$name");
            return false;
        }

        return await ProductPromo.createPromo(name, promo);
    }

    static Future<bool> updatePromo(String name, double promo) async {
        if(!Controller.checkName(name)) return false;
        if(!checkPromo(promo)) return false;

        var tempPromo = await ProductPromo.findByName(name);

        if (tempPromo == null) {

            print("\nError : Promo do not exists");
            return false;
        }

        return await ProductPromo.updatePromo(name, promo);

    }

    static Future<bool> deletePromo(String name) async {
        if(!Controller.checkName(name)) return false;

        var tempPromo = await ProductPromo.findByName(name);

        if (tempPromo == null) {

            print("\nError : Promo do not exists");
            return false;
        }

        return await ProductPromo.deletePromo(name);
    }

    static bool checkPromo(double promo){
        if(promo <= 0.0) return false;

        return true;
    }
}
