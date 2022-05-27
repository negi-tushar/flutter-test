import 'package:flutter/material.dart';
import 'package:fluttertest/model/user.dart';

import '../helper/dbhelper.dart';

class UserProvider extends ChangeNotifier {
  final List<User> _myAllData = [];
  List<User> get myAllData {
    return [..._myAllData];
  }

  void additem(User userdata) async {
    await DBhelper.insert(userdata.id, userdata);
    // print('useradded');

    // notifyListeners();
  }

  void deletedata(String id) {
    DBhelper.deleteData(id);
    notifyListeners();
  }

  void getMyData() {
    _myAllData.clear();
    // DBhelper.deleteData();
    final List<User> data = DBhelper.fetchdata();
    print(data.length);
    for (var i in data) {
      _myAllData.add(i);
    }
  }

  // void updateUser(int key, User userdata) async {
  //   print('key--->$key');
  //   await DBhelper.update(key.toString(), userdata);
  //   DBhelper.deleteData(key);
  //   // print('useradded');

  //   // notifyListeners();
  // }

  User findbyID(int? index) {
    return myAllData[index!];
  }
}
