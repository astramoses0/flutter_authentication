import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  DateTime time =DateTime.now();

Future<User> loginWithEmailAndPassword(String email,String password)async{ //login
  try{
    var user = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  return user.user;
  }catch(e){
    print("ERROR: SERVİCE.DART == 'loginWithEmailAndPassword'"+ e.toString()); //error message
  }
  
}


Future<User> registerWithEmailAndPassword(String username,String email,String password)async{
    try{
    var user = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    _firestore.collection("users").doc(user.user.uid).set({ //Stores the registered user's information in the cloud firebase
      "username": username,
      "id": user.user.uid,
      "passoword": password,
      "time": time,
    });
  return user.user;
  }catch(e){
    print("ERROR: SERVİCE.DART == 'registerWithEmailAndPassword'"+ e.toString());
  }
  

}
}
//BY ASTRA MOSES
//https://www.instagram.com/attokmak/
