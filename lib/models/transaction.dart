import 'package:shortid/shortid.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final String date;

  Transaction({required this.title, required this.amount, required this.date})
      : id = shortid.generate();
}