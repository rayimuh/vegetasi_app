import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CountDataProvider extends ChangeNotifier {
  final FirebaseFirestore firestore;
  CountDataProvider({required this.firestore});
  int id = 0;
  Future<void> countData() async {
    final snapshot = await firestore.collection("news").get();
    id = snapshot.size + 1;
    notifyListeners();
  }
}
