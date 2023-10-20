import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportify/screens/signin.dart';
import 'package:get/get.dart';
import 'package:sportify/screens/firebase/auth_conf.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _userNameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white, // Text color
            fontSize: 24, // Text size
            fontWeight: FontWeight.bold, // Text font weight
            fontFamily: 'FontStyle.italic', // Your custom font family
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 94, 7, 83),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Image.asset(
              "images/b.jpg",
              width: 300,
              height: 150,
            ),
            SizedBox(height: 40),
            TextFormField(
              controller: _emailTextController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle:
                    TextStyle(color: const Color.fromARGB(255, 94, 7, 83)),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color.fromARGB(255, 94, 7, 83),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(
                          255, 94, 7, 83)), // Border color when not focused
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(
                          255, 94, 7, 83)), // Border color when focused
                ),
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: _passwordTextController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Color.fromARGB(255, 94, 7, 83)),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color.fromARGB(255, 94, 7, 83),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(
                          255, 94, 7, 83)), // Border color when not focused
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color.fromARGB(
                          255, 94, 7, 83)), // Border color when focused
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                AuthController.instance.register(
                    _emailTextController.text.trim(),
                    _passwordTextController.text.trim());
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 94, 7, 83)), // Button background color
                padding: MaterialStateProperty.all(
                    EdgeInsets.all(14)), // Adjust padding as needed
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        5), // Adjust border radius as needed
                  ),
                ),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(253, 253, 253, 1),
                ),
              ),
            ),
            SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
