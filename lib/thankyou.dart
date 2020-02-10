import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:feedback_manager/BaseWidget.dart';


class thankyou extends StatefulWidget {

  final String email;

  thankyou(this.email);



  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return thankyoustate(this.email);
  }


}


class thankyoustate extends State<thankyou>{


  final dataReference = Firestore.instance;
  String email;
  thankyoustate(this.email);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return BaseWidget(builder: (context, sizingInformation) {
    return Scaffold(

      body: Container(decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/feed.jpg'), fit: BoxFit.cover
          )
      ),
        child: Column(


          children: <Widget>[

            SizedBox(height: 50,),
           Padding(padding: EdgeInsets.all(48), child:Row(
              children: <Widget>[

                Text(
                  'Thank', style: TextStyle(
                    fontSize: 50
                        , color: Colors.green
                ), textAlign: TextAlign.center,
                ),
               Expanded(
                 child:
                Text(
                  ' You!', style: TextStyle(
                    fontSize: 50
                    , color: Colors.red
                ), textAlign: TextAlign.center,
                ))
              ],
            )),


            smiley(),
            SizedBox(height: 40,),

            Text(
              'For Your Feedback', style: TextStyle(
                fontSize: 30
                , color: Colors.blue
            ), textAlign: TextAlign.center,
            ),

            SizedBox(height: 10,),

            RaisedButton(
              color: Colors.blue,
              elevation: 7,
              onPressed: (){
                updateData();
                exit(0);
              },
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              child: Text(
                'Click Here To Close The App',style: TextStyle(
                color: Colors.white
              ),
              ),
            ),
SizedBox(height: 5,),
            Container(

                child: Row
                  (
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    GestureDetector(onTap: () async {
                      if (await canLaunch("https://instagram.com/brl_akgec")) {
                        await launch("https://instagram.com/brl_akgec");
                      }
                      else {
                        throw 'Could not launch';
                      }
                    },
              child:
 CircleAvatar(

                      backgroundColor: Colors.white,
                      radius: 25,
                      child: Image.asset('images/instagram.png',height: 40, width: 40,),
                    )),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 25,
                      child: Image.asset('images/facebook.png',height: 40, width: 40,),
                    ),
                    ],
                )
            ),


          ],
        ),),


    );});
  }
    void updateData() {
      try {
        dataReference
            .collection('Register')
            .document(email)
            .updateData({'status': 'Completed'});
      } catch (e) {
        print(e.toString());
      }
    }

    Widget smiley() {
      AssetImage assetImage = AssetImage('images/smile1.png');
      Image image = Image(image: assetImage, width: 200, height: 200);
      return Container(
        child: image,

      );
    }


}