import 'package:flutter/material.dart';
import 'package:mandala/app/sign_in/landing_page.dart';
import 'package:mandala/services/auth.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MANDALA: The Mind Circle',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LandingPage(
        auth:  Auth(),
      ),
    );
  }
}


