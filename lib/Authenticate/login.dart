import 'package:flutter/material.dart';
import 'package:notify/Services/auth.dart';

class Login extends StatefulWidget {
  final Function toggleview;
  Login({this.toggleview});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _auth = AuthService();
  
  //text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body:Padding(padding:  EdgeInsets.fromLTRB(30, 30, 30, 0,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

           Row(children: <Widget>[
             Text('Sign in'),
            SizedBox(width:50),

            Center(
                child: 
                Text('login' ,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            ),
           SizedBox(width:29),
            FlatButton.icon(
            icon:Icon (Icons.person),
            label: Text('Register'),
            onPressed: () {
            },
            )
           ],),
                   Divider(
              height: 60,
              color: Colors.grey[800],
            ),
            Form(
              
              child: Column(
                children: <Widget>[
                  TextFormField(
                    onChanged: (val)  {
                    setState(() {
                      email = val;
                    });
                  }

                  ),
                  SizedBox(height: 20,),

                  TextFormField(
                    onChanged: (val)  {
                     setState(() {
                       password = val;
                     });
                  },
                  obscureText: true,

                  ),
                  SizedBox(height: 30,),

                  RaisedButton(
                    onPressed: () async{
                    print(email);
                    print(password);
                    },
                    color: Colors.black,
                    child: Text( 'login' , style: TextStyle(color:Colors.white),),
                    ),
                    Text('or'),
                       RaisedButton(
                    onPressed: () {
                      widget.toggleview();
                    },
                    color: Colors.black,
                    child: Text( 'register' , style: TextStyle(color:Colors.white),),
                    )

                ]
              )
              
              )
                
              
          ],
          
          
        ),
      ),
    )
    );
  }
}