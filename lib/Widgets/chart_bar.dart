import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final label;
  final spendingAmount;
  final pctOfTotalAmount;
  ChartBar(this.label, this.spendingAmount, this.pctOfTotalAmount);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  
                  color: Theme.of(context).accentColor,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              FractionallySizedBox(
                heightFactor: 1 - pctOfTotalAmount,
                child: Container(
                  decoration: BoxDecoration(
                    
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30) ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(label),
      ],
    );
  }
}
