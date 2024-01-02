import 'package:auxam/utils/utlities.dart';
import 'package:auxam/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class StudentHomePage extends StatelessWidget {
  const StudentHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
        backgroundColor: Color(0xffF6F6F6),
        drawer: Icon(Icons.more),
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                _auth.signOut().then((value) {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
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
                height: height * 0.03,
              ),
              SizedBox(
                width: width * 0.8,
                child: Material(
                  elevation: 0.2,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      hintText: "search classes",
                      fillColor: Color(0xffFFFFFF),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: Color(0xffFFFFFF))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 50.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("joined classes"),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    width: width * 0.5,
                    height: height * 0.25,
                    decoration: const BoxDecoration(
                      color: Color(0xff212121),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.003,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "last updated",
                              style: TextStyle(color: Color(0xff8B8B8B)),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              "5 days ago",
                              style: TextStyle(color: Color(0xffE7E7E7)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        const Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Auxam",
                              style: TextStyle(color: Color(0xffFFFFFF)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                                width: width * 0.25,
                                height: height * 0.03,
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xffF55B6A),
                                      onPrimary: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          12.0,
                                        ),
                                      ),
                                    ),
                                    onPressed: () {},
                                    child: const Text(
                                      "GRADE",
                                    ))),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              width: width * 0.4,
                              height: height * 0.03,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff424141),
                                  onPrimary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      12.0,
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  "assignments",
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Recently Attempted quizes",
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
                    leading: Icon(Icons.my_library_books),
                    title: Text(
                      "SDA quiz",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "attempted 2 days ago",
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Text(
                      "Grade A",
                      style: TextStyle(
                        color: Colors.red,
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
                    leading: Icon(Icons.library_books_outlined),
                    title: Text(
                      "English quiz",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "attempted 4 days ago",
                      style: TextStyle(color: Colors.black),
                    ),
                    trailing: Text(
                      "Grade d",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
