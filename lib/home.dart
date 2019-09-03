import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }

}

class HomeState extends State<Home>{
 
  File imageFile;

  //selecting an image from gallery is a async task as user can take as much time as they want
  _OpenGallery(BuildContext context) async{
    var picture= await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
     imageFile = picture; 
    });
    Navigator.of(context).pop();      // To close the dialog
  }

  _OpenCamera(BuildContext context) async{
    var picture= await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
     imageFile = picture; 
    });
    Navigator.of(context).pop();    //to close the dialog

  }

   //For a dialogbox which appears when camera botton is clicked
  Future<void> _ShowChoiceDialog(BuildContext context){
    return showDialog(context: context,builder: (BuildContext context)
    {
      return AlertDialog(
        title: Text("Make a choice"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Gallery"),
                onTap:(){_OpenGallery(context);
                }
              ),
              Padding(padding: EdgeInsets.all(8.0),
              ),
                GestureDetector(
                child: Text("Camera"),
                onTap:(){_OpenCamera(context);
                }
              ),
            ],
          ),
        ),
      );
    }
    );
  }
  // _decideImageView(){
    //if (imageFile==null){
      //return Text("No Image selected");
      //}else{
      //Image.file(imageFile,width:10.0, height:40.0);
      //} 
    //}
    
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar( 
        title: Text ('Home'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[       
            FloatingActionButton(
              onPressed: (){
                _ShowChoiceDialog(context);
                },
              child: Icon(Icons.camera_alt),
              tooltip: "Click image",
            ),
            imageFile==null? Container(): Image.file(imageFile, width:300.0, height:200), 
            imageFile == null? Container():
            
            
             RaisedButton(
              child: Text("Upload image"),
              onPressed: (){
                
              },
            )
            
          ],
        ),
      ),
    );
  }

}