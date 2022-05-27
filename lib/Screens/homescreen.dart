import 'package:flutter/material.dart';
import 'package:fluttertest/Screens/add_user_screen.dart';
import 'package:fluttertest/model/user.dart';
import 'package:fluttertest/provider/user_provider.dart';
import 'package:fluttertest/widgets/custom_drawer.dart';
import 'package:fluttertest/widgets/showsnackbar.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String id = "/homescreen";
  @override
  State<HomeScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<UserProvider>(context, listen: false).getMyData();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<UserProvider>(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AddUsers.id, arguments: -1);
          },
          isExtended: true,
          child: const Icon(Icons.add),
        ),
        drawer: const CustomDrawer(),
        appBar: AppBar(
          title: const Text('Test App'),
        ),
        body: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: data.myAllData.length,
          itemBuilder: (context, index) {
            var listdata = data.myAllData[index];
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                  tileColor: Colors.blue.shade100,
                  isThreeLine: true,
                  leading: const Icon(
                    Icons.person,
                    color: Colors.green,
                    size: 40,
                  ),
                  title: Text(listdata.name),
                  subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(listdata.city),
                        Text(listdata.mobile),
                        Text(listdata.email),
                      ]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title:
                                    const Text('Are you Sure to Delete User?'),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      data.deletedata(listdata.id);
                                      Navigator.of(context).pop();
                                      showSnackBar('Item Deleted', context);
                                    },
                                    child: const Text('yes'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('No'),
                                  ),
                                ],
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          )),
                      IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(AddUsers.id, arguments: index);
                            //showSnackBar('Item Deleted', context);
                          },
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.blue,
                          )),
                    ],
                  )

                  // Row(children: [
                  //   Expanded(
                  //       child: ),
                  //   Expanded(
                  //       child:
                  //           IconButton(onPressed: () {}, icon: Icon(Icons.edit))),
                  // ]),
                  ),
            );
          },
        ));
  }
}
