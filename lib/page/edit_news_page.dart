import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegetasi_app/model/model_news.dart';
import 'package:vegetasi_app/provider/edit_news.dart';
import 'package:vegetasi_app/provider/edit_photo.dart';

class EditNewsPage extends StatefulWidget {
  final String name;
  final String description;
  final String image;
  final String date;
  final Timestamp time;
  final String id;
  const EditNewsPage(
      {Key? key,
      required this.name,
      required this.description,
      required this.image,
      required this.date,
      required this.time,
      required this.id})
      : super(key: key);

  @override
  State<EditNewsPage> createState() => _EditNewsPageState();
}

class _EditNewsPageState extends State<EditNewsPage> {
  TextEditingController nameEdit = TextEditingController();
  TextEditingController descEdit = TextEditingController();

  @override
  void initState() {
    nameEdit.text = widget.name;
    descEdit.text = widget.description;
    context.read<EditImageUploadProvider>().newImagePath = widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
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
              color: const Color(0XFF32A060),
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
                      "Edit Data",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                        color: Colors.white,
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
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 15), // Adjusted padding value
                  child: TextField(
                    controller: nameEdit,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.white,
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
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      bottom: 15), // Adjusted padding value
                  child: TextField(
                    controller: descEdit,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          width: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                    child: ImageUploadContainer(
                        id: widget.id,
                        image: context
                            .read<EditImageUploadProvider>()
                            .newImagePath)),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: Colors.white, width: 2),
                        backgroundColor: const Color(0XFF32A060),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () async {
                        FirebaseNewsData data = FirebaseNewsData(
                            name: nameEdit.text,
                            date: widget.date,
                            description: descEdit.text,
                            url: context
                                .read<EditImageUploadProvider>()
                                .newImagePath,
                            time: widget.time,
                            id: widget.id);
                        context.read<EditDataNews>().editData(widget.id, data);
                        context.read<EditImageUploadProvider>().clearVariable();
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Simpan',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
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
                },
                icon: const Icon(Icons.arrow_back,color: Color(0XFF32A060) ,)),
          )
        ],
      ),
    );
  }
}

class ImageUploadContainer extends StatelessWidget {
  final String image;
  final String id;
  const ImageUploadContainer(
      {super.key, required this.id, required this.image});

  @override
  Widget build(BuildContext context) {
    final imageUploadProvider = Provider.of<EditImageUploadProvider>(context);
    return Consumer<EditImageUploadProvider>(
      builder: (context, value, child) {
        return InkWell(
          onTap: () {
            _showImageSourceDialog(context, imageUploadProvider);
          },
          child: Container(
            width: 380,
            height: 190,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
            ),
            child: context.read<EditImageUploadProvider>().newImagePath != ''
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      context.read<EditImageUploadProvider>().newImagePath,
                      fit: BoxFit.cover,
                    ),
                  )
                : const Center(
                    child: Text(
                      'Klik untuk menambah foto',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
          ),
        );
      },
    );
  }

  void _showImageSourceDialog(
      BuildContext context, EditImageUploadProvider provider) {
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
                    provider.pickImageFromGallery(context, id);
                  },
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  child: const Text('Kamera'),
                  onTap: () {
                    Navigator.of(dialogContext).pop();
                    provider.captureImageFromCamera(context, id);
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
