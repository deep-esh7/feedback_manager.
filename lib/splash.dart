

import 'dart:async';


import 'package:flutter/material.dart';
import 'package:feedback_manager/register.dart';
import 'package:feedback_manager/BaseWidget.dart';



class splash extends StatefulWidget{


  @override


  State<StatefulWidget> createState() {
    // TODO: implement createState
    return splashstate();
  }}


class splashstate extends State<splash>{

  @override
  void initState()
  {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
  setState(() {

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)
    {

      return register();
    }));
  // Here you can write your code for open new view
  });
  });

  }

  @override
  Widget build(BuildContext context) {

    return BaseWidget(builder: (context, sizingInformation) {
    // TODO: implement build
    return Scaffold(


      body: Container(  decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/bg.jfif'), fit: BoxFit.cover)), child: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          Container(

          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2, child:
              Container(
                  child: Column
                    (
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                        child: Image.asset('images/blockchain.png',height: 80, width: 80,),
                      ),
                      Padding(padding: EdgeInsets.all(10),
                      child: Text(
                        'BRL',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),)
                    ],
                  )
              ),
              )
              ,
              Expanded(flex: 1,
                child: Column( mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(strokeWidth: 6,backgroundColor: Colors.white,),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text('Signature Of Excellence!',style: TextStyle(
                        fontWeight: FontWeight.bold,fontSize: 20.0, color: Colors.white
                      ),),
                    )
                  ],
                ),
              )
            ],
          )

        ],
      ),
      )
    );
    });}


}