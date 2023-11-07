import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegetasi_app/provider/open_url.dart';

class DriveLauncherPage extends StatelessWidget {
  const DriveLauncherPage({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF32A060),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(                  
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),                    
                  ),
                  onPressed: () async {
                    context.read<LinkProvider>().launchURL("https://drive.google.com/drive/folders/1b2uXJOfSpNVP7JkDI1onWq9lImJoC47_?usp=sharing");                    
                  },
                  child: const Text(
                    'Open Google Drive',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF32A060),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 70,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
