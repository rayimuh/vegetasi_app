import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:vegetasi_app/model/model_news.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseService {
  final FirebaseFirestore firestore;
  FirebaseService ({required this.firestore});
  
  
  Future<void> addData(FirebaseNewsData data, String docId) async {
    try {
      Map<String, dynamic> dataMap = data.toMap();
      await firestore.collection("news").doc(docId).set(dataMap);
      Fluttertoast.showToast(
        msg: "Data berhasil di upload",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xFF32A060),
        textColor: Colors.white,
      );
    } catch (error) {
      Fluttertoast.showToast(
        msg: "Terdapat error: $error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xFF32A060),
        textColor: Colors.white,
      );
    }
  }

  Future<void> editData(String docId, FirebaseNewsData data) async {
    try {
      Map<String, dynamic> dataMap = data.toMap();
      await firestore.collection("news").doc(docId).update(dataMap);
      Fluttertoast.showToast(
        msg: "Data berhasil di edit",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xFF32A060),
        textColor: Colors.white,
      );
    } catch (error) {
      Fluttertoast.showToast(
        msg: "Terdapat error: $error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xFF32A060),
        textColor: Colors.white,
      );
    }
  }
}
