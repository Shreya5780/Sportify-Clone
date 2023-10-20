import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sportify/screens/app.dart';
import 'package:sportify/screens/signup.dart';
import 'package:get/get.dart';
import 'package:sportify/screens/firebase/auth_conf.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white, // Text color
            fontSize: 24, // Text size
            fontWeight: FontWeight.bold, // Text font weight
            fontFamily: 'FontStyle.italic', // Your custom font family
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 94, 7, 83), // Background color
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20),
            Image.asset(
              "images/b.jpg",
              width: 300,
              height: 150,
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: _emailTextController,
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Color.fromARGB(255, 94, 7, 83)),
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
              onPressed: () {
                AuthController.instance.login(
                  _emailTextController.text.trim(),
                  _passwordTextController.text.trim(),
                );
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
                'Sign In',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 253, 253, 253),
                ),
              ),
            ),
            SizedBox(height: 110),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 94, 7, 83),
                  ),
                ),
                SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    ' Sign Up',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 118, 11, 105),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
