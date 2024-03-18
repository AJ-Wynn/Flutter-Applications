import 'package:flutter/material.dart';
import 'package:task_management/pages/home_page.dart';
import 'package:task_management/pages/task_detail_page.dart';

import 'data/task_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      onGenerateRoute: (settings) {
        late Widget page;
        switch (settings.name) {
          case TaskDetailPage.routeName:
            page = TaskDetailPage(settings.arguments as Task);
            break;
          case MyHomePage.routeName:
          default:
            page = const MyHomePage();
            break;
        }

        return MaterialPageRoute<dynamic>(builder: (context) => page);
      },
      home: const MyHomePage(),
    );
  }
}
