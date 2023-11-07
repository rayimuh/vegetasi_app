import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegetasi_app/model/model_news.dart';
import 'package:vegetasi_app/provider/add_news.dart';
import 'package:vegetasi_app/provider/count_data.dart';
import 'package:vegetasi_app/provider/upload_photo.dart';

class AddNewsPage extends StatelessWidget {
  const AddNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController nameAdd = TextEditingController();
    TextEditingController descAdd = TextEditingController();
    String dateAdd =
        "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0XFF32A060),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: double.infinity,
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
                bottomLeft: Radius.elliptical(200, 100),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Add Data",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Color(0XFF32A060),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Nama",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0XFF32A060),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 15), // Adjusted padding value
                  child: TextField(
                    controller: nameAdd,
                    style: const TextStyle(
                      color: Color(0XFF32A060),
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color(0XFF32A060),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color(0XFF32A060),
                        ),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Deskripsi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Color(0XFF32A060),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 15), // Adjusted padding value
                  child: TextField(
                    controller: descAdd,
                    style: const TextStyle(
                      color: Color(0XFF32A060),
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color(0XFF32A060),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Color(0XFF32A060),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Center(child: ImageUploadContainer()),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(
                            color: Color(0XFF32A060), width: 2),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        FirebaseNewsData data = FirebaseNewsData(
                            name: nameAdd.text,
                            date: dateAdd,
                            description: descAdd.text,
                            url: context.read<ImageUploadProvider>().imagePath,
                            time: Timestamp.now(),
                            id: "Update No. ${context.read<CountDataProvider>().id}");
                        context.read<AddDataNews>().addData(data,
                            "Update No. ${context.read<CountDataProvider>().id}");
                        context.read<CountDataProvider>().countData();
                        context.read<ImageUploadProvider>().clearVariable();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Tambah',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0XFF32A060),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                  context.read<ImageUploadProvider>().clearVariable();
                },
                icon: const Icon(Icons.arrow_back,color: Colors.white,)),
          )
        ],
      ),
    );
  }
}

class ImageUploadContainer extends StatelessWidget {
  const ImageUploadContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUploadProvider = Provider.of<ImageUploadProvider>(context);
    final countDataProvider = Provider.of<CountDataProvider>(context);

    return InkWell(
      onTap: () {
        _showImageSourceDialog(
            context, imageUploadProvider, "Update No. ${countDataProvider.id}");
      },
      child: Container(
        width: 380,
        height: 190,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: const Color(0XFF32A060),
          ),
        ),
        child: imageUploadProvider.imagePath != ''
            ? ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUploadProvider.imagePath,
                  fit: BoxFit.cover,
                ),
              )
            : const Center(
                child: Text(
                  'Klik untuk menambah foto',
                  style: TextStyle(
                    color: Color(0XFF32A060),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
      ),
    );
  }

  void _showImageSourceDialog(
      BuildContext context, ImageUploadProvider provider, String name) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Pilih Sumber Gambar'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('Galeri'),
                  onTap: () {
                    Navigator.of(dialogContext).pop();
                    provider.pickImageFromGallery(context, name);
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  child: const Text('Kamera'),
                  onTap: () {
                    Navigator.of(dialogContext).pop();
                    provider.captureImageFromCamera(context, name);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
