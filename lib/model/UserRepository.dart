import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
void readData () async {
  var db = FirebaseFirestore.instance;
  await db.collection("users").get().then((event) {
    for (var doc in event.docs) {
      if (kDebugMode) {
        print("${doc.id} => ${doc.data()}");
      }
    }
  });
}

void writeData() {
  var db = FirebaseFirestore.instance;
  // Create a new user with a first and last name
  final user = <String, dynamic>{
    "first": "Ada",
    "last": "Lovelace",
    "born": 1815
  };

  final users = [
    {
      "first": "pete",
      "last": "lee",
      "born": 1815
    },
    {
      "first": "john",
      "last": "chen",
      "born": 2000
    },
    {
      "first": "Julia",
      "last": "chen",
      "born": 2000
    },
    {
      "first": "xiaowei",
      "last": "chen",
      "born": 2000
    },
  ];
  // db.collection("users").add(user).then((DocumentReference doc) =>
  //     print('DocumentSnapshot added with ID: ${doc.id}'));
  for (var user in users) {
    db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }
}
