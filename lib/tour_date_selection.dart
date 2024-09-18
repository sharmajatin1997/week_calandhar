import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:week_calandhar/common_widgets/common_app_bar.dart';
import 'package:week_calandhar/helper_widgets/app_buttons.dart';
import 'package:week_calandhar/helper_widgets/app_colors.dart';
import 'package:week_calandhar/helper_widgets/app_text.dart';

class TourDateSelection extends StatefulWidget {
  const TourDateSelection({super.key});

  @override
  State<TourDateSelection> createState() => _TourDateSelectionState();
}

class _TourDateSelectionState extends State<TourDateSelection> {

  final Set<DateTime> _selectedDays = LinkedHashSet<DateTime>(
    equals: isSameDay,
    // hashCode: getHashCode,
  );

  DateTime _focusedDay = DateTime.now();

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDays.clear();
      if(_selectedDays.isEmpty){
        _selectedDays.add(selectedDay);
      }
    });
    print(_selectedDays);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appbar(context: context, title: "Select Date", textSize: 19.0),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 25),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xffDADADA)), borderRadius: BorderRadius.circular(10)),
              child: TableCalendar(
                  firstDay: DateTime.now().subtract(Duration(days: DateTime.now().weekday)),
                  lastDay: DateTime.now()
                      .add(Duration(days:DateTime.daysPerWeek-DateTime.now().weekday-1)),
                  focusedDay:  _focusedDay,
                  calendarFormat: CalendarFormat.week,
                  daysOfWeekStyle: const DaysOfWeekStyle(
                    weekdayStyle: TextStyle(color: Color(0xffC4C4C4), fontSize: 12.0,),
                    weekendStyle: TextStyle(color: Color(0xffC4C4C4), fontSize: 12.0,),
                  ),
                  calendarStyle: const CalendarStyle(
                    defaultTextStyle: TextStyle(fontSize: 12.0, ),
                    weekendTextStyle: TextStyle(fontSize: 12.0,),
                    disabledTextStyle:
                        TextStyle(fontSize: 12.0, color: Color(0xffC4C4C4)),
                  ),
                  calendarBuilders: CalendarBuilders(
                    todayBuilder: (context, dateTime, focusedDay) {
                      return Container(
                        margin: const EdgeInsets.all(14),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(5)),
                        child: AppText(
                          text: DateFormat('dd').format(dateTime),
                          textSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                      );
                    },
                    selectedBuilder: (context, dateTime, focusedDay) {
                      return Container(
                        margin: const EdgeInsets.all(14),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: AppColors.appColor, borderRadius: BorderRadius.circular(5)),
                        child: AppText(
                          text: DateFormat('dd').format(dateTime),
                          textSize: 12.0,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      );
                    },
                  ),
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                    titleTextStyle:
                        TextStyle(fontWeight: FontWeight.w500, fontSize: 14.0),
                    leftChevronIcon: Icon(
                      Icons.arrow_back_ios,
                      size: 17,
                      color: Color(0xffDADADA),
                    ),
                    rightChevronIcon: Icon(
                      Icons.arrow_forward_ios,
                      size: 17,
                      color: Color(0xffDADADA),
                    ),
                    rightChevronMargin: EdgeInsets.zero,
                  ),
                  selectedDayPredicate: (day) {
                    // Use values from Set to mark multiple days as selected
                    return _selectedDays.contains(day);
                  },
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  onDaySelected: _onDaySelected
                ),
            ),
            AppButtons(
              text: "Continue",
              onTap: () {
               //  Get.toNamed(Routes.addItinerary,
               //      arguments: {"days": _selectedDays});
              },
              padding: const EdgeInsets.symmetric(vertical: 20),
              borderRadius: 10,
              borderWidth: 1.3,
              margin: const EdgeInsets.only(top: 25, bottom: 10),
              textSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}

