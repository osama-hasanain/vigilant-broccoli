import 'package:flutter/material.dart';
import 'package:flutter_homework/db_helper.dart';
import 'package:flutter_homework/home.dart';
import 'package:flutter_homework/provider/app_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return AppProvider();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.comfortable,
        ),
        home: SafeArea(child: SplashScreen()),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DBHelper.dbHelper.getAllTask().then((value) {
      DBHelper.dbHelper.getAllTask();
      Provider.of<AppProvider>(context,listen: false).setValue(DBHelper.dbHelper.allTasks);
      Route route = MaterialPageRoute(builder: (context) => Home());
      Navigator.pushReplacement(context, route);
    });

    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
          ],
        ),
      ),

      // body: FutureBuilder(
      //   future: DBHelper.dbHelper.getAllTask(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return Consumer<AppProvider>(
      //         builder: (context, value, child) {
      //           return Column(
      //             mainAxisAlignment: MainAxisAlignment.center,
      //             children: [
      //               CircularProgressIndicator(),
      //             ],
      //           );
      //         },
      //       );
      //     } else {
      //       DBHelper.dbHelper.getAllTask().then((value) {
      //         return DBHelper.dbHelper.allTasks ;
      //         DBHelper.dbHelper.allTasks.forEach((element) {
      //           AppProvider().setValue(element.name, element.isDone ? 1 : 0);
      //           Navigator.of(context)
      //               .push(MaterialPageRoute(builder: (context) {
      //             return Home();
      //           }));
      //         });
      //       });
      //     }
      //   },
      // ),
    );
  }
}
