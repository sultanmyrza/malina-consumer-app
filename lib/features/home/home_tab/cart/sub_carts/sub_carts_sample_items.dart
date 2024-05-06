import 'package:flutter/material.dart';

class ISubCartItem {
  final String title;
  final String description;
  final Widget thumbnail;
  final double price;

  ISubCartItem({
    required this.title,
    required this.description,
    required this.thumbnail,
    required this.price,
  });
}

var sampleCartItems = [
  ISubCartItem(
    title: "Том ям",
    description: "Пицца с соусом том ям 230 гр",
    thumbnail: Image.asset(
      "assets/images/item1784.png",
      fit: BoxFit.cover,
    ),
    price: 250,
  ),
  ISubCartItem(
    title: "Hadat Cosmetics",
    description:
        "Шампунь интенсивно восстанавливающий Hydro Intensive Repair Shampoo 250 мл",
    thumbnail: Image.asset("assets/images/item98.png"),
    price: 1900,
  ),
  ISubCartItem(
    title: "Hadat Cosmetics",
    description: "Увлажняющий кондиционер 150 мл",
    thumbnail: Image.asset("assets/images/item1787.png"),
    price: 2000,
  ),
  ISubCartItem(
    title: "L’Oreal Paris Elseve",
    description: "Шампунь для ослабленных волос",
    thumbnail: Image.asset("assets/images/item17878.png"),
    price: 600,
  )
];
