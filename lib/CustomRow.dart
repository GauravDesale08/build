import 'package:flutter/material.dart';

class CustomRow extends StatefulWidget {
  final String category;
  final String amount;
  final double percentage;
  final Color circleColor;

  CustomRow({
    required this.category,
    required this.amount,
    required this.percentage,
    required this.circleColor,
  });

  @override
  _CustomRowState createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 50, // Adjust the size of the circle as needed
          height: 50,
          decoration: BoxDecoration(
            color: widget.circleColor,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 16), // Add spacing between the circle and text
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.category,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.amount,
                style: TextStyle(fontSize: 14, color: Colors.green),
              ),
              Text(
                '${widget.percentage.toStringAsFixed(0)}%',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text('Custom Rows Example')),
      body: Column(
        children: [
          CustomRow(
            category: 'Loan Investment',
            amount: '\$1,500.00',
            percentage: 49,
            circleColor: Colors.green,
          ),
          CustomRow(
            category: 'House Expenses',
            amount: '\$479.90',
            percentage: 24,
            circleColor: Colors.orange,
          ),
          CustomRow(
            category: 'Fooding',
            amount: '\$520.00',
            percentage: 27,
            circleColor: Colors.purple,
          ),
        ],
      ),
    ),
  ));
}
