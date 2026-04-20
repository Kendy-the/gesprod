class Controller {
    static bool checkField(
        String name,
        String category,
        int price,
        int quantity,
    ) {
        if (!checkName(name)) return false;
        if (category.trim().isEmpty) return false;
        if (price <= 0) return false;
        if (quantity <= 0) return false;

        return true;
    }

    static bool checkName(String name){
        if(name.trim().isEmpty) return false;

        return true;
    }

    static bool checkFieldWithId(
        String name,
        String category,
        int price,
        int quantity,
        int id,
    ) {
        return checkField(name, category, price, quantity) && checkId(id);
    }

    static bool checkId(int id) {
        return id > 0;
    }

    static bool checkIntField(int? value) {
        return value! > 0;
    }
}
