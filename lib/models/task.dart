import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  final String id;
  final String title;

  Task({ this.id, this.title });

//  factory Task.fromMap(Map data) {
//    data = data ?? { };
//    return Task(
//      title: data['title'] ?? ''
//    );
//  }

  factory Task.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Task(
        id: doc.documentID,
        title: data['title'] ?? ''
    );
  }
}