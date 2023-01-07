import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'sign_in.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const SignIn()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xfffc13583), Color(0xfff833ab4)],
          ),
        ),
        child: Column(
          children: const [
            Expanded(
              child: Center(
                child: Text(
                  "Instagram", 
                  style: TextStyle(fontSize: 46,color: Colors.white,fontFamily: "Billabong"),
                ),
              ),
            ),
            Text("All right reserved",style: TextStyle(color: Colors.white,fontSize: 16),),
            SizedBox(height: 15,)
          ],
        ),
      ),
    );
  }
}
