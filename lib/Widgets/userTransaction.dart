import 'package:flutter/material.dart';
import './newtransaction.dart';
import './Transaction_List.dart';
import '../Modules/Transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _Transactions = [
    Transaction(id: 't1', title: 'Shoes', amount: 88.99, date: DateTime.now()),
    Transaction(
        id: 't2', title: 'Costco', amount: 150.49, date: DateTime.now()),
  ];
  void _addNewTransaction(String newTitle, double newAmount) {
    final newTX = Transaction(
        title: newTitle,
        amount: newAmount,
        date: DateTime.now(),
        id: DateTime.now().toString());

    setState(() {
      _Transactions.add(newTX);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [NewTransaction(_addNewTransaction), TransactionList(_Transactions)],
    );
  }
}
