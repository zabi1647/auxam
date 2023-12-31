import 'package:auxam/utils/utlities.dart';
import 'package:auxam/view/home_page.dart';
import 'package:auxam/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailcontroller = TextEditingController();
  final passowordcontroller = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool loading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passowordcontroller.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text.toString(),
            password: passowordcontroller.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });
      Utils().Toastmessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          title: const Text(
            "Login page",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.2,
                ),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Email",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Form(
                  key: _form,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.email_outlined),
                          hintText: "Email",
                          helperText: "email@gmail.com",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter email";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextFormField(
                        controller: passowordcontroller,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.password_outlined),
                          hintText: "password",
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Password";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                RoundedButton(
                  title: "Login",
                  loading: loading,
                  ontab: () {
                    if (_form.currentState!.validate()) {
                      login();
                    } else {}
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
