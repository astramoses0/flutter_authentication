import 'package:auth/screens/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async { 
  WidgetsFlutterBinding.ensureInitialized(); 
  FirebaseApp app = await Firebase.initializeApp();
  runApp(MyApp());
  
 
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Authentication',
      theme: ThemeData(

        primarySwatch: Colors.blue,
        primaryColor: Colors.black
      ),
      home: Register()
    );
  }
}
