import 'package:flutter/material.dart';

class AboutUsDetailPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imagePath;
  const AboutUsDetailPage(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .75,
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: 280,
              decoration: const BoxDecoration(
                  color: Color(0XFF32A060),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 5,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0XFF32A060),),
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
