import 'package:task_management/data/task_model.dart';

// Defines variable taskList, which is a list of Task objects
final List<Task> taskList = [
  Task(
    title: 'Clean Spillage On Aisle 4',
    description: 'Clear up using mop & cleaning solution found in store cupboard B',
    imageUrl: 'https://iili.io/JMvOQku.png',
    creator: 'John Smith',
    status: CompletionStatus.notStarted,
    completeBy: "08:30 am",
  ),
  Task(
    title: 'Unpack Deliveries',
    description: 'Delivieries in Bay 6 need to be unpacked before the store opens',
    creator: 'John Smith',
    status: CompletionStatus.inProgress,
    completeBy: "09:00 am",
  ),
  Task(
    title: 'Re-merchandise Aisle 6',
    description:
        'Use the updated planagram to merchandise aisle 6 (drinks). Check in with Stefan to make sure he’s fully unpacked Bay 5’s deliveries before you start. If you need help, Alex will be working on aisle 4 so will be on hand to support.',
    imageUrl: 'https://iili.io/JMvOmLQ.png',
    creator: 'John Smith',
    status: CompletionStatus.notStarted,
    completeBy: "11:00 am",
  ),
  Task(
    title: 'Restock Aisles 2-4',
    description:
        'Audit and restock canned foods to sauces. If you need any help Alex will be on hand to givea assitance. Make sure to properly cycle any stock in the backroom.',
    creator: 'John Smith',
    status: CompletionStatus.notStarted,
    completeBy: "12:00 pm",
  ),
  Task(
    title: 'Restock Aisle 1',
    description: 'Audit and restock fruit and vegetables',
    creator: 'John Smith',
    status: CompletionStatus.completed,
    completeBy: "10:00 am"
  ),
  Task(
    title: 'Re-merchandise Aisle 12',
    description: 'Use the updated planagram to merchandise aisle 12 (Dairy). Check in with Angela to make sure she has unpacked all deliveries',
    imageUrl: 'https://iili.io/JMvOmLQ.png',
    creator: 'John Smith',
    status: CompletionStatus.cancelled,
    completeBy: "9:30 am"
  )
];
