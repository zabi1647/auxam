import 'package:auxam/teacher/teacher_homepage.dart';
import 'package:auxam/utils/utlities.dart';
import 'package:auxam/student/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserCredentials {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveInformation(
      String name, String phone, String userType, BuildContext context) async {
    try {
      // Get the current user
      User? user = _auth.currentUser;

      // Check if the user is signed in
      if (user != null) {
        // Get the user's UID
        String uid = user.uid;

        Map<String, dynamic> userData = {
          'name': name,
          'phone': phone,
          'userType': userType,
        };

        CollectionReference collection = _firestore.collection('users');

        // Add the user information to the collection with the UID as the document ID
        await collection.doc(uid).set(userData);
        if (userType == 'teacher') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => TeacherHomePage()),
              (route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => StudentHomePage()),
              (route) => false);
        }
      }
    } catch (e) {
      Utils().Toastmessage(e.toString());
    }
  }
}
