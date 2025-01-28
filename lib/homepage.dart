import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:library_app/add_books.dart';
import 'package:library_app/database.dart';

class Homepage extends StatefulWidget{
  @override
  State<Homepage> createState()=> _homepageState();
}
class _homepageState extends State<Homepage>{

  List<Color> myColors=[
  Colors.grey,
  Colors.lightBlue,
  Colors.lightGreenAccent,
  Colors.cyanAccent,
  Colors.lightGreen
  ];

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
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: .47,
          ),
          itemCount: snapshots.data!.docs.length,
          itemBuilder: (context,index){
            DocumentSnapshot Bs=snapshots.data!.docs[index];
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  height: 300,
                  width: 200,
                    decoration: BoxDecoration(color: myColors[index % 5]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(''''''+(Bs["title"] ?? "N/A"),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                          textAlign: TextAlign.left,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
                              Text("- "+(Bs["author"] ?? "N/A"),style: TextStyle(fontSize: 15,),overflow: TextOverflow.clip,),
                            ],
                          )
                      ],
                    ),
                ),
                Container(
                  height: 82,
                  width: 200,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(''''''+(Bs["title"] ?? "N/A"),
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,),
                      Row(
                        children: [
                          Text("Rating:"+(Bs["rating"] ?? "N/A"),style: TextStyle(fontSize: 18,color: const Color.fromARGB(255, 0, 140, 255)),),
                          Icon(Icons.star,size: 18,color: Colors.amber,)
                        ],
                      )
                    ],
                  ),
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