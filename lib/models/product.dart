import 'package:flutter/material.dart';

enum Category {
  sitting(color: Colors.blue, title: 'Sitting'),
  kitchen(color: Colors.grey, title: 'kitchen'),
  bathroom(color: Colors.green, title: 'bathroom'),
  bedroom(color: Colors.yellow, title: 'bedroom');

  const Category({required this.color, required this.title});

  final Color color;
  final String title;
}

class Shopping {
  final String item;
  final int price;
  final Category category;

  Shopping({required this.item, required this.price, required this.category});

  Map<String, dynamic> toMap() {
    return {'item': item, 'price': price, 'category': category.name};
  }

  static Shopping fromMap(Map<String, dynamic> map) {
    return Shopping(
      item: map['item'],
      price: map['price'],
      category: Category.values.firstWhere(
        (c) => c.name == map['category'],
        orElse: () => Category.kitchen,
      ),
    );
  }
}
