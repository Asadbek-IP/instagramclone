import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0.1,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "Search",
            style: TextStyle(
                fontSize: 40, fontFamily: "Billabong", color: Colors.black),
          )),
      body:Column(
        children: [
          Container(
            margin: const EdgeInsets.all(16),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.4),
            ),
            width: double.infinity,
            child:  const TextField(
               
              decoration:  InputDecoration(
                contentPadding: EdgeInsets.all(12),
                border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey)
              ),
            ),
          ),
          Expanded(child: ListView.builder(itemBuilder: ( (context, index) => _itemOfProfile()))),
        ],
      )
    );
  }
}

Widget _itemOfProfile(){
  return Container(
    margin: const EdgeInsets.all(8),
 child:  Row(
  children:  [
   const CircleAvatar(
    backgroundColor: Colors.purple,
    radius:27,
    child: CircleAvatar(
      backgroundColor: Colors.white,
      radius: 25,
      child: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage("assets/images/profile_img.png"),),
    ),
   ),
  const SizedBox(width: 16,),
  Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text("Asadbek",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
      SizedBox(height: 5,),
      Text("dasturchi6678@gmail.com")
    ],
  ),
  const SizedBox(width: 16,),
 OutlinedButton(onPressed: (){}, child: const Text("Follow"))

  ],
 ),
  );
}
