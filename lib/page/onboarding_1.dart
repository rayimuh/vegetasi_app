

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFF32A060),
        body: Stack(
          children: [
            SizedBox(height: double.infinity,width: double.infinity,child: Image.asset("assets/pohon.png",fit: BoxFit.cover,),),
            Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Align(alignment: Alignment.topRight,child: Padding(padding: const EdgeInsets.only(right: 5),child: Image.asset('assets/UT.png'))),
              const SizedBox(
                height: 60,
              ),
              const IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Row(
                    children: [
                      VerticalDivider(
                        thickness: 5,
                        color: Color(0xFF15512E),
                        width: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            'SELAMAT',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'DATANG',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              DottedBorder(strokeWidth: 5,dashPattern: const [20,10],color:const Color(0xFF15512E),borderType: BorderType.Circle,child: Image.asset("assets/mountain.png",width: 200,height: 200,),),
              const SizedBox(height: 80,),
              const Text("Aplikasi Revegetasi",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
              const Text("Gunung Arjuno",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),)
            ],
          ),
          ]
        ));
  }
}
