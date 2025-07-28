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
  const Shopping({
    required this.item,
    required this.price,
    required this.category,
  });

  final String item;
  final int price;
  final Category category;
}
