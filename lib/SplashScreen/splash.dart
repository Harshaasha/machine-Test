import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mainScreen.dart';




void main(){
  runApp(MaterialApp(home: Splashscreen(

  )
  ),);
}
class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    Timer(Duration(seconds: 5), (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Mainscreen()));

    });

  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        child: Center(
          child:
            Text("MainScreen"),
          // Image(image: AssetImage(""),
          //   height: double.infinity,width: double.infinity,
          ),
        ),
      );

  }
}