import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String id;
  final String title;

  Task({this.title });

//  factory Task.fromMap(Map data) {
//    data = data ?? { };
//    return Task(
//      title: data['title'] ?? ''
//    );
//  }

  factory Task.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return Task(
        title: data['title'] ?? '',
//        id: doc.documentID,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title
    };
  }
}