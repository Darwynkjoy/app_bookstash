import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_app/forgot_password.dart';
import 'package:library_app/sign_in.dart';

class CreateAccount extends StatefulWidget{
  @override
  State<CreateAccount> createState()=> _createAccountState();
}
class  _createAccountState extends State<CreateAccount>{

TextEditingController email=TextEditingController();
TextEditingController password=TextEditingController();

Future <void> signUp()async{
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text.trim(), password: password.text.trim());
        print("User signed up");
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
    }catch(e){
      print("signin error:$e");
    }
  }
  void showErrorDialog(String message){
    showDialog(context: context, builder: (BuildContext context)=>AlertDialog(
      title: Text("Error"),
      content: Text(message),
      actions: [
        TextButton(onPressed: (){
          Navigator.of(context).pop();
        }, child: Text("OK"))
      ],
    ));
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
              height: 300,
              width: 400,
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/image3.png"),fit: BoxFit.contain)),
            ),
            Text("Create an account",style: TextStyle(fontSize: 25,color: Colors.blue),),
            Spacer(),
            TextField(
              controller: email,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)),
                  hintText: "Example@email.com",hintStyle: TextStyle(fontSize: 25,color: Colors.grey),
                  labelText: "Email",labelStyle: TextStyle(fontSize: 25,color: Colors.blue),
                  ),
            ),
            Spacer(),
            TextField(
              controller: password,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)),
                  hintText: "Enter your password",hintStyle: TextStyle(fontSize: 25,color: Colors.grey),
                  labelText: "Password",labelStyle: TextStyle(fontSize: 25,color: Colors.blue),
                  ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("By signing in you accept. ",style: TextStyle(fontSize: 16,color: Colors.grey),),
                Text("Terms & conditions",style: TextStyle(fontSize: 18,color: Colors.blue),),
              ],
            ),
            Spacer(),
            Container(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                ),
                onPressed: (){
                  signUp();
                }, child: Text("Sign up",style: TextStyle(fontSize: 25,color: Colors.white),)),
            ),
            Spacer(),
            Text("Already have an account ?",style: TextStyle(fontSize: 25,color: Colors.grey),),
            TextButton(onPressed: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
            }, child: Text("Sign in",style: TextStyle(fontSize: 25,color: Colors.blue))),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }
}