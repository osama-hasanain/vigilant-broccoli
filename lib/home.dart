import 'package:flutter_homework/addtask.dart';
import 'package:flutter_homework/frag1.dart';
import 'package:flutter_homework/frag2.dart';
import 'package:flutter_homework/frag3.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this); // to add custom Tab Controller
    super.initState();
  }


  ////// To Move From Controller //////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabBarController(context),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return AddTask();
            }));
          }),
    );
  }

  Widget tabBarController(var context) {
  return DefaultTabController(
    //// Tab Controller have tabs
    length: 3, // number of pages
    child: Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
        bottom: tapViewTaps()
      ),
      body: TabBarView(
        children: [Frag1(), Frag2(), Frag3()],
      ),
    ),
  );
}
//////////////////////////

//// Tapview Tabs /////
Widget tapViewTaps() {
  return TabBar(
    tabs: [
      Tab(child: Text('All Tasks')),
      Tab(child: Text('Complete Tasks')),
      Tab(child: Text('InCompleteTasks'))
    ],
    // isScrollable: true,
  );
}
}