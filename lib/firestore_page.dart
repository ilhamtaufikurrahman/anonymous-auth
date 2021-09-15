import 'package:authentication_anonymous/firestore_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestorePage extends StatelessWidget {
  const FirestorePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await FirestoreServices.createUpdateProduct(
                      '1', 'timbangan digital', 50000);
                },
                child: Text('Create')),
            ElevatedButton(
                onPressed: () async {
                  DocumentSnapshot snapshot =
                      await FirestoreServices.getData('1');
                  print(snapshot.get('nama'));
                },
                child: Text('Get')),
            ElevatedButton(
                onPressed: () async {
                  await FirestoreServices.deleteData('1');
                },
                child: Text('Delete')),
          ],
        ),
      ),
    );
  }
}
