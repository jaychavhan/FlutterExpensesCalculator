import 'package:flutter/material.dart';
import '../Modules/Transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekday = DateTime.now().subtract(Duration(days: index));
      var totalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekday.day &&
            recentTransaction[i].date.day == weekday.month &&
            recentTransaction[i].date.day == weekday.year) {
              totalSum += recentTransaction[i].amount;
            }
      }
      print(DateFormat.E().format(weekday));
      print(totalSum);
      return {'day': DateFormat.E().format(weekday).substring(0,1), 'amount': totalSum};
    });
  }


  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
        elevation: 6,
        margin: EdgeInsets.all(20),
        child: Column(
          children: groupedTransactionValues.map((data) {
            return Text('${data['day']}: ${data['amount']}');
          }).toList(),
        ));
  }
}
