import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late SharedPreferences data;
  String? userName;

  @override
  void initState() {
    super.initState();
    fetchdata();
  }

  void fetchdata() async {
    data = await SharedPreferences.getInstance();
    setState(() {
      userName = data.getString("username") ?? "User";
      print(userName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("HOME PAGE",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            SizedBox(height: 40,),
            Text("Welcome, $userName!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                data.setBool('new_user', true);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Loginpage()),
                );
              },
              child: Text("Logout",style: TextStyle(color: Colors.black,),),
            ),
          ],
        ),
      ),
    );
  }
}