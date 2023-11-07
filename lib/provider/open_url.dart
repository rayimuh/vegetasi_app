
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkProvider extends ChangeNotifier{
  Future<void> launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw "Tidak bisa buka url";
    }
    notifyListeners();
  }
}