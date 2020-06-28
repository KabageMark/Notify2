import 'package:flutter/material.dart';
import 'package:notify/Authenticate/authenticate.dart';
import 'package:notify/Screens/home.dart';
import 'package:provider/provider.dart';
import 'package:notify/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if (user == null){
       return Authenticate();
    } else {
      return Home();
    }
  }
}