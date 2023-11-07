import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:vegetasi_app/firebase_options.dart';
import 'package:vegetasi_app/page/onboarding_page.dart';
import 'package:vegetasi_app/provider/add_news.dart';
import 'package:vegetasi_app/provider/count_data.dart';
import 'package:vegetasi_app/provider/edit_news.dart';
import 'package:vegetasi_app/provider/edit_photo.dart';
import 'package:vegetasi_app/provider/open_url.dart';
import 'package:vegetasi_app/provider/upload_photo.dart';
import 'package:vegetasi_app/service/firebase_service.dart'; 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) =>ImageUploadProvider()), 
      ChangeNotifierProvider(create: (_)=>LinkProvider()),
      ChangeNotifierProvider(create: (_)=>CountDataProvider(firestore: FirebaseFirestore.instance)),
      ChangeNotifierProvider(create: (_)=>EditImageUploadProvider()),
      ChangeNotifierProvider(create: (_)=>AddDataNews(firebase: FirebaseService(firestore: FirebaseFirestore.instance))),
      ChangeNotifierProvider(create: (_)=>EditDataNews(firebase: FirebaseService(firestore: FirebaseFirestore.instance))),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CountDataProvider>().countData();
    return const MaterialApp(
      home: OnboardingPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
