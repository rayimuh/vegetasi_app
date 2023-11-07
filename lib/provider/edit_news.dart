import 'package:flutter/foundation.dart';
import 'package:vegetasi_app/model/model_news.dart';
import 'package:vegetasi_app/service/firebase_service.dart';

class EditDataNews extends ChangeNotifier {
  FirebaseService firebase;
  EditDataNews({required this.firebase});
  Future<void> editData(String docId,FirebaseNewsData data) async {
    await firebase.editData(docId,data);
    notifyListeners();
  }
}
