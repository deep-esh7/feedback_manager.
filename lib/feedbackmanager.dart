import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback_manager/uploadpic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class feedbackmanager extends StatefulWidget{

  final String email;


  feedbackmanager(this.email);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return feedbackmanagerstate(this.email);
  }

}


class feedbackmanagerstate extends State<feedbackmanager>{
  @override

  TextEditingController ans1 = TextEditingController();
  TextEditingController ans2 = TextEditingController();
  TextEditingController ans3 = TextEditingController();
  TextEditingController ans4 = TextEditingController();
  TextEditingController ans5 = TextEditingController();

  double ans1rating;
  double ans2rating;
  double ans3rating;
  double ans4rating;
  double ans5rating;

  final dataReference = Firestore.instance;


  String email;
  feedbackmanagerstate(this.email);
  List<String> list = ["Ques. 1: What is the fullform of BRL?","Ques. 2: What is the fullform of BRL?",
    "Ques. 3: What is the fullform of BRL?","Ques. 4: What is the fullform of BRL?"];


  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(


      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/feed.jpg'), fit: BoxFit.cover
          )
        ),

      child: ListView(
        children: <Widget>[

          SizedBox(
            height: 50,
          ),
          brlimage(),

          SizedBox(
            height: 20,
          ),



          Padding(
              padding: EdgeInsets.all(3),

              child:
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),

                elevation: 5,            margin: const EdgeInsets.only(top: 5),
                child: Column(
                  children: <Widget>[


                    Row(children: <Widget>[
                      Text("  Ques 1: How is BRL Team Work ?",style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 20.0
                      ),textAlign: TextAlign.left,)
                    ],),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 55),
                        ),
                        Text('  Ratings : ',textScaleFactor: 1.3,),
                        FlutterRatingBar(
                          initialRating: 0,
                          fillColor: Colors.amber,
                          borderColor: Colors.amber.withAlpha(50),
                          allowHalfRating: true,
                          onRatingUpdate: (ques1) {
                            ans1rating=ques1;
                          },
                        ),
                      ],
                    ),
                    TextField(
                      controller: ans1,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '  ',
                        labelText: '  Suggestions If Any',
                        labelStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black26,
                            fontSize: 18.0),
                      ),
                    ),

                  ],

                ),
              ))
          ,
         Padding(
           padding: EdgeInsets.all(3),

           child:
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)
            ),

