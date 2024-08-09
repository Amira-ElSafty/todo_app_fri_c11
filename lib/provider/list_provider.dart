import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo_fri_c11/model/task.dart';

import '../firebase_utils.dart';

class ListProvider extends ChangeNotifier {
  /// data
  List<Task> tasksList = [];
  var selectDate = DateTime.now();

  void getAllTasksFromFireStore(String uId) async {
    QuerySnapshot<Task> querySnapshot =
        await FirebaseUtils.getTasksCollection(uId).get();

    /// List<Task>      List<QueryDocumentSnapshot<Task>>
    tasksList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    /// filter all tasks => select date
    tasksList = tasksList.where((task) {
      if (selectDate.day == task.dateTime.day &&
          selectDate.month == task.dateTime.month &&
          selectDate.year == task.dateTime.year) {
        return true;
      }
      return false;
    }).toList();

    /// sorting tasks => select date
    tasksList.sort((Task task1, Task task2) {
      return task1.dateTime.compareTo(task2.dateTime);
    });

    notifyListeners();
  }

  void changeSelectDate(DateTime newSelectDate, String uId) {
    selectDate = newSelectDate;
    getAllTasksFromFireStore(uId);
    notifyListeners();
  }
}
