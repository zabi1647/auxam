import 'package:auxam/utils/container_button.dart';
import 'package:auxam/utils/utlities.dart';
import 'package:auxam/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TeacherHomePage extends StatelessWidget {
  const TeacherHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      drawer: const Icon(Icons.more),
      backgroundColor: const Color(0xffF6F6F6),
      appBar: AppBar(
        backgroundColor: const Color(0xffF6F6F6),
        centerTitle: true,
        title: const Text(
          "Teacher Home page",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut().then((value) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                    (route) => false);
              }).onError((error, stackTrace) {
                Utils().Toastmessage(error.toString());
              });
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "WELCOME TO \nAUXAM APP",
                  style: TextStyle(
                      color: Color(0xff212121),
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.05,
                ),
                containerButton(
                    width: width,
                    height: height,
                    color: const Color(0xff3C38E2),
                    text: "Make \nClass",
                    onpress: () {}),
                SizedBox(
                  width: width * 0.05,
                ),
                containerButton(
                    width: width,
                    height: height,
                    color: const Color(0xff22AFDC),
                    text: "Mark \nQuizzes",
                    onpress: () {}),
                SizedBox(
                  width: width * 0.05,
                ),
                containerButton(
                  width: width,
                  height: height,
                  color: const Color(0xffEEBF18),
                  text: "View \nStudents",
                  onpress: () {},
                ),
              ],
            ),
            SizedBox(
              height: height * 0.07,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.05,
                ),
                containerButton(
                    width: width,
                    height: height,
                    color: const Color(0xff157CC7),
                    text: "Delete \nClass",
                    onpress: () {}),
                SizedBox(
                  width: width * 0.05,
                ),
                containerButton(
                    width: width,
                    height: height,
                    color: const Color(0xff9D23E9),
                    text: "Schedule \nQuizzes",
                    onpress: () {}),
                SizedBox(
                  width: width * 0.05,
                ),
                containerButton(
                  width: width,
                  height: height,
                  color: const Color(0xff2AE2EE),
                  text: "View \nClasses",
                  onpress: () {},
                ),
              ],
            ),
            SizedBox(
              height: height * 0.05,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Topper Students ",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width * 0.9,
              child: const Card(
                color: Color(0xffFFFFFF),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image(
                        image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2016/06/15/16/16/man-1459246_1280.png')),
                  ),
                  title: Text(
                    "Zohaib",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "1st Position",
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Text(
                    "Grade A+",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width * 0.9,
              child: const Card(
                color: Color(0xffFFFFFF),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Image(
                        image: NetworkImage(
                            'https://cdn.pixabay.com/photo/2016/04/25/07/15/man-1351317_1280.png')),
                  ),
                  title: Text(
                    "Musa",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "2st Position",
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: Text(
                    "Grade A+",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
