import 'package:buildmystore/Calender.dart';
import 'package:buildmystore/daily.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarContainer extends StatefulWidget {
  @override
  _CalendarContainerState createState() => _CalendarContainerState();
}

class _CalendarContainerState extends State<CalendarContainer> {
  DateTime _selectedDate = DateTime.now();

  void _updateDate(bool isNext) {
    setState(() {
      if (isNext) {
        _selectedDate = DateTime(_selectedDate.year, _selectedDate.month + 1, 1);
      } else {
        _selectedDate = DateTime(_selectedDate.year, _selectedDate.month - 1, 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String monthYear = DateFormat('MMMM yyyy').format(_selectedDate);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.calendar_today),
                    SizedBox(width: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          monthYear,
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 60),
                IconButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: () {
                    _updateDate(false);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    icon: Icon(Icons.chevron_right),
                    onPressed: () {
                      _updateDate(true);
                    },
                  ),
                ),
              ],
            ),
            DefaultTabController(
              length: 5,
              child: Column(
                children: [
                  TabBar(
                    isScrollable: true,
                    tabs: [
                      Tab(text: 'Daily'),
                      Tab(text: 'Monthly'),
                      Tab(text: 'Calendar'),
                      Tab(text: 'Total'),
                      Tab(text: 'Note'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 420, // Adjust the height as needed
                    child: TabBarView(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Daily(),
                          ),
                        ),

                        Container(
                          child: Daily(),
                        ),
                        SimpleCalendar(),
                        Container(
                          child: Daily(),
                        ),
                        Container(
                          child: Daily(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
