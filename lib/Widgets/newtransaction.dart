import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class NewTransaction extends StatefulWidget {
  final Function newTX;

  NewTransaction(this.newTX);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final newEnteredTitle = _titleController.text;
    final newEnteredAmount = double.parse(_amountController.text);
    if (newEnteredTitle.isEmpty || newEnteredAmount < 0 || _selectedDate == null) {
      return;
    }
    widget.newTX(newEnteredTitle, newEnteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _datePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now(),)
        .then((datepicked) {
          if(datepicked == null) {return;}
          setState(() {
            _selectedDate = datepicked;
          });
          
        });
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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 50,
              child: Row(
                children: [
                  Expanded(child: Text(_selectedDate == null? 'Date not Selected' : 'Selected Date: ${DateFormat.yMMMd().format(_selectedDate)}' )),
                  FlatButton(
                      textColor: Theme.of(context).accentColor,
                      onPressed: _datePicker,
                      child: Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ),
            RaisedButton(
              onPressed: _submitData,
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              child: Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
