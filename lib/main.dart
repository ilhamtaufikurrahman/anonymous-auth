import 'package:authentication_anonymous/auth_services.dart';
import 'package:authentication_anonymous/firestore_services.dart';
import 'package:authentication_anonymous/wrapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: AuthServices.userStream,
      child: MaterialApp(
        // home: Wrapper(),
        home: Scaffold(
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
        ),
      ),
    );
  }
}
