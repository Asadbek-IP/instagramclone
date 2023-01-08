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

  _showGallery()async{

      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      if(file==null) return;
      setState(() {
        _image = File(file.path);
      });
      Navigator.pop(context);
  }

  _showCamera()async{
      
      final XFile? file = await _picker.pickImage(source: ImageSource.camera);
      if(file==null) return;
      setState(() {
        _image = File(file.path);
      });
      
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
                  leading: Icon(Icons.photo_library),
                  title: Text("Pick Photo"),
                ),
                ListTile(
                  onTap: () {
                    _showCamera();
                  },
                  leading: Icon(Icons.camera_alt_outlined),
                  title: Text("Take Photo"),
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
                child: Container(
                  color: Colors.grey.shade400,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  child: const Icon(
                    Icons.add_a_photo,
                    color: Color.fromARGB(255, 153, 153, 153),
                    size: 50,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
