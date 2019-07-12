import 'package:flutter/material.dart';
import 'package:flutter_hello_provider/tasks.dart';
import 'package:provider/provider.dart';

import 'database-service.dart';
import 'models/task.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
//          StreamProvider<FirebaseUser>.value(stream: FirebaseAuth.instance.onAuthStateChanged),

          StreamProvider<List<Task>>.value(value: DatabaseService().streamTasks()),
        ],

        child: MaterialApp(
          title: 'Hello Provider',
          home: TasksScreen(),
        )
    );
  }
}