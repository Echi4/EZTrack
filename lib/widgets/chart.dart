import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const Chart(this.recentTransactions, {super.key});

  List<Map<String, dynamic>> get getRecentTransactionsData {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalAmountPerDay = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalAmountPerDay += recentTransactions[i].amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalAmountPerDay
      };
    });
  }

  double get getTotalWeeklySpending {
    return getRecentTransactionsData.fold(0.0, (previousValue, element) {
      return previousValue + element["amount"];
    });
  }

  @override
  Widget build(BuildContext context) {
    // getRecentTransactions;
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: getRecentTransactionsData.map((transactionData) {
          return ChartBar(
              transactionData["day"],
              transactionData["amount"],
              getTotalWeeklySpending == 0.0
                  ? 0.0
                  : transactionData["amount"] / getTotalWeeklySpending);
        }).toList(),
      ),
    );
  }
}
