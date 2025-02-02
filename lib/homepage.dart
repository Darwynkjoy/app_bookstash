import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:library_app/add_books.dart';
import 'package:library_app/database.dart';

class Homepage extends StatefulWidget{
  @override
  State<Homepage> createState()=> _homepageState();
}
class _homepageState extends State<Homepage>{

  TextEditingController title=TextEditingController();
  TextEditingController author=TextEditingController();
  TextEditingController year=TextEditingController();
  TextEditingController rating=TextEditingController();

  Stream<QuerySnapshot>? BooksStream;

  getontheload()async{
    BooksStream=await Database.getBooksDetatils();
    setState(() {
    });
  }

  @override
  void initState(){
    super.initState();
    getontheload();
  }

  Widget allBookDetails(){
    return StreamBuilder(stream: BooksStream,
    builder: (context,AsyncSnapshot<QuerySnapshot>snapshots){
      if(snapshots.connectionState == ConnectionState.waiting){
        return Center(child: CircularProgressIndicator(),);
      }
      if(snapshots.hasError){
        return Text("an error has occured ${snapshots.error}");
      }
      if(!snapshots.hasData || snapshots.data!.docs.isEmpty){
        return Center(child: Text("Data is not available"),);
      }
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.separated(separatorBuilder: (context,index){
          return SizedBox(height: 30,);
        },
          itemCount: snapshots.data!.docs.length,
          itemBuilder: (context,index){
            DocumentSnapshot Bs=snapshots.data!.docs[index];
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(border: Border.all(width: 2,color: Colors.black)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('''Title: '''+(Bs["title"] ?? "N/A"),
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black),
                          textAlign: TextAlign.left,
                          ),
                          Text('''Year of publication:'''+(Bs["year"] ?? "N/A"),
                            style: TextStyle(
                            fontSize: 20,
                            color: Colors.black),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,),
                          Row(
                            children: [
                              Text("Author: "+(Bs["author"] ?? "N/A"),style: TextStyle(fontSize: 20,),overflow: TextOverflow.clip,),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text("Rating:"+(Bs["rating"] ?? "N/A"),style: TextStyle(fontSize: 20,),),
                                  Icon(Icons.star,size: 20,color: Colors.amber,),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(onPressed: (){
                                    title.text=Bs["title"];
                                    author.text=Bs["author"];
                                    year.text=Bs["year"];
                                    rating.text=Bs["rating"];
                                    showModalBottomSheet(context: context, builder: (BuildContext context){
                                      final id=Bs["id"];
                                      return Container(
                                        width: 410,
                                        height: 450,
                                        child: Column(
                                          children: [
                                            Text("Edit book",style: TextStyle(fontSize: 25,color: Colors.blue),),
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
                  Map<String,dynamic> updateInfo={
                    "title":title.text,
                    "author":author.text,
                    "year":year.text,
                    "rating":rating.text,
                            };
                            Navigator.pop(context);
                            await Database.updateBookDetails(id,updateInfo);
                }, child: Text("Update",style: TextStyle(fontSize: 25,color: Colors.white),)),
            ),
          ],
                                        ),
                                      );
                                    });
                                  }, icon: Icon(Icons.edit),iconSize: 25,color: Colors.blue,),
                                  IconButton(onPressed: (){
                                    showDialog(context: context, builder: (BuildContext context){
                                      return AlertDialog(
                                        title: Text("Alert Box"),
                                        content: Text("Do you want to delete?"),
                                        actions: [
                                          TextButton(onPressed: ()async{
                                            Navigator.pop(context);
                                            await Database.deleteBookDetails(Bs["id"]);
                                          }, child: Text("Yes",style: TextStyle(color: Colors.blue),)),
                                          TextButton(onPressed: (){
                                            Navigator.pop(context);
                                          }, child: Text("No",style: TextStyle(color: Colors.blue),))
                                        ],
                                      );
                                    });
                                  }, icon: Icon(Icons.delete),iconSize: 25,color: Colors.blue,),
                                ],
                              )
                            ],
                          )
                      ],
                    ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                  ],
                )
              ],
            );
          }),
      );
    });
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
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddBooks()));
          }, icon: Icon(Icons.library_books,color: Colors.blue,size: 30,))
        ],
      ),
      body: Container(
        child: Expanded(child: allBookDetails()),
      )
    );
  }
}