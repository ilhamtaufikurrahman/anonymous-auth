import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreServices {
  static CollectionReference productCollection =
      FirebaseFirestore.instance.collection('products');

  static Future<void> createUpdateProduct(
      String id, String name, num price) async {
    await productCollection.doc(id).set({
      'nama': name,
      // 'harga': price
    }, SetOptions(merge: true));
  }

  static Future<DocumentSnapshot> getData(String id) async {
    return await productCollection.doc(id).get();
  }

  static Future<void> deleteData(String id) async {
    await productCollection.doc(id).delete();
  }
}
