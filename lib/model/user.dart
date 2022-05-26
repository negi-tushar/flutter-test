import 'package:hive/hive.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String dob;
  @HiveField(2)
  late String mobile;
  @HiveField(3)
  late String city;
  @HiveField(4)
  late String email;
  @HiveField(5)
  late String gender;
  @HiveField(6)
  late String id;

  User(
      {required this.city,
      required this.dob,
      required this.email,
      required this.gender,
      required this.mobile,
      required this.name,
      required this.id});
}
