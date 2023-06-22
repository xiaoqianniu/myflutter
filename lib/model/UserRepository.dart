import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'User.dart';

class UserRepository with ChangeNotifier{
  var db;

  UserRepository() {
    db = FirebaseFirestore.instance;
  }

  Future<List<User>> readData() async {
    var results = await db.collection("users").get();
    List<User> users = [];
    for (var doc in results.docs) {
      var user = User.fromJson(doc.data());
      users.add(user);
    }

    return users;
  }

  void writeData() {
    // Create a new user with a first and last name
    final user = User(id: "1",
        username: "alove",
        first: 'Ada',
        last: 'Lovelace',
        image: 'https://media.sciencephoto.com/image/h4120208/800wm/H4120208-Lady_Ada_Lovelace.jpg');

    // Add a new document with a generated ID
    db.collection("users").add(user.toJson());
    notifyListeners();
  }


  void deleteData() async {
    // Add a new document with a generated ID

    await db.collection("users")
        .doc("1")
        .delete();
    notifyListeners();
  }
  @override
  void notifyListeners() {}

}




// void writeData() {
//   var db = FirebaseFirestore.instance;
//   // Create a new user with a first and last name
//   final user = <String, dynamic>{
//     "first": "Ada",
//     "last": "Lovelace",
//     "born": 1815
//   };
//
//   final users = [
//     {
//       "first": "pete",
//       "last": "lee",
//       "born": 1815
//     },
//     {
//       "first": "john",
//       "last": "chen",
//       "born": 2000
//     },
//     {
//       "first": "Julia",
//       "last": "chen",
//       "born": 2000
//     },
//     {
//       "first": "xiaowei",
//       "last": "chen",
//       "born": 2000
//     },
//   ];
//   // db.collection("users").add(user).then((DocumentReference doc) =>
//   //     print('DocumentSnapshot added with ID: ${doc.id}'));
//   for (var user in users) {
//     db.collection("users").add(user).then((DocumentReference doc) =>
//         print('DocumentSnapshot added with ID: ${doc.id}'));
//   }
//
// }
//
// void deleteData() async {
//   // Add a new document with a generated ID
//
//   await db.collection("users")
//       .doc("1")
//       .delete();
// }
