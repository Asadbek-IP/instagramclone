import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:instagramclone/model/post_model.dart';
import 'package:shimmer/shimmer.dart';

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    EvaIcons.camera,
                    color: Colors.black,
                    size: 30,
                  ))
            ],
            elevation: 0.1,
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "Instagram",
              style: TextStyle(
                  fontSize: 40, fontFamily: "Billabong", color: Colors.black),
            )),
        body: ListView.separated(
            itemBuilder: (context, index) => _itemPost(
                context, posts[index].image_url, posts[index].caption!),
            separatorBuilder: (context, index) => const Divider(
                  thickness: 0.8,
                ),
            itemCount: posts.length));
  }
}

Widget _itemPost(BuildContext context, String imgUrl, String caption) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile_img.png"),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                SizedBox(
                  height: 5,
                ),
                Text(
                  "User Name",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                Text(
                  "11-yanvar 2023",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  EvaIcons.moreHorizontal,
                  size: 30,
                ))
          ],
        ),
      ),
      SizedBox(
        height: 5,
      ),
      Container(
        color: Colors.grey.withOpacity(0.3),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 2 / 3,
        child: CachedNetworkImage(
          imageUrl: imgUrl,
          placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.5),
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 2 / 3,
                color: Colors.grey,
              )),
        ),
      ),
      Row(
        children: [
          IconButton(
              padding: EdgeInsets.only(left: 5),
              onPressed: () {},
              icon: const Icon(
                EvaIcons.heartOutline,
                size: 25,
              )),
          IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                EvaIcons.paperPlane,
                size: 25,
              ))
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          caption,
          style: const TextStyle(fontSize: 16),
        ),
      ),
      SizedBox(
        height: 10,
      )
    ],
  );
}
