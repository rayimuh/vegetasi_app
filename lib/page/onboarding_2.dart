import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFF32A060),
        body: Stack(children: [
          SizedBox(width: double.infinity,height: double.infinity,child: Image.asset("assets/tree.png",fit: BoxFit.cover,),),
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Image.asset('assets/UT.png'))),
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
                            'PROGRESS',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 28,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 90,
              ),
              DottedBorder(
                strokeWidth: 5,
                dashPattern: const [20, 10],
                color: const Color(0xFF15512E),
                borderType: BorderType.Circle,
                child: Image.asset(
                  "assets/pak edi.png",
                  width: 200,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              const Text(
                "Kami melakukan penanaman",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "tanaman dengan",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "total 110.000 di total lahan",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "510 hektar",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ]));
  }
}
