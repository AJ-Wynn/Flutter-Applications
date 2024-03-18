import 'package:flutter/material.dart';
import 'package:task_management/data/task_model.dart';
import 'package:task_management/pages/task_detail_page.dart';

class TaskCard extends StatefulWidget {
  final Task task;

  const TaskCard(this.task, {Key? key}) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

// Converted TaskCard to a stateful widget so that it can manage it's own data --> enables task.status to be changed when button is pressed
class _TaskCardState extends State<TaskCard> {

  
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
            Text('Start'),
          ])),
    );
  }

  Widget completeButton() {
    return SizedBox(
      height: 40.0,
      width: 174.0,
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
                  fontWeight: FontWeight.normal),
            ),
          ])),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 4.0, bottom: 4.0, left: 12.0, right: 12.0),
      // InkWell widget allows you to detect when user clicks on Card widget using onTap function
      child: InkWell(
        onTap: () {
          // When user clicks on Card, push TaskDetailPage widget to top of navigation stack
          Navigator.push(
            context,
            // When creating the TaskDetailPage widget, we pass the Task object of the card that was clicked on
            MaterialPageRoute(builder: (context) => TaskDetailPage(widget.task)),
          );
        },
        child: Card(
            elevation: 3.0,
            child: Column(children: [
              // First row
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // ignore: prefer_const_constructors
                    SizedBox(
                        height: 28.0,
                        width: 28.0,
                        child: const Icon(Icons.checklist, size: 28.0)),
                    const SizedBox(width: 16.0),
                    Text(widget.task.title,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: const Color(0xff49454F),
                                )),
                  ],
                ),
              ),

              // Optional second row if Task contains imageUrl
              if (widget.task.imageUrl != null) ...{
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Image.network(widget.task.imageUrl.toString()),
                )
              } else ...{
                const SizedBox.shrink(),
              },

              // Second row
              // ignore: prefer_const_constructors
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, left: 16.0, right: 16.0),
                child: Text(widget.task.description,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color(0xff49454F),
                        )),
              ),
              // Third row
              // ignore: prefer_const_constructors
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        // Align the two rows with the left side of the card
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                                // ensure Row takes up only the horizontal space that it needs
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.timer, size: 24.0),
                                  const SizedBox(width: 16.0),
                                  Text(
                                    widget.task.completeBy,
                                  ),
                                ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child:
                                Row(mainAxisSize: MainAxisSize.min, children: [
                              const Icon(Icons.do_disturb_on_outlined,
                                  size: 24.0),
                              const SizedBox(width: 16.0),
                              Text(widget.task.getCompletionStatusText()),
                            ]),
                          ),
                        ]),
                  ),

                  // '...' is a spread operator, which allows you to split a list/set into its items
                  // splits set<Widget> into an individual Widget which can be added to children[] list
                  if (widget.task.status == CompletionStatus.notStarted) ...{
                    // Make this row take up all the remaining horizontal space
                    Expanded(
                        child: Row(
                            // align the OutlinedButton with the right side of the card
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: startButton(),
                          ),
                        ]))
                  } else if (widget.task.status ==
                      CompletionStatus.inProgress) ...{
                    Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: completeButton(),
                          )
                        ]))

                    // if task is cancelled or already completed, show no button
                  } else ...{
                    // Empty Widget
                    const SizedBox.shrink(),
                  }
                ],
              ),
            ])),
      ),
    );
  }
}
