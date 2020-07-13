import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notify/models/files.dart';

class DatabaseService{
   
  final String uid;
  //This is a constructor for the class
  DatabaseService({this.uid});

   //collection Reference 
  final CollectionReference usersNotes = Firestore.instance.collection('Notes');

  
  //Function for posting notes
  Future updateNotes(String title , String content ) async{
    return await usersNotes.add({
          'title': title,
          'content':content,
    
  });
  }

  //Quering student notes from Snapshot
  List<Notes> _userNotesFromSnapshot(QuerySnapshot snapshot){
          
    return snapshot.documents.map((doc){
          return Notes(
            title: doc.data['title'] ?? 'Untitled',
            content: doc.data['content'] ?? 'No notes have been posted',        

          );
    }).toList();
  }


   //stream for notes
  Stream<List<Notes>> get userNotes {
    return  usersNotes.snapshots().map(_userNotesFromSnapshot);
  }



}