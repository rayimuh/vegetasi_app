import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vegetasi_app/model/model_news.dart';
import 'package:vegetasi_app/service/firebase_service.dart';

import 'mock_cloud.dart';

final firestoreMock = FakeFirebaseFirestore();
void main() {
  group('fetchAndGenerateCSV', () {
    setupCloudFirestoreMocks();
    late FirebaseService firebaseService;

    setUp(() {
      firebaseService = FirebaseService(firestore: firestoreMock);
    });

    setUpAll(() async {
      await Firebase.initializeApp();
    });

    test('addData should increase 1 data', () async {
      final testData = FirebaseNewsData(
          name: "Rayi",
          date: "2023-05-12",
          description: "Test",
          url: "",
          time: Timestamp.fromDate(DateTime.now()),
          id: "Update-01");
      const ID = "Update-01";
      final collection = firestoreMock.collection("news");
      await firebaseService.addData(testData, ID);
      final lengthData = (await collection.get()).docs.length;
      expect(lengthData, equals(1));
    });
    test('editData should change data', () async {
      final testData = FirebaseNewsData(
          name: "Rayi",
          date: "2023-05-12",
          description: "Test",
          url: "",
          time: Timestamp.fromDate(DateTime.now()),
          id: "Update-01");
      final newData = FirebaseNewsData(
          name: "Rayi",
          date: "2023-05-12",
          description: "Test2",
          url: "",
          time: Timestamp.fromDate(DateTime.now()),
          id: "Update-01");
      const ID = "Update-01";
      final collection = firestoreMock.collection("news");
      await firebaseService.addData(testData, ID);
      final beforeData = (await collection.doc(ID).get()).data();
      await firebaseService.editData(ID, newData);
      final afterData = (await collection.doc(ID).get()).data();
      expect(beforeData, isNot(afterData));
    });
  });
}
