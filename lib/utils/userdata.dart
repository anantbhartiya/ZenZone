import 'package:flutter/material.dart';

class UserData with ChangeNotifier {
  String firstName;
  String lastName;
  String middleName;

  UserData({this.firstName = '', this.lastName = '', this.middleName = ''});

  void splitFullName(String fullName) {
    final names = fullName.trim().split(' ');
    if (names.length >= 2) {
      firstName = names[0];
      lastName = names[names.length - 1];
      middleName = names.length > 2 ? names.sublist(1, names.length - 1).join(' ') : '';
    }
  }
}
