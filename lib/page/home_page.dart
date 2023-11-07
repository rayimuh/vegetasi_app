import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vegetasi_app/model/model_news.dart';
import 'package:vegetasi_app/page/edit_news_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: const Offset(0, 15),
                        blurRadius: 8,
                      ),
                    ],
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.elliptical(250, 50),
                      bottomRight: Radius.elliptical(250, 50),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 65,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Update Project",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: Color(0XFF32A060),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              reverse = !reverse;
                            });
                          },
                          icon: const Icon(
                            Icons.sort,
                            color: Color(0XFF32A060),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection("news")
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final List<QueryDocumentSnapshot> documents =
                              snapshot.data!.docs;
                          return ListView.builder(
                            reverse: reverse,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: documents.length,
                            itemBuilder: (context, index) {
                              final data = documents[index].data()
                                  as Map<String, dynamic>;
                              final newsData = FirebaseNewsData.fromMap(data);
                              return Wrap(
                                  alignment: WrapAlignment.center,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: UpdateCard(
                                        name: newsData.name,
                                        date: newsData.date,
                                        description: newsData.description,
                                        photoUrl: newsData.url,
                                        time: newsData.time,
                                        id: newsData.id,
                                      ),
                                    ),
                                  ]);
                            },
                          );
                        } else if (snapshot.hasError) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UpdateCard extends StatelessWidget {
  final String name;
  final String date;
  final String description;
  final String photoUrl;
  final Timestamp time;
  final String id;

  const UpdateCard({
    Key? key,
    required this.name,
    required this.date,
    required this.description,
    required this.photoUrl,
    required this.time,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 280,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => EditNewsPage(
                      name: name,
                      description: description,
                      image: photoUrl,
                      date: date,
                      time: time,
                      id: id)));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          elevation: 0.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      date,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: photoUrl != ""
                      ? Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            image: DecorationImage(
                              image: NetworkImage(photoUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      : const Center(
                          child: Text(
                            'Belum ada foto',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
