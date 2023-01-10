import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final ImagePicker _picker = ImagePicker();
  File? _image;

  _showGallery() async {
    final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
    if (file == null) return;
    setState(() {
      _image = File(file.path);
    });
    Navigator.pop(context);
  }

  _showCamera() async {
    try {
      final XFile? file =
          await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      setState(() {
        _image = File(file!.path);
      });
    } catch (error) {
      print(error);
    }
    Navigator.of(context).pop();
  }

  _showPic() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    _showGallery();
                  },
                  leading: const Icon(Icons.photo_library),
                  title: const Text("Pick Photo"),
                ),
                ListTile(
                  onTap: () {
                    _showCamera();
                  },
                  leading: const Icon(Icons.camera_alt_outlined),
                  title: const Text("Take Photo"),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_photo_alternate,
                  color: Color(0xfff833ab4),
                ))
          ],
          centerTitle: true,
          title: const Text(
            "Upload",
            style: TextStyle(
                color: Colors.black, fontSize: 35, fontFamily: "Billabong"),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  _showPic();
                },
                child: Stack(
                  children: [
                    Container(
                      color: Colors.grey.shade400,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      child: _image == null
                          ? const Icon(
                              Icons.add_a_photo,
                              color: Color.fromARGB(255, 153, 153, 153),
                              size: 50,
                            )
                          : Image(
                              image: FileImage(_image!),
                              fit: BoxFit.cover,
                            ),
                    ),
                    _image != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.black,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _image = null;
                                      });
                                    },
                                    icon: const Icon(Icons.close),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
              
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  minLines:1,
                  maxLines: 5,
                decoration: InputDecoration(
                 
                  hintText: "Caption"
                ),
                ),
              ),
            
            ],
          ),
        ));
  }
}
