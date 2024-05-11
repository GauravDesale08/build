import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'FoodingBottomSheet.dart';

class CategoryBottomSheet extends StatefulWidget {
  @override
  _CategoryBottomSheetState createState() => _CategoryBottomSheetState();
}

class _CategoryBottomSheetState extends State<CategoryBottomSheet> {
  IconData? selectedIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Choose Category',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryContainer(Icons.monetization_on_sharp, 'Loan'),
              _buildCategoryContainer(Icons.home, 'House'),
              _buildCategoryContainer(Icons.food_bank_outlined, 'Fooding'),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryContainer(Icons.category, 'Health'),
              _buildCategoryContainer(Icons.local_shipping_rounded, 'Vehicle'),
              _buildCategoryContainer(Icons.accessibility, 'Fashion'),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Remove bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.grey, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Button padding
                ),
                child: Text('Back'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (selectedIcon != null) {
                    Navigator.pop(context); // Remove current bottom sheet
                    _showFoodingBottomSheet(context); // Show next bottom sheet
                  }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.green, // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24), // Button padding
                ),
                child: Text('Continue'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryContainer(IconData icon, String text) {
    bool isSelected = selectedIcon == icon;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIcon = icon;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: isSelected ? Colors.green : Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            SizedBox(height: 8),
            Text(text),
          ],
        ),
      ),
    );
  }

  void _showFoodingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return FoodingBottomSheet();
      },
    );
  }
}
