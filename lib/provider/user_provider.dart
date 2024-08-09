import 'package:flutter/material.dart';
import 'package:flutter_app_todo_fri_c11/model/my_user.dart';

class UserProvider extends ChangeNotifier {
  MyUser? currentUser;

  void updateUser(MyUser newUser) {
    currentUser = newUser;
    notifyListeners();
  }
}
