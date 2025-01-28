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
}