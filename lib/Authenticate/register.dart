import 'package:flutter/material.dart';
import 'package:notify/Services/auth.dart';

class Register extends StatefulWidget {

  final Function toggleview;
  Register({this.toggleview});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

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

            Center(
                child: 
                Text('register' ,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            ),
           
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
                    child: Text( 'register' , style: TextStyle(color:Colors.white),),
                    ),
                    Text('or'),
                       RaisedButton(
                    onPressed: ()  {
                    widget.toggleview();
                    },
                    color: Colors.black,
                    child: Text( 'login' , style: TextStyle(color:Colors.white),),
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