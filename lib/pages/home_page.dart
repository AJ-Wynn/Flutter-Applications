import 'package:flutter/material.dart';
import 'package:task_management/components/task_card.dart';
import 'package:task_management/data/task_model.dart';
import 'package:task_management/data/tasks.dart';
import 'package:task_management/pages/profile_page.dart';

import '../components/filter_pills.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String selectedFilter = 'All tasks';

  @override
  Widget build(BuildContext context) {

    // .where(function) method filters through an iterable and if the given function returns true, element gets added to new list
    Iterable<Task> filteredList = taskList.where((task) {
      return task.getCompletionStatusText() == selectedFilter;
      });


    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks',
            style: TextStyle(
              color: Colors.white,
            )),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          },
          child: const Icon(Icons.person, color: Colors.white),
          ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          // onSelected function detects when each filter is tapped by user
          // When user taps on a filter, the value that gets returned is a String
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: FilterPills(onSelected: (value) {
              // notify framework that we are updating the State object, selectedFilter
              setState(() {
                selectedFilter = value;
              });
            }),
          ),

          // Expanded widget takes up the remaining space
          Expanded(
            child: Center(
              child: ListView(children: [
                 if (selectedFilter == 'All tasks') ...{
                  for (var task in taskList)
                  TaskCard(task),
                 }
                 else ...{
                  for (var task in filteredList)
                  TaskCard(task),
                 }

              ]),
            ),
          ),
        ],
      ),
    );
  }
}
