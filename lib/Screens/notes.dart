import 'package:flutter/material.dart';
import 'package:notify/Services/database.dart';
import 'package:notify/models/files.dart';


class NotesHandler extends StatefulWidget {
 
  @override
  _NotesHandlerState createState() => _NotesHandlerState();
}

class _NotesHandlerState extends State<NotesHandler> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Notes>>(
      stream: DatabaseService().userNotes,
      builder: (context, snapshot) {
        List<Notes> _notesData =  snapshot.data;

          if(snapshot.hasData){
            return Container(
              
                child: Scaffold(
                  body:  
                  ListView.builder(                            
                            padding:  EdgeInsets.all(8.0),                     
                            
                            itemCount: _notesData.length,                                         
                            itemBuilder: (context,  index){

                               return Column(
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        width: 180,
                                        height: 180.0,
                                      
                                         child: Card(
                                          color: Colors.white,
                                         child: Padding(
                                           padding: const EdgeInsets.fromLTRB(0,10,0,10),
                                           child: ListTile(
                                            title: Text(_notesData[index].title,
                                                   style: TextStyle(
                                                   color: Colors.black,
                                                   fontSize: 19)
                                                     ),

                                           subtitle: Text(_notesData[index].content,
                                                     style: TextStyle(
                                                     color: Colors.black,
                                                     )
                                                     )         
                                  ),
                                         ),
                                    )
                                        ),
                                        
                                    ),
                                    SizedBox(height: 10,)
                                     
                                  ],
                                );
                            }
                       )
                  
              
                )
            );
          } else {
             return Text('There is nothing to see');
          }
      
      }
    );
  }
}

