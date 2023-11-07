import 'package:flutter/foundation.dart';
import 'package:vegetasi_app/model/model_news.dart';
import 'package:vegetasi_app/service/firebase_service.dart';

class AddDataNews extends ChangeNotifier {
  FirebaseService firebase;
  AddDataNews({required this.firebase});
  Future<void> addData(FirebaseNewsData data,String docId) async {
    await firebase.addData(data,docId);
    notifyListeners();
  }
}
