import 'package:flutter/material.dart';

class BasketModel {
  final String name;
  final String genus;
  final String image;
  final int quantity;
  final String date;

  BasketModel({
    @required this.name,
    @required this.genus,
    @required this.image,
    @required this.quantity,
    @required this.date,
  });
}
