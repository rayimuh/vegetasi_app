import 'package:flutter/material.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration:const  BoxDecoration(
              color: Colors.white,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 120),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0XFF32A060),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(10, -10),
                  blurRadius: 8,
                ),
              ],
              shape: BoxShape.rectangle,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(60),
              ),
            ),
          ),
          const Column(children: [
            SizedBox(height: 60),
            Padding(padding: EdgeInsets.only(right: 200),child: Text("Panduan",style: TextStyle(fontSize: 35,color: Color(0XFF32A060),fontWeight: FontWeight.bold),)),
            SizedBox(height: 70),
            NumberCard(number: "1", description: "Pastikan Google Earth sudah terinstall"),
            SizedBox(height: 20),
            NumberCard(number: "2", description: "Buka logo “map” pada tombol di bawah tengah"),
            SizedBox(height: 20),
            NumberCard(number: "3", description: "Pilih “Unduh File KML” jika ingin mendapatkan KML terbaru"),
            SizedBox(height: 20),
            NumberCard(number: "4", description: "Pilih “Buka Map” jika ingin melihat peta terkait KML"),
          ],)
        ],
      ),
    );
  }
}

class NumberCard extends StatelessWidget {
  final String number;
  final String description;

  const NumberCard({
    Key? key,
    required this.number,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10),
      child: Card(
        color: Colors.white,
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: const Color(0xFF65CA99),
                radius: 15,
                child: Text(
                  number,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  description,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

