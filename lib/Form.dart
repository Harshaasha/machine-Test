import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'homepage.dart';



void main(){
  runApp(MaterialApp(
    home: Form(),
    debugShowCheckedModeBanner: false,));
}


class Form extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<Form> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(color: Colors.white,
        child:
        Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Fill The Form",
              style: TextStyle(fontSize: 40, color: Colors.blue,
                  fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, top: 70, right: 70),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "Name",
                labelText: "Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50, top: 70, right: 70),
            child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: "EMAIL",
                  labelText: "EMAIL",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                validator: (username) {
                  if (username!.isEmpty || !username.contains("@") ||
                      !username.contains('.')) {
                    return "Enter valid Email";
                  } else {
                    return null;
                  }
                }),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 40, top: 70, right: 70),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: "Password",
                labelText: "Password",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),

          SizedBox(height: 30),
          Padding(padding: const EdgeInsets.only(left: 50, right: 70),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[200],
              ),
              onPressed: () {
                var formkey;
                var valid = formkey.currentState!.validate();
                if (valid) {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Homepage()));
                }

              },
              child: Text("submit"),
            ),
          ),

        ],
        ),
      ),

    );
  }
}