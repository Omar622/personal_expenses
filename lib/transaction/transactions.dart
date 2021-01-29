import 'package:flutter/material.dart';

List<Transaction> transactions = [];//Transaction(date: DateTime.now(), price: 120.0, title: 'Hi')

class Transaction {
  final String title;
  final double price;
  final DateTime date;
  Transaction({
    @required this.title,
    @required this.price,
    @required this.date,
  });
}
