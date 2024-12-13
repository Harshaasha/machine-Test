import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: BottomnavigationBar(),));
}

class BottomnavigationBar extends StatefulWidget {
  const BottomnavigationBar({super.key});

  @override
  State<BottomnavigationBar> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<BottomnavigationBar> {
  int index=1;
  var screen=[
    Text("Home"),
    Text("Images"),
    Text("Settings"),

  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Screens"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (tapindex){
            setState(() {
              index=tapindex;
            });
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.black,
           type: BottomNavigationBarType.fixed,

          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home",),
            BottomNavigationBarItem(icon: Icon(Icons.image,),label: "Images",),
            BottomNavigationBarItem(icon: Icon(Icons.settings,),label: "Settings",),

          ]),
      body: Center(child: screen[index],),
    );
  }
}

