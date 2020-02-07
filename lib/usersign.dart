import 'package:feedback_manager/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class usersign extends StatefulWidget{
  @override
  final String email;
  usersign(this.email);
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return usersignstate(this.email);
  }


}


class usersignstate extends State<usersign>{

  String email;
  usersignstate(this.email);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body: Text('sign'),
    );
  }



}