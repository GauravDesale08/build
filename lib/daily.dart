import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Daily extends StatefulWidget {
  @override
  _DailyState createState() => _DailyState();
}

class _DailyState extends State<Daily> {
  double income = 0.00;
  double expenses = 0.00;
  double total = 0.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text(income.toStringAsFixed(2), style: TextStyle(fontSize: 30.0, color: Colors.blue)),
                    Text('Income', style: TextStyle(fontSize: 14.0)),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(expenses.toStringAsFixed(2), style: TextStyle(fontSize: 30.0, color: Colors.red)),
                    Text('Expenses', style: TextStyle(fontSize: 14.0)),
                  ],
                ),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text(total.toStringAsFixed(2), style: TextStyle(fontSize: 30.0, color: Colors.black)),
                    Text('Total', style: TextStyle(fontSize: 14.0)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(height: 1),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Repeat'),
                SizedBox(width:10),
                Text('Personal Loan for Diary', textAlign: TextAlign.center),
                SizedBox(width:10),
                Text('-96,191.00', style: TextStyle(color: Colors.red)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('6/5, 6/7, 6/10'),
              ],
            ),
            SizedBox(height: 10,),
            Divider(height: 1),
          ],
        ),
      ),
    );
  }
}
