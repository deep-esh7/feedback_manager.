import 'package:feedback_manager/usersign.dart';
import 'package:flutter/material.dart';
import 'package:feedback_manager/feedbackmanager.dart';
import 'package:feedback_manager/register.dart';
import 'package:feedback_manager/uploadpic.dart';
import 'package:feedback_manager/thankyou.dart';
import 'package:feedback_manager/splash.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{

  String email = "h";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      title: "Feed Back Manager",
      debugShowCheckedModeBanner: false,
      home: splash(),
      theme: ThemeData(
primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,

      ),

    );
  }

}