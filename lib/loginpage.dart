import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget{
  @override
  State<Loginpage> createState()=> _loginpageState();
}
class _loginpageState extends State<Loginpage>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("BOOKSTASH",style: TextStyle(fontSize: 30,color: Colors.blue,fontWeight: FontWeight.bold),),
        centerTitle: false,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              height: 400,
              width: 400,
              color: Colors.grey,
            ),
            Container(
              padding: EdgeInsets.only(left: 10,right: 10),
              height: 60,
              width: 350,
              decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black),borderRadius: BorderRadius.circular(35)),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/google.png"),fit: BoxFit.cover))
                    ),
                    Spacer(),
                    Text("Continue with Email",style: TextStyle(fontSize: 25,color: Colors.black),)
                ],
              ),
            ),
            Text("- or -",style: TextStyle(fontSize: 25,color: const Color.fromARGB(255, 117, 117, 117)),),
            Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(35),color: Colors.blue),
              child: Center(child: Text("Continue with Email",style: TextStyle(fontSize: 25,color: Colors.white),)),
            ),
          ],
        ),
      ),
    );
  }
}