import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:library_app/sign_in.dart';

class ForgotPassword extends StatefulWidget{
  @override
  State<ForgotPassword> createState()=> _forgotPasswordState();
}
class  _forgotPasswordState extends State<ForgotPassword>{

  TextEditingController email=TextEditingController();
  bool isLoading=false;
  String? errorMessage;

  Future <void> sendForgotPasswordResetEmail()async{
    setState(() {
      isLoading=true;
      errorMessage=null;
    });
  try{
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: email.text.trim(),
      );
      setState(() {
        isLoading=false;
      });
      _ShowDialog("Password reset email sent!.please check your inbox");
  } on FirebaseAuthException catch(e){
    setState(() {
      isLoading=false;
    });
    _ShowDialog(e.message ?? "an error occurred");
  }
  }

  void _ShowDialog(String message){
    showDialog(context: context, builder: (context)=>
      AlertDialog(
        title: Text("Notification"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("OK"))
        ],
      ),
    );
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
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/image4.png"),fit: BoxFit.contain)),
            ),
            Text("forgotten your password!",style: TextStyle(fontSize: 25,color: Colors.blue),),
            Spacer(),
            Text('''enter your email associated with your account and we'll send you a password reset instructions''',style: TextStyle(fontSize: 16,color: Colors.grey),),
            SizedBox(height: 20,),
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
            Container(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                ),
                onPressed: (){
                  sendForgotPasswordResetEmail();
                }, child: Text("Reset password",style: TextStyle(fontSize: 25,color: Colors.white),)),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Go to ",style: TextStyle(fontSize: 25,color: Colors.grey),),
                TextButton(onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SignIn()));
                }, child: Text("sign in",style: TextStyle(fontSize: 25,color: Colors.blue))),
                Text("page !",style: TextStyle(fontSize: 25,color: Colors.grey),),
              ],
            ),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}