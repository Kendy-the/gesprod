# 📦 Product Management System (Dart Console)

A complete **console-based product management application** developed in **Dart** using Object-Oriented Programming principles and JSON file storage.

This project allows users to manage products, stock, promotions, and perform advanced search/filter operations directly from the terminal.

---

# 🚀 Features

## 🟢 Basic Operations

- Add new product
- View all products
- Find product by ID
- Find product by name
- Update product information
- Delete product

---

## 🔍 Filter / Search Operations

- Show clothing products
- Show jewelry products
- Show out-of-stock products
- Show products with price greater than X

---

## ⚙️ Advanced Operations

- Show all promotions
- Apply promo to a product
- Check product availability
- Decrease stock quantity
- Increase stock quantity

---

# 🖥️ Dashboard Preview
```text
╔════════════════════════════════════════════════════════════╗
║                 📦 PRODUCT MANAGEMENT SYSTEM               ║
╠════════════════════════════════════════════════════════════╣
║ 🟢 BASIC OPERATIONS                                     ║
║   1  ➜ Add New Product                                  ║
║   2  ➜ View All Products                                ║
║   3  ➜ Find Product By ID                               ║
║   4  ➜ Find Product By Name                             ║
║   5  ➜ Update Product                                   ║
║   6  ➜ Delete Product                                   ║
╠════════════════════════════════════════════════════════════╣
║ 🔍 FILTER / SEARCH OPTIONS                              ║
║   7  ➜ Clothing Products                                ║
║   8  ➜ Jewelry Products                                 ║
║   9  ➜ Out Of Stock Products                            ║
║  10  ➜ Products With Price > X                          ║
╠════════════════════════════════════════════════════════════╣
║ ⚙️ ADVANCED OPERATIONS                                  ║
║  11  ➜ Show All Promotions                              ║
║  12  ➜ Apply Promo To Product                           ║
║  13  ➜ Delete Promo                                     ║
║  14  ➜ Check Product Availability                       ║
║  15  ➜ Decrease Stock                                   ║
║  16  ➜ Increase Stock                                   ║
╠════════════════════════════════════════════════════════════╣
║ 🚪   0  ➜ Exit Application                                 ║
╚════════════════════════════════════════════════════════════╝
--
╔════════════════════════════════════════════════════════════╗
║                 📦 PRODUCT MANAGEMENT SYSTEM               ║
╠════════════════════════════════════════════════════════════╣
║                                                            ║
║         🙏 Thank you for using our application             ║
║                                                            ║
║                👋 See you again soon !                     ║
║                                                            ║
╠════════════════════════════════════════════════════════════╣
║                    🔒 Session Closed                       ║
╚════════════════════════════════════════════════════════════╝
```

# Project Structure
```text
lib/
│── controllers/
|   ├── ProductController.dart
|   ├── ProductPromoController.dart
│   └── Controller.dart
│
│── models/
│   ├── Product.dart
│   ├── ProductPromo.dart
│   └── Console.dart
│
│── repositories/
│   ├── ProductRepository.dart
│   ├── ProductPromoRepository.dart
│   └── Repository.dart
│
│── data/
│   ├── Products.json
│   └── promo.json
│
│── utils/
│   └── Console.dart
│
│
dev/
└── makeStructure.bat
bin/
└── main.dart

Products.json
Promo.json
README.md
```

# data (JSON)
## Product Model
```json
{
  "id": 1,
  "name": "Rolex",
  "category": "Jewelry",
  "price": 1200,
  "quantity": 5
}
```

## Promotion model
```json
{
  "id": 1,
  "name": "Rolex",
  "promo": 0.20
}
```

# How to run
## Preparation
- Download Dart SDK: https://dart.dev/get-dart
- set the environnement variable

## Run Project
execute *run.bat* in the commande prompt
```bash
run.bat
```

# Learning Goals
This project demonstrates:
1. CRUD operations
2. File handling in Dart
3. JSON read/write
4. Async / Await
5. Console UI Design
6. Inheritance (ProductPromo extends Product)
7. Repository Pattern
8. Error handling

# Future Improvements
1. Login system
2. Export reports to PDF
3. Statistics dashboard
4. SQLite database
5. Search by category
6. Sort products
7. Sales management

# 👨‍💻 Author
Developed by Rickendy PRESUME
Passionate about software development and modern programming.

# ⭐ Final Note
This project is a strong beginner/intermediate Dart portfolio project and can evolve into a real inventory management system.
