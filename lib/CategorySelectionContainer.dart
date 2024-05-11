import 'package:flutter/material.dart';

class CategorySelectionContainer extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;
  final VoidCallback? onPressed;

  const CategorySelectionContainer({
    Key? key,
    required this.icon,
    required this.text,
    this.isSelected = false,
    this.onPressed,
  }) : super(key: key);

  @override
  _CategorySelectionContainerState createState() =>
      _CategorySelectionContainerState();
}

class _CategorySelectionContainerState
    extends State<CategorySelectionContainer> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: _isSelected ? Colors.green : Colors.black),
          boxShadow: _isSelected
              ? [
            BoxShadow(
              color: Colors.green.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ]
              : [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icon,
              color: _isSelected ? Colors.green : null,
            ),
            SizedBox(height: 8),
            Text(
              widget.text,
              style: TextStyle(
                color: _isSelected ? Colors.green : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
