import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(

     child: Scaffold(
      body:Padding(padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
      child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              Center(
              child:Text('notes', style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30),)
            ),
             Divider(
              height: 60,
              color: Colors.grey[800],
            ),
          Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const ListTile(
                title: Text('This is an example of the notes taken'),
                subtitle: Text('Here are the notes and you can click to read them'),
              ),
            ],
          ),
        )
          ]
      ),
      )

     )
    );
  }
}