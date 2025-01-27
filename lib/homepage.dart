import 'package:flutter/material.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.5,
          ),
          itemCount: 10,
          itemBuilder: (context,index){
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  height: 300,
                  width: 200,
                    decoration: BoxDecoration(color: myColors[index % 5]),
                    child: Text('''the great gatsby and the metro man car ride contain''',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                      textAlign: TextAlign.left,
                      ),
                ),
                Container(
                  height: 82,
                  width: 200,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('''the great gatsby and the metro man car ride contain''',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,),
                      Text("Rating:",style: TextStyle(fontSize: 18,color: const Color.fromARGB(255, 0, 140, 255)),)
                    ],
                  ),
                )
              ],
            );
          }),
      ),
    );
  }
}