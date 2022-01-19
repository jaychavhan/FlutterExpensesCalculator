import 'package:flutter/material.dart';
import './userTransaction.dart';
class NewTransaction extends StatelessWidget {
  final Function newTX;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction(this.newTX);
  void submitData()
  {
    final newEnteredTitle = titleController.text;
    final newEnteredAmount = double.parse(amountController.text);
    if(newEnteredTitle.isEmpty || newEnteredAmount<0)
    {
      return;
    }
    newTX(newEnteredTitle, newEnteredAmount);
  }
  @override
  Widget build(BuildContext context) {
    return Card(
            elevation: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'Title'),
                    controller: titleController,
                    onSubmitted: (_) => submitData(),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount'),
                    controller: amountController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    onSubmitted: (_) => submitData(),
                  ),
                  FlatButton(
                    onPressed: submitData,
                    child: Text("Add Transaction"),
                    textColor: Colors.amber[800],
                  ),
                ],
              ),
            ),
          );
  }
}