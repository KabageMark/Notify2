import 'package:flutter/material.dart';
import 'package:notify/Authenticate/login.dart';
import 'package:notify/Screens/home.dart';
import 'package:notify/Services/auth.dart';
import 'package:notify/models/user.dart';
import 'package:notify/wrapper.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
          child: MaterialApp(
           home: Wrapper()
      ),
    );
  }
}

