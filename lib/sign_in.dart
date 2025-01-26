import 'package:flutter/material.dart';
import 'package:library_app/create_account.dart';
import 'package:library_app/forgot_password.dart';

class SignIn extends StatefulWidget{
  @override
  State<SignIn> createState()=> _signInState();
}
class  _signInState extends State<SignIn>{

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

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
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/image2.jpg"),fit: BoxFit.cover)),
            ),
            Text("Let's get started!",style: TextStyle(fontSize: 25,color: Colors.blue),),
            Spacer(),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)),
                  hintText: "Example@email.com",hintStyle: TextStyle(fontSize: 25,color: Colors.grey),
                  labelText: "Email",labelStyle: TextStyle(fontSize: 25,color: Colors.blue),
                  ),
            ),
            Spacer(),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)),
                  hintText: "Enter your password",hintStyle: TextStyle(fontSize: 25,color: Colors.grey),
                  labelText: "Password",labelStyle: TextStyle(fontSize: 25,color: Colors.blue),
                  ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPassword()));
                }, child: Text("Forgot the password?",style: TextStyle(fontSize: 18,color: Colors.grey),)),
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
                onPressed: (){}, child: Text("Sign in",style: TextStyle(fontSize: 25,color: Colors.white),)),
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