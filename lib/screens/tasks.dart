import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../widgets/task-list.dart';
import '../database-service.dart';
import '../models/task.dart';

class TasksScreen extends StatelessWidget {
  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Hello Provider")),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTask
      ),
      body: StreamProvider<List<Task>>.value(
        value: db.streamTasks(),
        child: TaskList(),
      ),
    );
  }

  _addTask() {
    Task task = Task(title: Random.secure().nextInt(100000).toString());
    db.createTask(task);
  }
}