elevation: 5,            margin: const EdgeInsets.only(top: 5),
            child: Column(
              children: <Widget>[


                Row(children: <Widget>[
                  Text("  Ques 2: Does seniors are supportive?",style: TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 20.0
                  ),textAlign: TextAlign.left,)
                ],),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 55),
                    ),
                    Text('  Ratings : ',textScaleFactor: 1.3,),
                    FlutterRatingBar(
                      initialRating: 0,
                      fillColor: Colors.amber,
                      borderColor: Colors.amber.withAlpha(50),
                      allowHalfRating: true,
                      onRatingUpdate: (ques2) {
                        ans2rating=ques2;
                        print(ques2);
                      },
                    ),
                  ],
                ),

                TextField(
                  controller: ans2,
                  decoration: InputDecoration(
                    hintText: '  ',
                    labelText: '  Suggestions If Any',
                    border: InputBorder.none,
                    labelStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.black26,
                        fontSize: 18.0),
                  ),
                ),

              ],

            ),
          ))
          ,
          Padding(
              padding: EdgeInsets.all(3),

              child:
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),

                elevation: 5,            margin: const EdgeInsets.only(top: 5),
                child: Column(
                  children: <Widget>[


                    Row(children: <Widget>[
                      Text("  Ques 3: How BRL can be improvised ?",style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 20.0
                      ),textAlign: TextAlign.left,)
                    ],),

                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 55),
                        ),
                        Text('  Ratings : ',textScaleFactor: 1.3,),
                        FlutterRatingBar(
                          initialRating: 0,
                          fillColor: Colors.amber,
                          borderColor: Colors.amber.withAlpha(50),
                          allowHalfRating: true,
                          onRatingUpdate: (ques3) {
                            ans3rating=ques3;
                            print(ques3);
                          },
                        ),
                      ],
                    ),
                    TextField(
                      controller: ans3,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '  ',
                        labelText: '  Suggestions If Any',
                        labelStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black26,
                            fontSize: 18.0),
                      ),
                    ),

                  ],

                ),
              )),
          Padding(
              padding: EdgeInsets.all(3),

              child:
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0)
                ),

                elevation: 5,            margin: const EdgeInsets.only(top: 5),
                child: Column(
                  children: <Widget>[


                    Row(children: <Widget>[
                      Expanded(

                      child:Text("  Ques 4: Explain BRL working skills ?",style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 20.0
                      ),textAlign: TextAlign.left,))
                    ],),
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 55),
                        ),
                        Text('  Ratings : ',textScaleFactor: 1.3,),
                        FlutterRatingBar(
                          initialRating: 0,
                          fillColor: Colors.amber,
                          borderColor: Colors.amber.withAlpha(50),
                          allowHalfRating: true,
                          onRatingUpdate: (ques4) {
                            ans4rating=ques4;
                            print(ques4);
                          },
                        ),
                      ],
                    ),
                    TextField(
                      controller: ans4,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '  ',
                        labelText: '  Suggestions If Any',
                        labelStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black26,
                            fontSize: 18.0),
                      ),
                    ),

                  ],

                ),
              ))
          ,
          Padding(
              padding: EdgeInsets.all(3),

              child:
              Card(
shape: RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(10.0)
),
                elevation: 5,            margin: const EdgeInsets.only(top: 5),
                child: Column(
                  children: <Widget>[


                    Row(children: <Widget>[
                     Expanded(
                       child:
                      Text("  Ques 5: Explain scope of BRL ?",style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 20.0
                      ),textAlign: TextAlign.left,))
                    ],),
Row(
  children: <Widget>[
   Container(
     margin: EdgeInsets.only(top: 55),
   ),
    Text('  Ratings : ',textScaleFactor: 1.3,),
    FlutterRatingBar(
      initialRating: 0,
      fillColor: Colors.amber,
      borderColor: Colors.amber.withAlpha(50),
      allowHalfRating: true,
      onRatingUpdate: (ques5) {
        ans5rating=ques5;
        print(ques5);
      },
    ),
  ],
),
                  

                    TextField(
                      controller: ans5,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: '  ',
                        labelText: '  Suggestions If Any',
                        labelStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black26,
                            fontSize: 18.0),
                      ),
                    ),



                  ],

                ),
              ))
, Container( padding: EdgeInsets.only(left: 100,right: 100),
            margin: EdgeInsets.all(17),
            child: ButtonTheme(
                height: 45.0,
                minWidth: 5.0,
                child: RaisedButton(

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),


                  ),
                  child: Text('CONTINUE ->'),
                  color: Colors.blueAccent,
                  textColor: Colors.white,

                  elevation: 7.0,
                  onPressed: () {
                    setState(() {
                      updateData();

                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      {
                        return uploadpic(email);
                      }));

                    });
                  },
                )),
          )

        ],
      ))
    );
  }

  Widget brlimage() {
    AssetImage assetImage = AssetImage('images/brl.png');
    Image image = Image(image: assetImage, width: 90, height: 90);
    return Container(

      child: image,

    );
  }


  void updateData() {
    try {
      dataReference
          .collection('Register')
          .document(email)
          .updateData({'ans1': ans1.text,'ans2': ans2.text,'ans3': ans3.text,'ans4': ans4.text,'ans5': ans5.text,
      'ans1rating': ans1rating, 'ans2rating': ans2rating, 'ans3rating': ans3rating,
        'ans4rating': ans4rating,'ans5rating': ans5rating,});
    } catch (e) {
      print(e.toString());
    }
  }
//
//  'name': name, 'age': agecont.text , 'emailid': emailcont.text, 'mobileno': mobilecont.text, 'picimgurl': 'blank',
//
//  'ans1': 'blank' , 'ans1rating': 'blank', 'ans2': 'blank','ans2rating': 'blank', 'ans3': 'blank','ans3rating': 'blank',
//
//
//  'ans4': 'blank','ans4rating': 'blank', 'ans5': 'blank', 'ans5rating': 'blank',

}


