import 'package:flutter/material.dart';
import 'package:notify/Screens/notes.dart';
import 'package:notify/Screens/scan.dart';
import 'package:notify/Services/auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

 List<Widget> widgetOptions = <Widget> [

    new NotesHandler(),
    new Scan(),
  
  ];

class _HomeState extends State<Home> {

  final AuthService _auth = AuthService();
  int _selectedIndex = 0;

 

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(

     child: Scaffold(
       appBar: AppBar(
         title:Text('Home'),
         backgroundColor:Colors.grey[500],
         elevation: 0.0,
         actions: <Widget>[
           FlatButton.icon(
             onPressed: () async{
               _auth.signOut();
             }
             
             , icon: Icon(Icons.person), label: Text('Logout')
             )
         ],
       ),
      body: widgetOptions.elementAt(_selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scanner),
            title: Text('Scan'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_add),
            title: Text('Notes'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[800],
        onTap: _onItemTapped,
      ),
     )
    );
  }
    
  }
