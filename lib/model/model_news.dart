import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseNewsData {
  String name;
  String date;
  String description;
  String url;
  Timestamp time;
  String id;

  FirebaseNewsData({required this.name, required this.date, required this.description, required this.url, required this.time, required this.id});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'date': date,
      'description': description,
      'url': url,
      'timestamp':time,
      'id':id
    };
  }

  factory FirebaseNewsData.fromMap(Map<String, dynamic> map) {
    return FirebaseNewsData(
      name: map['name'],
      date: map['date'],
      description: map['description'],
      url: map['url'],
      time: map["timestamp"],
      id: map['id']
    );
  }
}
