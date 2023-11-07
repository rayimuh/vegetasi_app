import 'package:flutter/material.dart';
import 'package:vegetasi_app/page/drive_web_page.dart';
import 'package:vegetasi_app/page/earth_web_page.dart';

class MapSelectionPage extends StatefulWidget {
  const MapSelectionPage({Key? key}) : super(key: key);

  @override
  State<MapSelectionPage> createState() => _MapSelectionPageState();
}

class _MapSelectionPageState extends State<MapSelectionPage> {
  bool reverse = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0XFF32A060),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SelectionCard(
                  picture: AssetImage("assets/KML.png"),
                  description: "Pilih KML",
                  page: DriveLauncherPage(),
                ),
                SizedBox(height: 40),
                SelectionCard(
                  picture: AssetImage("assets/Google Map.png"),
                  description: "Buka Map",
                  page: EarthLauncherPage(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SelectionCard extends StatelessWidget {
  final AssetImage picture;
  final String description;
  final Widget page;

  const SelectionCard(
      {Key? key,
      required this.picture,
      required this.description,
      required this.page})
      : super(key: key);

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
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image(
                    image: picture,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        description,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Color(0XFF32A060)),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ), 
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
