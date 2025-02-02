import 'package:flutter/material.dart';
import 'package:library_app/database.dart';
import 'package:random_string/random_string.dart';

class AddBooks extends StatefulWidget{
  @override
  State<AddBooks> createState()=> _addbooksState();
}
class _addbooksState extends State<AddBooks>{
  TextEditingController title=TextEditingController();
  TextEditingController author=TextEditingController();
  TextEditingController year=TextEditingController();
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
            Text("Add books",style: TextStyle(fontSize: 25,color: Colors.blue),),
            SizedBox(height: 20,),
            TextField(
              controller: title,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)),
                  hintText: "Enter title of the book",hintStyle: TextStyle(fontSize: 25,color: Colors.grey),
                  labelText: "Title",labelStyle: TextStyle(fontSize: 25,color: Colors.blue),
                  ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: author,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)),
                  hintText: "Enter authors name",hintStyle: TextStyle(fontSize: 25,color: Colors.grey),
                  labelText: "Author",labelStyle: TextStyle(fontSize: 25,color: Colors.blue),
                  ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: year,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)),
                  labelText: "Year of publication",labelStyle: TextStyle(fontSize: 25,color: Colors.blue),
                  hintText: "YYYY",hintStyle: TextStyle(fontSize: 25,color: Colors.grey),
                  ),),
            SizedBox(height: 20,),
            TextField(
              controller: rating,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15)),
                  hintText: "Enter rating",hintStyle: TextStyle(fontSize: 25,color: Colors.grey),
                  labelText: "Rating",labelStyle: TextStyle(fontSize: 25,color: Colors.blue),
                  ),
            ),
            SizedBox(height: 20,),
            Container(
              height: 50,
              width: 350,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
                ),
                onPressed: ()async{
                  String id=randomAlphaNumeric(10);
                  Map<String,dynamic> booksInfoMap={
                    "title":title.text,
                    "author":author.text,
                    "year":year.text,
                    "rating":rating.text,
                    "id":id,
                  };
                  setState(() {
                    title.clear();
                    author.clear();
                    year.clear();
                    rating.clear();
                  });
                  await Database.addBooksDetails(booksInfoMap, id);
                  showDialog(context: context, builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("Book successfully added"),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text("OK"))
                      ],
                    );
                  });
                }, child: Text("Add",style: TextStyle(fontSize: 25,color: Colors.white),)),
            ),
          ],
        ),
      ),
    );
  }
}