import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../widgets/progress.dart';
import '../widgets/header.dart';

final userRef = FirebaseFirestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<dynamic> users = [];
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) {
      getUsers();
    });

    super.initState();
  }

  getUsers() async {
    final QuerySnapshot snapshot = await userRef.get();
    setState(() {
      users = snapshot.docs;
    });

    // snapshot.docs.forEach((DocumentSnapshot doc) {
    //   print(doc.data);
    // });
  }

  // userRef.get().then((QuerySnapshot snapshot) {
  //   snapshot.docs.forEach((DocumentSnapshot document) {
  //     print(document.data);
  //   });
  // });
  // }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true),
      body: ListView(
          children: users.map((user) => Text(user['username'])).toList()),
    );
  }
}
