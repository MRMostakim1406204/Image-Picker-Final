import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _imageFile;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Imagr Picker"),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 100,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: const Color(0xffEBDDFF),
                  elevation: 10,
                  child: IconButton(
                      onPressed: () async {
                        final pickedFile =
                            await _picker.pickImage(source: ImageSource.camera);
                        if (pickedFile != null) {
                          setState(() {
                            _imageFile = File(pickedFile.path);
                          });
                        }
                      },
                      icon: const Icon(Icons.photo_camera)),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: const Color(0xffEBDDFF),
                  elevation: 10,
                  child: IconButton(
                      onPressed: () async {
                        final pickedFile = await _picker.pickImage(
                            source: ImageSource.gallery);
                        if (pickedFile != null) {
                          setState(() {
                            _imageFile = File(pickedFile.path);
                          });
                        }
                      },
                      icon: const Icon(Icons.photo)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          if (_imageFile == null)
            const Center(
              child: Text("Click CAmera or Gallery Button",
                  style: TextStyle(fontWeight: FontWeight.bold)),
            )
          else
            Padding(
              padding: const EdgeInsets.all(30),
              child: Image.file(_imageFile!),
            )
        ],
      ),
    );
  }
}
