import 'package:flutter/material.dart';
import 'package:fluttertest/model/user.dart';

import '../helper/dbhelper.dart';

class UserProvider extends ChangeNotifier {
  final List<User> _myAllData = [];
  List<User> get myAllData {
    return [..._myAllData];
  }

  void additem(User userdata) async {
    await DBhelper.insert(DateTime.now.toString(), userdata);
    // print('useradded');

    // notifyListeners();
  }

  void deletedata(int index) {
    DBhelper.deleteData(index);
    notifyListeners();
  }

  void getMyData() {
    print('hello get data');
    _myAllData.clear();
    // DBhelper.deleteData();
    final List<User> data = DBhelper.fetchdata();

    for (var i in data) {
      _myAllData.add(i);
    }
  }

  void updateUser(int key, User userdata) async {
    print('key--->$key');
    await DBhelper.update(key.toString(), userdata);
    DBhelper.deleteData(key);
    // print('useradded');

    // notifyListeners();
  }

  User findbyID(int? index) {
    return myAllData[index!];
  }
}
