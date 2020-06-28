import 'package:flutter/material.dart';
import 'package:notify/Authenticate/login.dart';
import 'package:notify/Authenticate/register.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignin = true;

  void toggleview(){
    setState(() {
      showSignin = !showSignin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignin)  {
      return Login(toggleview: toggleview);
    } else {
      return Register(toggleview: toggleview);
    }
  
  }
}

