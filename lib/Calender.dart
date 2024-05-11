import 'package:flutter/material.dart';
import 'package:buildmystore/daily.dart';

class SimpleCalendar extends StatefulWidget {
  @override
  _SimpleCalendarState createState() => _SimpleCalendarState();
}

class _SimpleCalendarState extends State<SimpleCalendar> {
  DateTime _selectedDate = DateTime.now();

  List<DateTime> _getDaysInMonth(DateTime month) {
    final List<DateTime> days = [];
    final int daysInMonth = DateTime(month.year, month.month + 1, 0).day;

    for (int day = 1; day <= daysInMonth; day++) {
      days.add(DateTime(month.year, month.month, day));
    }

    return days;
  }

  @override
  Widget build(BuildContext context) {
    final List<DateTime> daysInMonth = _getDaysInMonth(_selectedDate);
    final DateTime firstDayOfMonth = DateTime(_selectedDate.year, _selectedDate.month, 1);
    final int weekdayOfFirstDay = firstDayOfMonth.weekday;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TableCalendarHeader(),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
            ),
            itemCount: daysInMonth.length + weekdayOfFirstDay - 1,
            itemBuilder: (context, index) {
              if (index < weekdayOfFirstDay - 1) {
                return Container(); // Empty space before the first day of the month
              } else {
                final DateTime day = daysInMonth[index - weekdayOfFirstDay + 1];
                final bool isSelected = day.day == _selectedDate.day &&
                    day.month == _selectedDate.month &&
                    day.year == _selectedDate.year;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = day;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.transparent,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      day.day.toString(),
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class TableCalendarHeader extends StatelessWidget {
  final List<String> _daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: _daysOfWeek
          .map(
            (day) => Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            alignment: Alignment.center,
            child: Text(day),
          ),
        ),
      )
          .toList(),
    );
  }
}
