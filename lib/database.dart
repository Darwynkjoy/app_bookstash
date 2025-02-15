import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static Future addBooksDetails(
    Map<String,dynamic>booksInfoMap,String id)async{
      return await FirebaseFirestore.instance
      .collection("Bookstash")
      .doc(id)
      .set(booksInfoMap);
    }
    static Future<Stream<QuerySnapshot>> getBooksDetatils()async{
    return await FirebaseFirestore.instance.collection("Bookstash").snapshots();
  }
  static Future updateBookDetails(
    String id,Map<String,dynamic> updateInfo)async{
      return await FirebaseFirestore.instance
      .collection("Bookstash")
      .doc(id)
      .update(updateInfo);
    }
  
  static Future deleteBookDetails(String id)async{
    return await FirebaseFirestore.instance
    .collection("Bookstash")
    .doc(id)
    .delete();
  }
}