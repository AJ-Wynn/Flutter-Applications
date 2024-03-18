import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task_management/data/task_model.dart';

class TaskDetailPage extends StatefulWidget {
  // Use Generated Routing to push this page (TaskDetailPage) to the top of the navigation stack --> so page becomes visible to user
  static const routeName = '/task-details';
  final Task task;

  const TaskDetailPage(this.task, {Key? key}) : super(key: key);

  @override
  State<TaskDetailPage> createState() => _TaskDetailPageState();
}

class _TaskDetailPageState extends State<TaskDetailPage> {
  // Change TaskCard's status attribute to 'Cancelled'
  void cancelTask() {
    setState(() {
      widget.task.status = CompletionStatus.cancelled;
    });
  }

  // Change TaskCard's status attribute to 'inProgress'
  void startTask() {
    //notifies the framework that I am changing the internal state of this TaskCard object
    setState(() {
      widget.task.status = CompletionStatus.inProgress;
    });
  }

  // Change TaskCard's status attribute to 'Completed'
  void completeTask() {
    setState(() {
      widget.task.status = CompletionStatus.completed;
    });
  }

    Widget startButton() {
    return SizedBox(
      height: 40.0,
      width: 115.0,
      child: OutlinedButton(
          onPressed: () {
            startTask();
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
          child: const Row(children: [
            Icon(Icons.arrow_forward_rounded,
                size: 20.0),
            SizedBox(width: 10.0),
            Text('Start', style: TextStyle(fontSize: 12.0)),
          ])),
    );
  }

  Widget completeButton() {
    return SizedBox(
      height: 40.0,
      width: 160.0,
      child: TextButton(
          onPressed: () {
            completeTask();
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30.0))),
            backgroundColor:
                const MaterialStatePropertyAll<Color>(
                    Color(0xff6750A4)),
          ),
          child: const Row(children: [
            Icon(Icons.check_circle,
                size: 18.0, color: Colors.white),
            SizedBox(width: 10.0),
            Text(
              'Mark as Complete',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  ),
            ),
          ])),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Task Detail',
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
                child: ListView(children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    // First row
                    child: Row(
                      children: [
                        const SizedBox(
                            height: 28.0,
                            width: 28.0,
                            child: Icon(Icons.checklist, size: 28.0)),
                        const SizedBox(width: 16.0),
                        Text(widget.task.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: const Color(0xff49454F),
                                )),
                      ],
                    ),
                  ),

                  // Second row
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(Icons.timer, size: 24.0),
                              const SizedBox(width: 6.0),
                              Text(
                                widget.task.completeBy,
                              ),
                            ]),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(Icons.do_disturb_on_outlined,
                                    size: 24.0),
                                const SizedBox(width: 6.0),
                                Text(widget.task.getCompletionStatusText()),
                              ]),
                        ),
                      ),
                    ],
                  ),

                  // Optional third row
                  if (widget.task.imageUrl != null) ...{
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 12.0, right: 12.0, top: 25.0, bottom: 5.0),
                      child: Image.network(widget.task.imageUrl.toString()),
                    )
                  } else ...{
                    const SizedBox.shrink(),
                  },

                  // Fourth row
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, bottom: 8.0, left: 16.0, right: 16.0),
                    child: Text(widget.task.description,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: const Color(0xff49454F),
                            )),
                  ),

                  //Fifth row
                  Row(children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Container(
                          width: 75.0,
                          height: 75.0,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://us.123rf.com/450wm/cunaplus/cunaplus1601/cunaplus160100017/50383487-portrait-of-a-saleswoman-with-crossed-arms-at-the-supermarket.jpg?ver=6'),
                                fit: BoxFit.cover,
                              ))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text('Assigned by ' + widget.task.creator),
                    )
                  ]),

                  // Sixth row
                  if (widget.task.status == CompletionStatus.notStarted ||
                      widget.task.status == CompletionStatus.inProgress) ...{
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0, bottom: 30.0),
                          child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      // Left button
                      SizedBox(
                        height: 40.0,
                        width: 179.0,
                        child: OutlinedButton(
                            onPressed: () {
                              cancelTask();
                            },
                            style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0))),
                                side: MaterialStateProperty.all(
                                    const BorderSide(
                                        color: Color(0xff6750A4),
                                        width: 1.0,
                                        style: BorderStyle.solid))),
                            child: const Row(children: [
                              Icon(Icons.close_rounded, size: 18.0),
                              SizedBox(width: 10.0),
                              Text('Cannot Complete', style: TextStyle(fontSize: 12.0)),
                            ])),
                      ),

                      // Right button
                      if (widget.task.status ==
                          CompletionStatus.notStarted) ...{
                        startButton(),
                      }
                      // Status is 'inProgress'
                      else ...{
                        completeButton()
                      }
                    ])
                        )
                    
                  } else ...{
                    const SizedBox.shrink(),
                  }
                ])),
          ),
        ));
  }
}
