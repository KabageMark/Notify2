import 'package:firebase_auth/firebase_auth.dart';
import 'package:notify/Services/database.dart';
import 'package:notify/models/user.dart';

class AuthService {

    final FirebaseAuth _auth = FirebaseAuth.instance;

    //create user object based on FirebaseUser
    User _userFromFirebaseUser( FirebaseUser user){
        return user != null ? User(uid: user.uid) : null;
    }
    
    //auth change user stream
    Stream<User> get user {
      return _auth.onAuthStateChanged.
      map(_userFromFirebaseUser);
    }
    
    //sign in anonymously
    Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  
     //sign in with email and password
      Future signinwithEmailandPassword(String email, String password) async{
            try {
              AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
              FirebaseUser user = result.user;
              _userFromFirebaseUser(user);
            } catch (e) {
            print(e.toString());
            return null;
      }
     }
     //register with email and password

     Future registerwithEmailandPassword(String email, String password) async{
            try {
              AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
              FirebaseUser user = result.user;
              _userFromFirebaseUser(user);
                await DatabaseService(uid: user.uid).updateNotes('Untitled', 'There are no notes posted');
                
            } catch (e) {
            print(e.toString());
            return null;
      }
     }

     //sign out
     Future signOut() async{
        try {
        return await _auth.signOut();
      } catch (e) {
        print(e.toString());
        return null;
      }
  }
     }


