import 'package:flutter/material.dart';
import 'package:fluttertest/Screens/homescreen.dart';
import 'package:fluttertest/model/user.dart';
import 'package:fluttertest/provider/user_provider.dart';

import 'package:provider/provider.dart';

class AddUsers extends StatefulWidget {
  const AddUsers({Key? key}) : super(key: key);
  static const String id = "/AddUsers";

  @override
  State<AddUsers> createState() => _AddUsersState();
}

enum Gender {
  male,
  female,
}

class _AddUsersState extends State<AddUsers> {
  Gender gender = Gender.male;
  late int index;
  final formGlobalKey = GlobalKey<FormState>();
  User user = User(
      city: '', dob: '', email: '', gender: '', mobile: '', name: '', id: '');
  bool isUpdate = false;
  Future<void> _saveForm(bool update) async {
    var validator = formGlobalKey.currentState?.validate();
    if (!validator!) {
      return;
    }

    formGlobalKey.currentState?.save();
    print(update);
    if (update) {
      Provider.of<UserProvider>(context, listen: false).updateUser(
          index,
          User(
            city: user.city,
            dob: user.dob,
            email: user.email,
            gender: gender.toString(),
            mobile: user.mobile,
            name: user.name,
            id: DateTime.now().toIso8601String(),
          ));
    } else {
      Provider.of<UserProvider>(context, listen: false).additem(
        User(
          city: user.city,
          dob: user.dob,
          email: user.email,
          gender: gender.toString(),
          mobile: user.mobile,
          name: user.name,
          id: DateTime.now().toIso8601String(),
        ),
      );
    }
    Navigator.of(context).pushNamed(HomeScreen.id);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    index = ModalRoute.of(context)?.settings.arguments as int;
    if (index == -1) {
      return;
    }
    //print(itemID);
    if (user == null) {
      print(user);
      return;
    }
    user = Provider.of<UserProvider>(context, listen: false).findbyID(index);
    setState(() {
      isUpdate = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(user);
    return Scaffold(
      appBar: AppBar(
        title:
            user != null ? const Text("Add User") : const Text("Update User"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formGlobalKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TextFormField(
                // initialValue: user.name !=null ? user.name : ,
                initialValue: user != null ? user.name : ' ',
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(labelText: 'Name'),
                textInputAction: TextInputAction.next,
                onChanged: (val) {
                  user.name = val;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter a Name";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 7,
              ),
              TextFormField(
                initialValue: user != null
                    ? user.email
                    : ' ', // controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(labelText: 'Email'),
                textInputAction: TextInputAction.next,
                onChanged: (val) {
                  user.email = val;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter a Email";
                  } else if (!value.contains('@')) {
                    return "Please Enter a valid Email";
                  } else if (!value.contains('.com')) {
                    return "Please Enter a valid Email";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 7,
              ),
              TextFormField(
                initialValue: user != null ? user.city : ' ',
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(labelText: 'City'),
                textInputAction: TextInputAction.next,
                onChanged: (val) {
                  user.city = val;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter a City";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 7,
              ),
              TextFormField(
                initialValue: user != null ? user.mobile : ' ',
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(labelText: 'Mobile'),
                textInputAction: TextInputAction.next,
                onChanged: (val) {
                  user.mobile = val;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter a Mobile no.";
                  } else if (value.length != 10) {
                    return "Please Enter a valid Mobile No.";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 7,
              ),
              TextFormField(
                initialValue: user != null ? user.dob : ' ',
                decoration: const InputDecoration(labelText: 'Dob'),
                keyboardType: TextInputType.datetime,
                textInputAction: TextInputAction.next,
                onChanged: (val) {
                  user.dob = val;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter a DOB";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 7,
              ),
              const Text(
                'Select Gender',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Row(
                //  mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: ListTile(
                      title: const Text('Male'),
                      leading: Radio(
                        value: Gender.male,
                        groupValue: gender,
                        onChanged: (val) {
                          setState(() {
                            gender = val! as Gender;
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListTile(
                      title: const Text('Female'),
                      leading: Radio(
                        value: Gender.female,
                        groupValue: gender,
                        onChanged: (val) {
                          setState(() {
                            gender = val! as Gender;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 7,
              ),
              ElevatedButton(
                onPressed: () {
                  _saveForm(isUpdate);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50)),
                child: user != null
                    ? const Text("Add User")
                    : const Text("Update User"),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
