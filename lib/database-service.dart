import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';

import 'models/task.dart';
//import 'models.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;

//  /// Get a stream of a single document
//  Stream<Task> streamTask(String id) {
//    return _db
//        .collection('tasks')
//        .document(id)
//        .snapshots()
//        .map((snap) => Task.fromMap(snap.data));
//  }

  Stream<List<Task>> streamTasks() {
    var ref = _db.collection('tasks');

    return ref.snapshots().map((list) =>
        list.documents.map((doc) => Task.fromFirestore(doc)).toList());

  }

  Future<void> createTask(Task task) {
    return _db.collection('tasks').add(task.toJson());
  }

  Future<void> deleteTask(Task task) {
    return _db.collection('tasks').document(task.id).delete();
  }

}