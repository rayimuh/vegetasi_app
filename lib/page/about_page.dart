import 'package:flutter/material.dart';
import 'package:vegetasi_app/page/about_us_detail_page.dart';
import 'package:vegetasi_app/page/permission_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0XFF32A060),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80),
                const Text(
                  "About Us dan Perizinan",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
                const SizedBox(height: 30),
                const SelectionCard(
                  pictureUrl:
                      "assets/UTREES.jpg",
                  description: "UTREES",
                  subtitle:
                      "United Tractors for Nature and Environment Sustainability (UTREES) is a conservation- and reforestation-based CSR activity that aims to improve the quality of our environment, provide benefits to the community and at the same time reduce Green House Gas emissions.",
                ),
                const SizedBox(height: 20),
                const SelectionCard(
                  pictureUrl:
                      "assets/UTACTION.jpg",
                  description: "UTACTION",
                  subtitle:
                      "United Tractors for Emergency Response and Action (UTACTION) is a support program to help communities deal with post-disaster emergency situations. As the programs was developing, the same trainings are also given to all elements of the Company.",
                ),
                const SizedBox(height: 20),
                const SelectionCard(
                  pictureUrl:
                      "assets/UTGROWTH.jpg",
                  description: "UTGROWTH",
                  subtitle:
                      "United tractors for Generating Opportunities and Wealth (UTGROWTH) is focused on empowering the community economically based on small and medium micro businesses that can generate additional income or known as Income Generating Activity (IGA).",
                ),
                const SizedBox(height: 20),
                const SelectionCard(
                  pictureUrl:
                      "assets/UTCARE.jpg",
                  description: "UTCARE",
                  subtitle:
                      "United Tractors for Community Health Responsibility (UTCARE) program is a manifestation of the Company’s dedication to the health sector for all stakeholders. This program targets beneficiaries, especially mothers and children and community members who have difficulty in accessing basic health services.",
                ),
                const SizedBox(height: 20),
                const SelectionCard(
                  pictureUrl:
                      "assets/UTFUTURE.jpg",
                  description: "UTFUTURE",
                  subtitle:
                      "United Tractors for Education and Bright Future (UTFUTURE) is an integrated education program developed by United Tractors to create talented, potential and self-reliant young generation. ",
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:30),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const PermissionLauncherPage()));
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Center(
                                child: Text(
                                  "Dokumen Perizinan",
                                  style: TextStyle(
                                    color: Color(0xFF32A060),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.arrow_right,
                                color: Color(0xFF32A060),
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 120)
              ],
            ),
          ),
        ));
  }
}

class SelectionCard extends StatelessWidget {
  final String pictureUrl;
  final String description;
  final String subtitle;

  const SelectionCard({
    Key? key,
    required this.pictureUrl,
    required this.description,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: const Offset(0, 10),
            blurRadius: 10,
          ),
        ],
      ),
      height: 140,
      width: 350,
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUsDetailPage(title: description, subtitle: subtitle, imagePath: pictureUrl,)));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            pictureUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            description,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            subtitle,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
