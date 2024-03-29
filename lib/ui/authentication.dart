import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_crud/net/flutterfire.dart';
import 'package:flutter_crud/ui/home_view.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : Container(
        width : MediaQuery.of(context).size.width,
        height : MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color : Colors.blueAccent,
        ),
        child : Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(
                  style : TextStyle(color: Colors.white),
                  controller: _emailField,
                  decoration: InputDecoration(
                    hintText : "something@gmail.com",
                    hintStyle: TextStyle(
                      color : Colors.white),
                    labelText: "Email",
                    labelStyle: TextStyle(
                      color : Colors.white,
                    )
                  ),
                ),
              ),

              SizedBox(height : MediaQuery.of(context).size.height / 35),
              Container(
                width: MediaQuery.of(context).size.width / 1.3,
                child: TextFormField(        
                    style : TextStyle(color: Colors.white),
                    controller: _passwordField,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText : "password@***12",
                      hintStyle: TextStyle(
                        color : Colors.white),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color : Colors.white,
                      )
                    ),
                  ),
              ),
              SizedBox(height : MediaQuery.of(context).size.height / 35),
              Container(
                  width : MediaQuery.of(context).size.width / 1.4,
                  height : 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color : Colors.white,
                  ),
                  child : MaterialButton(onPressed: () async {
                    bool shouldNavigate = await register(_emailField.text, _passwordField.text);
                    if(shouldNavigate) {
                      // ? Navigate
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView(),
                      ),
                      );
                    }
                  },
                  child : Text("Register"),
                  ),
                ),
              SizedBox(height : MediaQuery.of(context).size.height / 35),
              Container(
                  width : MediaQuery.of(context).size.width / 1.4,
                  height : 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color : Colors.white,
                  ),
                  child : MaterialButton(onPressed: () async {
                    bool shouldNavigate = await signIn(_emailField.text, _passwordField.text) ;
                    if(shouldNavigate) {
                      // ? Navigate
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView(),
                      ),
                      );
                    }
                  },
                  child : Text("Login"),
                  ),
                ),
              
            ],
          ),
        )
      ),
    );
  }
}