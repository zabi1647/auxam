import 'package:auxam/firebase_services/splash_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServies service = SplashServies();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    service.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Text(
        "Admin App",
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
