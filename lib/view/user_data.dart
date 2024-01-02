import 'package:auxam/firebase_services/user_credentials.dart';
import 'package:auxam/widgets/round_button.dart';
import 'package:flutter/material.dart';

class UserData extends StatefulWidget {
  const UserData({super.key});

  @override
  State<UserData> createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  final _form = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  String selectedrole = "student";
  bool loading = false;

  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: const Color(0xffF6F6F6),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.15,
                child: Image.asset('assets/images/logo_png.png'),
              ),
              const Text(
                "Enter your details",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: height * 0.08,
              ),
              Form(
                key: _form,
                child: Column(
                  children: [
                    TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.pending),
                        hintText: "Name",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter name";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          icon: Icon(Icons.phone_android_outlined),
                          hintText: "phone no",
                          helperText: "03*********"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter phone no";
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
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Select your role",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              RadioListTile(
                  value: "student",
                  title: const Text('Student'),
                  groupValue: selectedrole,
                  onChanged: (value) {
                    setState(() {
                      selectedrole = value!;
                    });
                  }),
              RadioListTile(
                value: "teacher",
                title: const Text('Teacher'),
                groupValue: selectedrole,
                onChanged: (value) {
                  setState(() {
                    selectedrole = value!;
                  });
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              SizedBox(
                width: width * 0.95,
                child: RoundedButton(
                  title: "save",
                  loading: loading,
                  ontab: () {
                    if (_form.currentState!.validate()) {
                      UserCredentials().saveInformation(nameController.text,
                          phoneController.text, selectedrole, context);
                    } else {}
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
