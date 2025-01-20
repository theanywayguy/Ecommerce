import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceui/Components/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
        name: "Apple Watch Series 10",
        price: 400,
        description:
            "The latest in Apple's smartwatch lineup, offering sleek design and cutting-edge technology",
        imagePath: "images/Watch.jpg"),
    Product(
        name: "Iphone 16 Case",
        price: 50,
        description: "A protective and stylish accessory for your iPhone",
        imagePath: "images/Case.jpg"),
    Product(
        name: "Lenovo IdeaPad",
        price: 700,
        description:
            " versatile laptop designed for productivity and entertainment with modern features",
        imagePath: "images/Laptop.jpg"),
    Product(
        name: "Apple Watch ultra ",
        price: 799,
        description:
            "A premium smartwatch with advanced health and fitness tracking",
        imagePath: "images/Ultra.jpg"),
  ];
  List<Product> _cart = [];

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  Future<void> loadCart() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final cartSnapshot = await FirebaseFirestore.instance
          .collection('carts')
          .doc(user.uid)
          .get();
      if (cartSnapshot.exists) {
        _cart = (cartSnapshot.data()?['cart'] as List)
            .map((item) => Product.fromMap(item))
            .toList();
        notifyListeners();
      }
    }
  }

  Future<void> saveCart() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await FirebaseFirestore.instance.collection('carts').doc(user.uid).set({
        'cart': _cart.map((item) => item.toMap()).toList(),
      });
    }
  }

  void addtoCart(Product item) {
    _cart.add(item);
    saveCart();
    notifyListeners();
  }

  void removefromCart(Product item) {
    _cart.remove(item);
    saveCart();
    notifyListeners();
  }
}
