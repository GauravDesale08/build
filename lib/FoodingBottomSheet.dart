import 'package:flutter/material.dart';

class FoodingBottomSheet extends StatefulWidget {
  @override
  _FoodingBottomSheetState createState() => _FoodingBottomSheetState();
}

class _FoodingBottomSheetState extends State<FoodingBottomSheet> {
  int _selectedContainerIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Fooding',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildContainer('Vegetables', 0),
                    _buildContainer('Grocery', 1),
                    _buildContainer('Breakfast', 2),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildContainer('Eating out', 3),
              _buildContainer('Others', 4),
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
                  foregroundColor: Colors.white, backgroundColor: Color(0xFF354250), // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Set border radius
                  ),
                  minimumSize: Size(100, 48), // Set the width to match_parent and height to 48
                ),
                child: Text('Back'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Remove current bottom sheet
                  _showSelectAccountBottomSheet(context); // Show the next bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Color(0xFF354250), // Text color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Set border radius
                  ),
                  minimumSize: Size(100, 48), // Set the width to match_parent and height to 48
                ),
                child: Text('Continue'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContainer(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedContainerIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: _selectedContainerIndex == index ? Colors.green : Colors.grey[200],
        ),
        child: Text(text),
      ),
    );
  }

  void _showSelectAccountBottomSheet(BuildContext context) {
    String selectedValue = 'account'; // Initial value

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select Account',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 2,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.account_balance),
                          title: Text('Account 1'),
                          trailing: Radio(
                            value: 'account',
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value.toString();
                              });
                            },
                          ),
                        ),
                        ListTile(
                          leading: Icon(Icons.credit_card),
                          title: Text('Credit Card'),
                          trailing: Radio(
                            value: 'credit',
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value.toString();
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Remove current bottom sheet
                          _showFoodingBottomSheet(context); // Show the previous bottom sheet
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Color(0xFF354250), // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // Set border radius
                          ),
                          minimumSize: Size(100, 48), // Set the width to match_parent and height to 48
                        ),
                        child: Text('Back'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // Remove current bottom sheet
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Color(0xFF354250), // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15), // Set border radius
                          ),
                          minimumSize: Size(100, 48), // Set the width to match_parent and height to 48
                        ),
                        child: Text('Continue'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
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
