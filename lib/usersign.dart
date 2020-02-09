import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback_manager/main.dart';
import 'package:feedback_manager/thankyou.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;
import 'package:feedback_manager/usersign.dart';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

class usersign extends StatefulWidget{

  final String email;
  usersign(this.email);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return usersignState(this.email);
  }

}

class _WatermarkPaint extends CustomPainter {
  final String price;
  final String watermark;


  _WatermarkPaint(this.price, this.watermark);

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    canvas.drawCircle(Offset(size.width / 2, size.height / 2), 2,
        Paint()..color = Colors.white);
  }

  @override
  bool shouldRepaint(_WatermarkPaint oldDelegate) {
    return oldDelegate != this;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is _WatermarkPaint &&
          runtimeType == other.runtimeType &&
          price == other.price &&
          watermark == other.watermark;

  @override
  int get hashCode => price.hashCode ^ watermark.hashCode;
}

class usersignState extends State<usersign> {
  final dataReference = Firestore.instance;
  ByteData _img = ByteData(0);
  var color = Colors.red;
  var strokeWidth = 5.0;
  String _uploadedFileURL;
  var image;
  Image imagee;
  bool flag1;
  bool flag2 = false;
  String email;
  usersignState(this.email);

  final _sign = GlobalKey<SignatureState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(  child: Column(

        children: <Widget>[
          Expanded(
            child: Container(

              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _uploadedFileURL == null
                    ? Signature(
                        color: color,
                        key: _sign,
                        onSign: () {
                          final sign = _sign.currentState;
                          debugPrint(
                              '${sign.points.length} points in the signature');
                        },
                        backgroundPainter: _WatermarkPaint("2.0", "2.0"),
                        strokeWidth: strokeWidth,
                      )
                    : Container(),
              ),
              color: Colors.white,
            ),
          ),
          _img.buffer.lengthInBytes == 0
              ? Container()
              : Container(child: Image.memory(_img.buffer.asUint8List())),
        Container( decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage('images/feed.jpg'), fit: BoxFit.cover
    )
    ), child:   Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  flag2 == false
                      ? Text(
                          'Please Sign To Continue',
                          textScaleFactor: 1.2,
                        )
                      : Container(),
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  flag2 == false
                      ? MaterialButton(
                          color: Colors.blue,
                          elevation: 5,
                          onPressed: () async {
                            final sign = _sign.currentState;
                            //retrieve image data, do whatever you want with it (send to server, save locally...)
                            image = await sign.getData();
                            var data = await image.toByteData(
                                format: ui.ImageByteFormat.png);
                            sign.clear();
                            final encoded =
                                base64.encode(data.buffer.asUint8List());
                            setState(() {
                              _img = data;
                              flag1 = true;
                              flag2 = true;

                              uploadFile();
                            });
                            debugPrint("onPressed " + encoded);
                          },
                          child: Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ))
                      : Container(),
                  flag2 == false
                      ? MaterialButton(
                          color: Colors.grey,
                          elevation: 5,
                          onPressed: () {
                            final sign = _sign.currentState;
                            sign.clear();
                            setState(() {
                              _img = ByteData(0);
                            });
                            debugPrint("cleared");
                          },
                          child: Text(
                            "Clear",
                            style: TextStyle(color: Colors.white),
                          ))
                      : Container(),
                ],
              ),
              flag1 == true
                  ? Column(
                      children: <Widget>[
                        CircularProgressIndicator(
                          strokeWidth: 5,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          'Saving Signature . . .',
                          textScaleFactor: 1.2,
                        ),
                      ],
                    )
                  : Container(),
              flag1 == false
                  ? Text(
                      'Signature Saved Successfully',
                      textScaleFactor: 1.2,
                    )
                  : Container(),
              SizedBox(
                height: 3,
              ),
              flag1 == false
                  ? MaterialButton(
                      color: Colors.blue,
                      elevation: 7,
                      onPressed: () {
                        setState(() {


                          Navigator.push(context, MaterialPageRoute(builder: (context)
                          {

                            return thankyou(email);
                          }));
                        });

                      },
                      child: Text(
                        "Sumbit Feedback :)",
                        style: TextStyle(color: Colors.white),
                      ))
                  : Container(),
              SizedBox(
                height: 10,
              ),
              flag2 == false
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        MaterialButton(
                            onPressed: () {
                              setState(() {
                                color = color == Colors.green
                                    ? Colors.red
                                    : Colors.green;
                              });
                              debugPrint("change color");
                            },
                            child: Text("Change color")),
                        MaterialButton(
                            onPressed: () {
                              setState(() {
                                int min = 1;
                                int max = 10;
                                int selection =
                                    min + (Random().nextInt(max - min));
                                strokeWidth = selection.roundToDouble();
                                debugPrint("change stroke width to $selection");
                              });
                            },
                            child: Text("Change stroke width")),
                      ],
                    )
                  : Container(),
            ],
          )
        )],
      ),
    ));
  }

  Future uploadFile() async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child('userpic/${Path.basename(email+' Signature')}}');
    StorageUploadTask uploadTask =
        storageReference.putData(_img.buffer.asUint8List());
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
        flag1 = false;
        updateData();
      });
    });
  }

  void updateData() {
    try {
      dataReference
          .collection('Register')
          .document(email)
          .updateData({'sign': _uploadedFileURL});
    } catch (e) {
      print(e.toString());
    }
  }
}
