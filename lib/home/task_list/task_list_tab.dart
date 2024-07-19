import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_fri_c11/home/task_list/task_list_item.dart';

class TaskListTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          EasyDateTimeLine(
            locale: 'en',
            initialDate: DateTime.now(),
            onDateChange: (selectedDate) {
              //`selectedDate` the new date selected.
            },
            headerProps: const EasyHeaderProps(
              monthPickerType: MonthPickerType.switcher,
              dateFormatter: DateFormatter.fullDateDMY(),
            ),
            dayProps: const EasyDayProps(
              dayStructure: DayStructure.dayStrDayNumMonth,
              activeDayStyle: DayStyle(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff3371FF),
                      Color(0xff8426D6),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TaskListItem();
              },
              itemCount: 30,
            ),
          )
        ],
      ),
    );
  }
}
