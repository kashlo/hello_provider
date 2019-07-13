import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hello_provider/widgets/drawer.dart';
import 'package:flutter_hello_provider/widgets/task-list.dart';
import 'package:provider/provider.dart';

import '../database-service.dart';
import '../models/task.dart';

class TasksScreen extends StatelessWidget {
  final db = DatabaseService();
  FirebaseUser user;
  bool loggedIn;

  @override
  Widget build(BuildContext context) {
    user = Provider.of<FirebaseUser>(context);
    loggedIn = user != null;

    return Scaffold(
      appBar: AppBar(
          title: Text("Hello Provider")),
        drawer: Drawer(
          child: DrawerContent(),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _addTask
      ),
      body: _buildBody()
    );
  }

  _addTask() {
    Task task = Task(title: Random.secure().nextInt(100000).toString());
    db.createTask(task);
  }

  _buildBody() {
    if (!loggedIn) {
      return Center(
        child: RaisedButton(
          child: Text('Login'),
          onPressed: FirebaseAuth.instance.signInAnonymously,
        ),
      );
    } else {
      return StreamProvider<List<Task>>.value(
        value: db.streamTasks(),
        child: TaskList(),
      );
    }

  }
}
