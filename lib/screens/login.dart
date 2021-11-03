import 'package:auth/screens/home.dart';
import 'package:auth/screens/register.dart';
import 'package:auth/service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {

    Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  
      @override
void initState() { 

  super.initState();
   Firebase.initializeApp();
   
}


 
 
   final TextEditingController emailController = TextEditingController();
   final TextEditingController passwordController = TextEditingController();



  final FirebaseAuth auth = FirebaseAuth.instance;    
  FirebaseFirestore firestoredb =FirebaseFirestore.instance;
  FirebaseService firebaseService = FirebaseService();

  @override
  Widget build(BuildContext context) {
     var size = MediaQuery.of(context).size;
   User user = auth.currentUser;
    

    return Scaffold(
      
     
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
       
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            
             SizedBox(height: 30,),
                
                Row(children: [
                  Center(child: Text("Sign ", style: TextStyle( fontWeight: FontWeight.w900,fontSize: 50),),
                  ),
                  Center(child: Text("In.", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900,fontSize: 50),),),
                 
                ],),
               
                SizedBox(height: 20,),

                    SizedBox(height: 10,),

                             Container(
              
                    child: TextFormField(
                      controller: emailController,
                       
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined,color: Colors.black),
                        hintText: "EMAIL",
                        labelText: "EMAIL",
                        
                        enabledBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                        focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                        )
                        
                      ),
                     padding: EdgeInsets.all(20),
                    ),
                    SizedBox(height: 10,),


                                         Container(
              
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        
                        prefixIcon: Icon(Icons.lock_outlined,color: Colors.black),
                        hintText: "PASSWORD",
                       
                        hintStyle: TextStyle(color: Colors.black),
                        labelText: "PASSWORD",
                        
                        enabledBorder: OutlineInputBorder(borderSide:BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                        focusedBorder: OutlineInputBorder(
                           borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                        )
                        
                      ),
                     padding: EdgeInsets.all(20),
                    ),

                  Container(
                    padding: EdgeInsets.all(5),
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.blue[500],Colors.blue[800]]),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: OutlineButton(
                      onPressed: ()async{ 
                        
                       await firebaseService.loginWithEmailAndPassword(emailController.text, passwordController.text);
                  
                       await Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home()));


                      
                      },
                       color: Colors.transparent,
                      borderSide: BorderSide(color: Colors.transparent),
                      child: Text("Sign In", style: TextStyle(color: Colors.white),),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(200))),
             
                      ),),
                      SizedBox(height: 10,),

Center( 
  child: TextButton(onPressed: () { 
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Register())); 
    },
     child: Text("I have an account",style: TextStyle(color: Colors.black),
     ),),),
            ]
                    )
        )
      )
    );
  }
}