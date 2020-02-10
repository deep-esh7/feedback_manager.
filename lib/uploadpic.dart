import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:feedback_manager/main.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart'; // For File Upload To Firestore
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // For Image Picker
import 'package:path/path.dart' as Path;
import 'package:feedback_manager/usersign.dart';
import 'package:feedback_manager/BaseWidget.dart';


class uploadpic extends StatefulWidget{


  final String email;
  uploadpic(this.email);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState


    return uploadpicstate(this.email);
  }

}

class uploadpicstate extends State<uploadpic>
{
  final databaseReference= Firestore.instance;
  bool flag;
  bool flag2;
  String email;
  uploadpicstate(this.email);
  File _image;
  String _uploadedFileURL;
  AssetImage _imageToShow;



  @override
  Widget build(BuildContext context) {

    return BaseWidget(builder: (context, sizingInformation)
    {
      // TODO: implement build
      return Scaffold(

        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/feed.jpg'), fit: BoxFit.cover
                )
            ),

            child: Container(

              margin: EdgeInsets.only(top: 0),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[




                  _image != null
                      ? Text('Selected Image', textScaleFactor: 1.2,)
                      : Text('Please Upload an Image to Verify Yourself!',
                    textScaleFactor: 1.2,),
                  SizedBox(
                    height: 5,
                  ),

                  _image != null
                      ? Image.file(_image, height: 150,)
                      : uploadimage(),
                  SizedBox(height: 5,),
                  _image == null
                      ? RaisedButton(
                    color: Colors.blue,
                    elevation: 5,
                    child: Text(
                      'Capture Photo', textScaleFactor: 1.2, style: TextStyle(
                      color: Colors.white,
                    ),),
                    onPressed: () {
                      setState(() {
                        chooseFile();
                        flag2 = true;
                      });
                    },

                  )
                      : Container(),
                  flag2 == true
                      ? RaisedButton(
                    color: Colors.blue,
                    elevation: 5,
                    child: Text(
                      'Upload File', textScaleFactor: 1.2, style: TextStyle(
                      color: Colors.white,
                    ),),
                    onPressed: () {
                      setState(() {
                        uploadFile();
                      });
                    },

                  )
                      : Container(),
                  SizedBox(height: 5,),
                  flag == true ? CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                    strokeWidth: 10,
                    semanticsLabel: 'Uploading Image',
                    semanticsValue: 'Uploading Image',) : Container(),
                  SizedBox(height: 7),
                  flag == true
                      ? Text('Uploading Please Wait..', textScaleFactor: 1.5,)
                      : Container(),


                  _uploadedFileURL != null ? Container(

                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 2,),

                        Text("Image Has Been Uploaded Successfully",
                          textScaleFactor: 1.5, textAlign: TextAlign.center,),
                        SizedBox(height: 5),
                        RaisedButton(
                          color: Colors.blue,
                          elevation: 5,
                          onPressed: () {
                            setState(() {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return usersign(email);
                                  }));
                            });
                          },
                          child: Text(
                            'Click Here To Continue', textScaleFactor: 1.2,
                            style: TextStyle(
                              color: Colors.white,
                            ),),
                        )


                      ],
                    ),
                  ) : Container(),


                ],
               ),
            )
        ),

      );
    });
  }
  Widget uploadimage() {
    AssetImage assetImage = AssetImage('images/propic.png');
    Image image = Image(image: assetImage, width: 180, height: 180);
    return Container(

      child: Column(
        children: <Widget>[
          image,



        ],
      )


    );
  }

  void loader()
  {

    CircularProgressIndicator();
    Text('Uploading Image . . .');
  }

  Future chooseFile() async {
    await ImagePicker.pickImage(source: ImageSource.camera).then((image) {
      setState(() {
        _image = image;
        debugPrint(_image.path);

      });
    });
  }
  Future uploadFile() async {
    flag=true;
    flag2=false;
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('userpic/${Path.basename(_image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(_image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        _uploadedFileURL = fileURL;
        updateData();
        flag=false;
      });
    });
  }


  void updateData() {
    try {
      databaseReference
          .collection('Register')
          .document(email)
          .updateData({'picimgurl': _uploadedFileURL});
    } catch (e) {
      print(e.toString());
    }
  }

  void printi()
  {
    debugPrint(_image.path);
  }


  Widget imagepic() {



      _imageToShow = AssetImage(_image.path);


    Image image = Image(image: _imageToShow, width: 150, height: 150);
    return Container(
      child: image,

    );
  }

}