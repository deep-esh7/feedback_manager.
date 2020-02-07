import 'package:feedback_manager/feedbackmanager.dart';
import 'package:flutter/material.dart';
import 'package:feedback_manager/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class register extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return registerstate();
  }
}

class registerstate extends State<register> {



  final key = GlobalKey<FormState>();
  final dataRefrence = Firestore.instance;
  TextEditingController fnamecont = TextEditingController();
  TextEditingController lnamecont = TextEditingController();
  TextEditingController agecont = TextEditingController();
  TextEditingController emailcont = TextEditingController();
  TextEditingController mobilecont = TextEditingController();

  @override
  Widget build(BuildContext context) {




    TextStyle textStyle = Theme
        .of(context)
        .textTheme
        .subhead;
    // TODO: implement build
    return Scaffold(



      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bg.jfif'), fit: BoxFit.cover)),
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(45.0),

            ),

            brlimage(),
            Container(
              margin: EdgeInsets.all(10.0),

            ),

            Form(
                key: key,
                child: Padding(
                  padding: EdgeInsets.only(left: 40.0, right: 40.0),
                  child: Column(
                    children: <Widget>[
                  Theme(
                  data: Theme.of(context).copyWith(splashColor: Colors.transparent),
                  child:
                  TextFormField(
                        controller: fnamecont,

                        decoration: InputDecoration(

                          fillColor: Colors.white,
                          filled: true,
                          errorStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                          labelText: 'First Name',

                          hintText: '',
                          labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black26,
                              fontSize: 18.0),

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please Enter First Name';
                          }
                        },
                      )),
                      SizedBox(
                        height: 2,
                      ),
                      TextFormField(
                        controller: lnamecont,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          errorStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                          labelText: 'Last Name',
                          hintText: '',
                          labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black26,
                              fontSize: 18.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please Enter Last Name';
                          }
                        },
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      TextFormField(
                        controller: agecont,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          errorStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                          labelText: 'Age',
                          hintText: '',
                          labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black26,
                              fontSize: 18.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Age';
                          }
                        },
                      ),
                      SizedBox(
                        height: 2,
                      ),

                      TextFormField(
                        controller: emailcont,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          errorStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                          labelText: 'Email Id',
                          hintText: '',
                          labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black26,
                              fontSize: 18.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please Enter Email ID';
                          }
                        },
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      TextFormField(
                        controller: mobilecont,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          errorStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                          ),
                          labelText: 'Mobile No.',
                          hintText: '',
                          labelStyle: TextStyle(
                              fontStyle: FontStyle.italic,
                              color: Colors.black26,
                              fontSize: 18.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Please Enter Mobile No.';
                          }
                        },
                      ),
                      SizedBox(
                        height: 5,
                      ),

                      ButtonTheme(
                          height: 45.0,
                          minWidth: 10.0,
                          child: RaisedButton(

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),


                            ),
                            child: Text('Give Feedback ->'),
                            color: Colors.blueAccent,
                            textColor: Colors.white,

                            elevation: 7.0,
                            onPressed: () {
                              setState(() {
                                if (key.currentState.validate()) {

                                  createdata();

                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                                    return feedbackmanager(emailcont.text);
                                  }));

                                }
                              });
                            },
                          )),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget brlimage() {
    AssetImage assetImage = AssetImage('images/brl.png');
    Image image = Image(image: assetImage, width: 90, height: 80);
    return Container(
      child: image,

    );
  }

  void createdata() async
  {
    String name = fnamecont.text+" "+lnamecont.text;

await dataRefrence.collection('Register').document(emailcont.text).setData({
  'name': name, 'age': agecont.text , 'emailid': emailcont.text, 'mobileno': mobilecont.text, 'picimgurl': 'blank',

  'ans1': 'blank' , 'ans1rating': 'blank', 'ans2': 'blank','ans2rating': 'blank', 'ans3': 'blank','ans3rating': 'blank',


  'ans4': 'blank','ans4rating': 'blank', 'ans5': 'blank', 'ans5rating': 'blank',

});
  }





}


