import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

import '../model/post_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Post> posts = [];

  final String _image_url1 =
      "https://images.unsplash.com/photo-1673377006564-45c061e6cbe3?";
  final String _image_url2 =
      "https://images.unsplash.com/photo-1673364725341-7cd9a8332bd7?";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    posts.add(
      Post(_image_url1, "Ajoyib bahor fasli daxshat"),
    );
    posts.add(Post(_image_url2, "Toylar muborak daxshat"));
    posts.add(
      Post(_image_url1, "Ajoyib bahor fasli daxshat"),
    );
    posts.add(Post(_image_url2, "Toylar muborak daxshat"));
    posts.add(Post(
        "https://npr.brightspotcdn.com/dims4/default/0f6c110/2147483647/strip/true/crop/1885x1414+0+0/resize/880x660!/quality/90/?url=https%3A%2F%2Fmedia.npr.org%2Fassets%2Fimg%2F2022%2F05%2F31%2Fscreen-shot-2022-05-31-at-8.32.41-am-90976307d1d0c1408fd60a67e511f8e832db778c.png",
        "Toylar muborak daxshat"));
    posts.add(Post(_image_url2, "Toylar muborak daxshat"));
  }

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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              elevation: 0.1,
              backgroundColor: Colors.white,
              centerTitle: true,
              title: const Text(
                "Profile",
                style: TextStyle(
                    fontSize: 40, fontFamily: "Billabong", color: Colors.black),
              )),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.purple,
                      radius: 45,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 43,
                        child: _image == null
                            ? CircleAvatar(
                                radius: 42,
                                backgroundImage:
                                    AssetImage("assets/images/profile_img.png"),
                              )
                            : CircleAvatar(
                                radius: 42,
                                backgroundImage: FileImage(_image!)),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                        radius: 14,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            _showPic();
                          },
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Asadbek",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("dasturchi6678@gmail.com"),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Column(
                        children: const [
                          Text(
                            "675",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "POSTS",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 1.5,
                      height: 25,
                      color: Colors.grey.shade400,
                    ),
                    Expanded(
                      child: Column(
                        children: const [
                          Text(
                            "4,562",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "FOLLOWERS",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 1.5,
                      height: 25,
                      color: Colors.grey.shade400,
                    ),
                    Expanded(
                      child: Column(
                        children: const [
                          Text(
                            "200",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "FOLLOWING",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const TabBar(
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 2.0),
                        insets: EdgeInsets.symmetric(horizontal: 30.0)),
                    indicatorColor: Colors.black,
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.table_rows,
                          color: Colors.black,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.apps,
                          color: Colors.black,
                        ),
                      ),
                    ]),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: TabBarView(children: [
                    Container(
                      child: ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) => _itemOfPost(context,
                            posts[index].image_url, posts[index].caption!),
                      ),
                    ),
                    Container(
                      child: GridView.builder(
                          itemCount: posts.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (context, index) => _itemOfPost2(context,
                              posts[index].image_url, posts[index].caption!)),
                    )
                  ]),
                ),
              ],
            ),
          )),
    );
  }
}

Widget _itemOfPost(BuildContext context, String imgUrl, String caption) {
  return Column(
    children: [
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 2 / 3,
        margin: const EdgeInsets.all(8),
        color: Colors.grey.withOpacity(0.3),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imgUrl,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * 2 / 3,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Text(caption),
    ],
  );
}

Widget _itemOfPost2(BuildContext context, String imgUrl, String caption) {
  return Column(
    children: [
      Container(
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.width * 0.4,
        color: Colors.grey.withOpacity(0.3),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imgUrl,
          placeholder: (context, url) => Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.5),
            highlightColor: Colors.grey.shade100,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.5,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      Text(caption),
    ],
  );
}
