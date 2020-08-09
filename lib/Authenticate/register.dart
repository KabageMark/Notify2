import 'package:flutter/material.dart';
import 'package:notify/Services/auth.dart';
import 'package:notify/decoration/decoration.dart';
import 'package:google_fonts/google_fonts.dart';


class Register extends StatefulWidget {

  final Function toggleview;
  Register({this.toggleview});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final AuthService _auth = AuthService();

  final _formkey = GlobalKey<FormState>();

  
  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
       return Container(
      child: Scaffold(
        body:Padding(padding:  EdgeInsets.fromLTRB(30, 30, 30, 0,),
        child: SingleChildScrollView(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              Center(
                  child: 
                  Text('Register' ,style:GoogleFonts.fredokaOne( fontWeight: FontWeight.bold,fontSize: 30,)),
              ),
             
                     Divider(
                height: 60,
                color: Colors.grey[800],
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText:'Email'),
                      validator: (val) => val.isEmpty ? 'Enter valid email ' : null,
                      onChanged: (val)  {
                      setState(() {
                        email = val;
                      });
                    }

                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                      decoration: textInputDecoration.copyWith(hintText:'Password'),
                      validator: (val) => val.length < 6 ? 'Enter passsword more than 6 characters ' : null,
                      onChanged: (val)  {
                       setState(() {
                         password = val;
                       });
                    },
                    obscureText: true,

                    ),
                    SizedBox(height: 30,),

                    RaisedButton(
                      onPressed: () async {
                      if (_formkey.currentState.validate()){
                        dynamic result = await _auth.registerwithEmailandPassword(email, password);
                        if (result == null){
                           setState(() {
                             error = 'Please supply valid credentials';
                           });
                        }
                      }
                 
                      },
                      color: Colors.green[400],
                      shape:OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      child: Text( 'Sign up' , style: TextStyle(color:Colors.white),),
                      ),
                       SizedBox(height: 12,),
                      Text(error ,style: TextStyle(color: Colors.red),),
                      Text('or'),
                         RaisedButton(
                      onPressed: ()  {
                      widget.toggleview();
                      },
                      color: Colors.grey,
                      shape:OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0))),
                      child: Text( 'login' , style: TextStyle(color:Colors.white),),
                      )

                  ]
                )
                
                )
                  
                
            ],
            
            
          ),
        ),
      ),
    )
    );
  }
}