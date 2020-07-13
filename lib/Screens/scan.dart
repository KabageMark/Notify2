import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:notify/Screens/notes.dart';


class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  File _image;
  var _text = ''; 
  bool scan = true;
  final notesController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    //this is a function for selecting an image
     Future getImage() async {
        var image = await ImagePicker.pickImage(source: ImageSource.gallery);

        setState(() {
          _image = image;
        });
        
     }


  Future _readText() async{

    //this is the image to be read
    FirebaseVisionImage ourImage = FirebaseVisionImage.fromFile(_image);
    //this is the text recognizer
    TextRecognizer recognizedText = FirebaseVision.instance.textRecognizer();
    //this is the actual processing of the image
    VisionText readText  =  await recognizedText.processImage(ourImage); 
    
    //printing the image on the console

    //represents a rectangular block of text
    for (TextBlock block in readText.blocks) {

       //represent words and word-like entities (dates, numbers, and so on)
      for (TextLine line in block.lines){

        for (TextElement word in line.elements){
          setState(() {
          _text = _text + word.text + ' ';
          });
        }
        _text = _text + '\n';
      }
    }
      recognizedText.close();


  }

if ( scan == true ) {

   return Container(
      child:Scaffold(
     body: SingleChildScrollView(
            child: Column(
       mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           Center(
           child:_image == null ? Text('Add image to scan') : Image.file(_image),
            ),
           

            _text == null ? Text('No notes have been scanned') : Text(_text),
            IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: (){    
              getImage();
                                
            }
            ),
          

    ],
       ),
     ),   
       floatingActionButton: RaisedButton(
      onPressed: () {
         _readText();
           setState(() {
                scan = false;
           });
        
      },
      child: Text('Scan',style: TextStyle(color:Colors.white),),
      color: Colors.black,
    )
    )
    );


} else {

 return Container(
      child:Scaffold(
     body: SingleChildScrollView(
            child: Column(
       mainAxisSize: MainAxisSize.min,
        children: <Widget>[
           Text(_text,),
           Center(
           child:TextFormField( initialValue: 'title' ,  maxLines: null, keyboardType: TextInputType.multiline,controller: notesController,)

            ),
          RaisedButton(
            onPressed: () {
              setState(() {
                scan = true;
                _text = '';
              });
              
            },
            child:Text('Reset',style: TextStyle(color:Colors.white),),
            color: Colors.black,
    )

    ],
       ),
       
     ),   
       floatingActionButton: RaisedButton(
      onPressed: () {
         _readText();
        
      },
      child:Text('Save',style: TextStyle(color:Colors.white),),
      color: Colors.black,
    )
    )
    );


}

   
  }
}