import 'package:fluttertest/model/user.dart';
import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class DBhelper {
  static Box<User> boxdata = Hive.box<User>('Database');

  static Future<void> database() async {
    //geting app Directiory
    Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    //Registering Adapter
    Hive.registerAdapter<User>(UserAdapter());
    //Opening Box
    await Hive.openBox<User>('Database');
    // boxdata.deleteFromDisk();
  }

  static Future<void> insert(String id, User data) async {
    print('insert');
    await boxdata.put(id, data);
  }

  // static Future<void> update(String id, User data) async {
  //   print('update');
  //   await boxdata.put(id, data);
  // }

  static List<User> fetchdata() {
    List<User> data = boxdata.values.toList();
    // print(data.length);
    return data;
  }

  static Future<void> deleteData(String id) async {
    await boxdata.delete(id);
    // await boxdata.clear();
  }
}
