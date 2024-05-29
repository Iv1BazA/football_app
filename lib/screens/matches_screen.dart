import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/const/app_colors.dart';
import 'package:football_app/const/app_styles.dart';
import 'package:football_app/const/model.dart';
import 'package:football_app/const/matches.dart';
import 'package:football_app/screens/match_info_screen.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class MatchesWidget extends StatefulWidget {
  const MatchesWidget({super.key});

  @override
  State<MatchesWidget> createState() => _MatchesWidgetState();
}

class _MatchesWidgetState extends State<MatchesWidget> {
  int _selectedDateIndex = -1;
  DateTime _focusedDate = DateTime.now();
  DateTime _selectedDate = DateTime.now();

  List<DateTime> generateDates(DateTime date) {
    final firstDayOfMonth = DateTime(date.year, date.month, 1);
    final lastDayOfMonth = DateTime(date.year, date.month + 1, 0);
    return List<DateTime>.generate(
      lastDayOfMonth.day,
      (index) => firstDayOfMonth.add(Duration(days: index)),
    );
  }

  late List<DateTime> dates = generateDates(_focusedDate);

  String getWeekdayLetter(DateTime date) {
    switch (date.weekday) {
      case DateTime.monday:
        return 'M';
      case DateTime.tuesday:
        return 'T';
      case DateTime.wednesday:
        return 'W';
      case DateTime.thursday:
        return 'T';
      case DateTime.friday:
        return 'F';
      case DateTime.saturday:
        return 'S';
      case DateTime.sunday:
        return 'S';
      default:
        return '';
    }
  }

  List<Matches> getMatchesForSelectedDate() {
    if (_selectedDateIndex == -1) return [];
    DateTime selectedDate = dates[_selectedDateIndex];
    return listMatches
        .where((match) =>
            match.date.year == selectedDate.year &&
            match.date.month == selectedDate.month &&
            match.date.day == selectedDate.day)
        .toList();
  }

  void _showDatePicker() async {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: Color(0xff1C1C1E),
                borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Column(
                  children: [
                    TableCalendar(
                      focusedDay: _focusedDate,
                      firstDay: DateTime(2000),
                      lastDay: DateTime(2100),
                      calendarFormat: CalendarFormat.month,
                      selectedDayPredicate: (day) {
                        return isSameDay(_selectedDate, day);
                      },
                      onDaySelected: (selectedDay, focusedDay) {
                        setModalState(() {
                          _selectedDate = selectedDay;
                        });
                        setState(() {
                          _selectedDate = selectedDay;
                          _focusedDate =
                              DateTime(selectedDay.year, selectedDay.month, 1);
                          dates = generateDates(_focusedDate);
                          _selectedDateIndex = dates.indexWhere((date) =>
                              date.year == selectedDay.year &&
                              date.month == selectedDay.month &&
                              date.day == selectedDay.day);
                        });
                      },
                      calendarStyle: CalendarStyle(
                        outsideDaysVisible: false,
                        defaultTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        weekendTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        todayTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        todayDecoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        selectedTextStyle: TextStyle(
                          color: Colors.green,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        selectedDecoration: BoxDecoration(
                          color: Colors.transparent,
                        ),
                        cellMargin: EdgeInsets.all(2.0),
                      ),
                      headerStyle: HeaderStyle(
                        titleCentered: true,
                        titleTextStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        formatButtonVisible: false,
                        leftChevronIcon: Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 30,
                        ),
                        rightChevronIcon: Icon(
                          Icons.chevron_right,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        weekendStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        dowTextFormatter: (date, locale) {
                          return DateFormat.E(locale).format(date)[0];
                        },
                      ),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green),
                        child: Center(
                          child: Text(
                            'Close',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Matches> matches = getMatchesForSelectedDate();
    matches.sort((a, b) => a.date.compareTo(b.date));

    List<Matches> pastMatches = listMatches
        .where((match) => match.date.isBefore(DateTime.now()))
        .toList();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 30),
              Center(
                child: Text('Matches', style: mainstyle),
              ),
              IconButton(
                icon: Icon(Icons.calendar_today, color: Colors.white),
                onPressed: _showDatePicker,
              ),
            ],
          ),
          SizedBox(height: 15),
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: dates.length,
              itemBuilder: (context, index) {
                final date = dates[index];
                final isSelected = _selectedDateIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDateIndex = index;
                    });
                  },
                  child: Container(
                    width: 50,
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          getWeekdayLetter(date),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 5),
                        Text(
                          date.day.toString(),
                          style: TextStyle(
                            color: isSelected ? Colors.green : Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 15),
          Text('All Matches', style: mainstyle),
          SizedBox(height: 20),
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: Container(
              height: 500,
              child: ListView.builder(
                itemCount: matches.length,
                itemBuilder: (context, index) {
                  Matches match = matches[index];
                  bool isPastMatch = match.date.isBefore(DateTime.now());
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoMatchWidget(
                            match: match,
                            pastMatches: pastMatches,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey.withOpacity(0.2),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'UEFA Champions League | Final',
                                style: TextStyle(
                                  color: grey,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Spacer(),
                              Text(
                                isPastMatch ? 'FT' : '10:00',
                                style: TextStyle(
                                  color: primary,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.grey),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SvgPicture.asset(match.icon1),
                              SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  match.team1,
                                  style: mainstyle.copyWith(
                                      color: Colors.white, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  isPastMatch
                                      ? '${match.scoreteam1}:${match.scoreteam2}'
                                      : 'VS',
                                  style: mainstyle.copyWith(fontSize: 21),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  match.team2,
                                  style: mainstyle.copyWith(
                                      color: Colors.white, fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(width: 5),
                              SvgPicture.asset(match.icon2),
                            ],
                          ),
                          SizedBox(height: 5),
                          Center(
                            child: Text(
                              '${DateFormat.E().format(match.date)}, ${match.date.month}/${match.date.day}',
                              style: mainstyle.copyWith(
                                fontWeight: FontWeight.w400,
                                color: grey,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
