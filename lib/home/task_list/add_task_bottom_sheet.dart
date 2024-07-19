import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              ' Add new Task',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        onChanged: (text) {
                          title = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter task title';
                          }
                          return null;

                          /// valid
                        },
                        decoration:
                            InputDecoration(hintText: 'Enter task title'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextFormField(
                        onChanged: (text) {
                          description = text;
                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'Please enter task description';
                          }
                          return null;
                        },
                        decoration:
                            InputDecoration(hintText: 'Enter task Description'),
                        maxLines: 4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Select Date',
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {
                          showCalendar();
                        },
                        child: Text(
                          '${selectedDate.day}/${selectedDate.month}'
                          '/${selectedDate.year}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          addTask();
                        },
                        child: Text(
                          'Add',
                          style: Theme.of(context).textTheme.titleLarge,
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void showCalendar() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chosenDate != null) {
      selectedDate = chosenDate;
      setState(() {});
    }
    // selectedDate = chosenDate ?? selectedDate ;
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {
      /// add task
    }
  }
}
