import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'database-service.dart';
import 'models/task.dart';

class TasksScreen extends StatelessWidget {
  final db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<List<Task>>(context);
      return Scaffold(
        appBar: AppBar(title: Text("Hello Provider")),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return _item(tasks[index]);
          }
        )
      );
  }

  Widget _item(Task task) {
    return ListTile(
      title: Text(task.title)
    );
  }
}
