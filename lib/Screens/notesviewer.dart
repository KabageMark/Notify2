import 'package:flutter/material.dart';
import 'package:notify/models/files.dart';


class Notesviewer extends StatelessWidget {
  final Notes note;
  Notesviewer({this.note});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title:Text(
            note.title,
            style: TextStyle(
            color: Colors.black,
            )
            ),
          backgroundColor: Colors.white,
        ),
        body:Text(note.content), 
      )
    );
  }
}