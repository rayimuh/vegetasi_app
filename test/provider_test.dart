import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:vegetasi_app/model/model_news.dart';
import 'package:vegetasi_app/provider/add_news.dart';
import 'package:vegetasi_app/provider/count_data.dart';
import 'package:vegetasi_app/provider/edit_news.dart';
import 'package:vegetasi_app/service/firebase_service.dart';

import 'mock_cloud.dart';
import 'provider_test.mocks.dart';

final firestore = FakeFirebaseFirestore();

@GenerateMocks([FirebaseService])
void main() {
  group('Asset Provider', () {
    late EditDataNews editDataNews;
    late MockFirebaseService mockFirebaseService;
    late CountDataProvider countDataProvider;
    late AddDataNews addDataNews;

    setupCloudFirestoreMocks();

    setUpAll(() async {
      await Firebase.initializeApp();
    });

    setUp(() {
      mockFirebaseService = MockFirebaseService();
      addDataNews = AddDataNews(firebase: mockFirebaseService);      
      countDataProvider = CountDataProvider(firestore: firestore);
      editDataNews = EditDataNews(firebase: mockFirebaseService);
    });

    test('addDataNews should call FirebaseService', () async {
      final testData = FirebaseNewsData(
          name: "Rayi",
          date: "2023-05-12",
          description: "Test",
          url: "",
          time: Timestamp.fromDate(DateTime.now()),
          id: "Update-01");      
      when(mockFirebaseService.addData(testData, "Update-01"))
          .thenAnswer((_) => Future.value());
      await addDataNews.addData(testData, "Update-01");
      verify(mockFirebaseService.addData(testData, "Update-01")).called(1);
    });

    test('editDataNews should call FirebaseService', () async {
      final testData = FirebaseNewsData(
          name: "Rayi",
          date: "2023-05-12",
          description: "Test",
          url: "",
          time: Timestamp.fromDate(DateTime.now()),
          id: "Update-01");      
      when(mockFirebaseService.editData("Update-01", testData))
          .thenAnswer((_) => Future.value());
      await editDataNews.editData("Update-01", testData);
      verify(mockFirebaseService.editData("Update-01", testData)).called(1);
    });

    test('countDataProvider should call FirebaseService', () async {    
      await countDataProvider.countData();
      expect(countDataProvider.id, equals(1));
    });
  });
}
