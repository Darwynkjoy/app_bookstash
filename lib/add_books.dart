import 'package:flutter/material.dart';

class AddBooks extends StatefulWidget{
  @override
  State<AddBooks> createState()=> _addbooksState();
}
class _addbooksState extends State<AddBooks>{
  TextEditingController title=TextEditingController();
  TextEditingController rating=TextEditingController();

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
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.library_books,color: Colors.blue,size: 30,))
        ],
      ),
      body: TextField()
    );
  }
}