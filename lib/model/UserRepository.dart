import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'User.dart';

class UserRepository extends ChangeNotifier{
  var db;

  UserRepository() {
    db = FirebaseFirestore.instance;
  }

  Future<List<User>> getAllUsers() async {
    var results = await db.collection("users").get();
    List<User> users = [];
    for (var doc in results.docs) {
      print(doc.data());
      var user = User.fromJson(doc.data());
      users.add(user);
    }
    notifyListeners();
    return users;
  }
  Future<User> getFixedUser() {
    return getUser(username:"girl");
  }
  /// Get the user with the given username (which will be unique)
  Future<User> getUser({required String username}) async {
    var existing = await db.collection("users").doc(username).get();
    var data = await existing.data();
    if (data == null) {
      print("User $username not found");
      return User.noUser();
    } else {
      var user = User.fromJson(data);
      return user;
    }
  }

  /// Create a new user with the given username (which will be unique)
  ///    and the email,password (required),and image url.

  void addUser({required String username, required String email,
    required String password, required String confirmPassword, String? image}) async {
    // First check to see if the username already exists
    var existing = await db.collection("users").doc(username).get();
    if (existing.data() == null) {
      final user = User(username: username,
          email: email,
          password: password,
          confirmPassword: confirmPassword,
          image: image);

      // Add a new document with the given username
      db.collection("users").doc(username).set(user.toJson());
      notifyListeners();
      print("New user $username added");
    } else {
      print("Duplicate user $username - not added");
    }
  }


  void writeData() {
    // Create a new user with a first and last name
    final user = User(
        username: "alove",
        email: 'Ada',
        password: 'Lovelace',
        confirmPassword:'Lovelace' ,
        image: 'https://media.sciencephoto.com/image/h4120208/800wm/H4120208-Lady_Ada_Lovelace.jpg');

    // Add a new document with a generated ID
    db.collection("users").add(user.toJson());
    notifyListeners();
  }


  void deleteData() async {

    await db.collection("users")
        .doc("1")
        .delete();
    notifyListeners();

  }
  void deleteFixedUser() {
    deleteUser(username: "alove");
  }

  /// Delete the user that matches the given username
  void deleteUser({required String username}) async {
    var user = await db.collection("users").doc(username);
    var doc = await user.get();
    if (doc.data() == null) {
      print("Unable to delete user $username - not found");
    } else {
      try {
        await user.delete();
        print("user $username successfully deleted");
        notifyListeners();
      } catch (e) {
        print("Error deleting user $username: $e");
      }
    }
  }

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
