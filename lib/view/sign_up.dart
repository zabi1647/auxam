import 'package:auxam/utils/utlities.dart';
import 'package:auxam/widgets/round_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailcontroller = TextEditingController();
  final passowordcontroller = TextEditingController();
  final _form = GlobalKey<FormState>();
  final _store = FirebaseFirestore.instance.collection('Vendors');

  bool loading = false;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailcontroller.dispose();
    passowordcontroller.dispose();
  }

  void signUp() {
    setState(() {
      loading = true;
    });
    _store.doc(emailcontroller.text).set({
      'Email': emailcontroller.text,
      'Password': passowordcontroller.text
    }).then((value) {
      setState(() {
        loading = false;
      });
      Utils().Toastmessage("Vendor data Stored");
      emailcontroller.text = "";
      passowordcontroller.text = "";
    }).onError((error, stackTrace) {
      Utils().Toastmessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: Text(
          "Sign up",
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
                title: "Sign Up",
                loading: loading,
                ontab: () {
                  if (_form.currentState!.validate()) {
                    signUp();
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
    );
  }
}
