import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/Widgets/Transaction_List.dart';
import 'package:intl/intl.dart';
import './Widgets/newtransaction.dart';
import './Widgets/Transaction_List.dart';
import './Modules/Transaction.dart';
import './Widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
          primarySwatch: Colors.amber, accentColor: Colors.lightBlueAccent),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _Transactions = [
    // Transaction(id: 't1', title: 'Shoes', amount: 88.99, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'Costco', amount: 50.49, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _Transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String newTitle, double newAmount, DateTime selectedDate) {
    final newTX = Transaction(
        title: newTitle,
        amount: newAmount,
        date: selectedDate,
        id: DateTime.now().toString());

    setState(() {
      _Transactions.add(newTX);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _Transactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Personal Expenses'),
      actions: [
        IconButton(
            onPressed: () {
              _startNewTransaction(context);
            },
            icon: Icon(Icons.add))
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.3 -
                    appBar.preferredSize.height,
                child: Chart(_recentTransactions)),
            Container(
                height: MediaQuery.of(context).size.height * 0.7 -
                    appBar.preferredSize.height,
                child: TransactionList(_Transactions, _deleteTransaction)),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _startNewTransaction(context);
          },
          child: Icon(Icons.add)),
    );
  }
}
