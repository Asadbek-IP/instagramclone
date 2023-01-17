import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagramclone/pages/like_page.dart';
import 'package:instagramclone/pages/post_page.dart';
import 'package:instagramclone/pages/profile_page.dart';
import 'package:instagramclone/pages/search_page.dart';
import 'package:instagramclone/pages/upload_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _hozirgiIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CupertinoTabBar(
            onTap: (index) {
              setState(() {
                _hozirgiIndex = index;
              });
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 200), curve: Curves.linear);
            },
            currentIndex: _hozirgiIndex,
            activeColor: const Color(0xfff833ab4),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.search), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.add_box), label: ""),
              BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle_sharp), label: ""),
            ]),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _hozirgiIndex = index;
            });
          },
          controller: _pageController,
          children:  [
            PostPage(pageController: _pageController,),
            SearchPage(),
            UploadPage(pageController: _pageController,),
            LikePage(),
            ProfilePage()
          ],
        ));
  }
}
