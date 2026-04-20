import '../lib/utils/Console.dart';

Future<void> main() async {
int launch = 10;

do {
    Console.menu();
    launch = Console.launch();

    switch (launch) {
    case 1:
        launch = 1;
        await Console.create();
        break;

    case 2:
        launch = 2;
        await Console.all();
        break;

    case 3:
        launch = 3;
        await Console.findById();
        break;

    case 4:
        launch = 4;
        await Console.findByName();
        break;

    case 5:
        launch = 5;
        await Console.update();
        break;

    case 6:
        launch = 6;
        await Console.delete();
        break;

    case 7:
        launch = 7;
        await Console.findClothing();
        break;

    case 8:
        launch = 8;
        await Console.findJewelry();
        break;

    case 9:
        launch = 9;
        await Console.findOutOfStock();
        break;

    case 10:
        launch = 10;
        await Console.findWithPrice();
        break;

    case 11:
        launch = 11;
        await Console.allPromo();
        break;

    case 12:
        launch = 12;
        await Console.createPromo();
        break;

    case 13:
        launch = 13;
        await Console.deletePromo();
        break;

    case 14:
        launch = 13;
        await Console.availlableStock();
        break;

    case 15:
        launch = 14;
        await Console.decreaseStock();
        break;

    case 16:
        launch = 15;
        await Console.increaseStock();
        break;

    default:
        launch = 0;
        Console.quit();
        break;
    }
} while (launch > 0);
}
