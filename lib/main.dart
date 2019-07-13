import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hello_provider/screens/tasks.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          StreamProvider<FirebaseUser>.value(value: FirebaseAuth.instance.onAuthStateChanged),
//          StreamProvider<List<Task>>.value(value: DatabaseService().streamTasks()),
        ],

        child: MaterialApp(
          title: 'Hello Provider',
          home: TasksScreen(),
        )
    );
  }
}