import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_management/data/employees.dart';

class ProfilePage extends StatelessWidget {

  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            title: const Text('My Profile',
                style: TextStyle(
                  color: Colors.white,
                )),
            backgroundColor: Colors.deepPurple,
            automaticallyImplyLeading: false,
            leading: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
                size: 30.0,
              ),
            )),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                child: Card(
                  elevation: 3.0,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(profile.fullName.split(' ')[0],
                          style: const TextStyle(fontSize: 20.0)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                        child: Container(
                            width: 164.0,
                            height: 164.0,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      'https://us.123rf.com/450wm/cunaplus/cunaplus1601/cunaplus160100017/50383487-portrait-of-a-saleswoman-with-crossed-arms-at-the-supermarket.jpg?ver=6'),
                                  fit: BoxFit.contain,
                                ))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                        child: Container(
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Full Name',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            child: Text(profile.fullName, style: const TextStyle(fontSize: 16.0) )
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                        child: Container(
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Department',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            child: Text(profile.getDepartment(), style: const TextStyle(fontSize: 16.0) )
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                        child: Container(
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Reporting to',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            child: Text(profile.manager, style: const TextStyle(fontSize: 16.0) )
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                        child: Container(
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: 'Shift',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            child: Text(profile.shift, style: const TextStyle(fontSize: 16.0) )
                          ),
                        ),
                      ),


                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40.0, bottom: 25.0),
                          child: SizedBox(
                            height: 40.0,
                            width: 135.0,
                            child: OutlinedButton(
                                onPressed: () {
                                // lotOut function
                                },
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30.0))),
                                    side: MaterialStateProperty.all(
                                        const BorderSide(
                                            color: Color(0xff79747E),
                                            width: 1.0,
                                            style: BorderStyle.solid))),
                                child: const Row(
                                  children: [
                                  Icon(Icons.logout,
                                      size: 18.0),
                                  SizedBox(width: 10.0),
                                  Text('Log Out'),
                                ])),
                          ),
                        ),
                      )
                    ]

                  )
                )
        )
      )
    );
  }
}


