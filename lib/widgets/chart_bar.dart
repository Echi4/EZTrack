import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions, {super.key});

  List<Map<String, Object>> get getTransactionsDaily {
    return List.generate(7, (index) {
      var totalAmountPerDay = 0.0;
      final weekDay = DateTime.now().subtract(Duration(days: index));
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalAmountPerDay += recentTransactions[i].amount;
        }
      }
      return {
        "Day": DateFormat.E().format(weekDay),
        "Amount": totalAmountPerDay
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Row(
        children: [Text("Show Chart Bars Here")],
      ),
    );
  }
}
