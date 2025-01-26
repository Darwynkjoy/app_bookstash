import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:library_app/create_account.dart';
import 'package:library_app/sign_in.dart';

class Loginpage extends StatefulWidget{
  @override
  State<Loginpage> createState()=> _loginpageState();
}
class _loginpageState extends State<Loginpage>{

Future<UserCredential?> loginWithGoogle()async{
  try{
    final GoogleSignIn googleSignIn=GoogleSignIn(
      clientId: "510531605368-kh0gf5gq5gd3g397vmrc1tnfhc8kfr8b.apps.googleusercontent.com");
      final googleUser=await googleSignIn.signIn();
      final googleauth=await googleUser?.authentication;
      final cred=GoogleAuthProvider.credential(
        idToken: googleauth?.idToken,accessToken: googleauth?.accessToken);
      return await FirebaseAuth.instance.signInWithCredential(cred);
  }catch(e){
    print(e.toString());
  }
  return null;
}

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            Text("B00K",style: TextStyle(fontSize: 25,color: Colors.blue,fontWeight: FontWeight.bold),),
            Text("STASH",style: TextStyle(fontSize: 32,color: Colors.blue,fontWeight: FontWeight.bold),),
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 390,
              width: 400,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/Bibliophile-bro.png"),fit: BoxFit.cover)),
            ),
            Text("Hello there !",style: TextStyle(fontSize: 25,color: Colors.blue),),
            Spacer(),
            GestureDetector(
              onTap: () {
                loginWithGoogle();
              },
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black),borderRadius: BorderRadius.circular(35)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/google.png"),fit: BoxFit.cover))
                        ),
                        SizedBox(width: 10,),
                        Center(child: Text("Continue with Google",style: TextStyle(fontSize: 25,color: Colors.black),))
                    ],
                  ),
                ),
              ),
            ),
            Text("- or -",style: TextStyle(fontSize: 25,color: const Color.fromARGB(255, 117, 117, 117)),),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
              },
              child: Container(
                height: 50,
                width: 350,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: Colors.blue),
                child: Center(child: Text("Continue with Email",style: TextStyle(fontSize: 25,color: Colors.white),)),
              ),
            ),
            Spacer(),
            Text("Don't have an account ?",style: TextStyle(fontSize: 25,color: Colors.grey),),
            TextButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>CreateAccount()));
            }, child: Text("Sign up",style: TextStyle(fontSize: 25,color: Colors.blue))),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}