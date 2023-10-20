
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportify/screens/app.dart';
import 'package:sportify/screens/home.dart';
import 'package:sportify/screens/signin.dart';
import 'package:sportify/screens/signup.dart';

//we can use auth_conf.dart to navigate diffrent pages
class AuthController extends GetxController { 
  //create instance of authcontroller
  static AuthController instance = Get.find();
  //declare firebase data model which is come from firebase
   late Rx<User?> _user;
   FirebaseAuth auth = FirebaseAuth.instance;

   @override
   void onReady(){
    super.onReady();
    //try to get corrent user and send it to _user
    _user = Rx<User?>(auth.currentUser); 

// user would be notify when user change(email, pass)
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);//listener 
    //ever(listener, (callback) => null)
   }


//after successfully login redirect to the home page
_initialScreen(User? user){
  if(user==null){
    print("login page");
    Get.offAll(()=> const SignInScreen());//user are not there => go for login 
  }
  else{
    if (user.email != null) {
      Get.offAll(() => MyApp()); // User => go to home
    } else {
      print("User email is null");
    }
    //Get.offAll(()=> Home(email: user.email));//user => go to home 
    //we already login => at home page provide that user detal
  }
}

//get the current user who is logged in
 String? getCurrentUserEmail() {
    final User? user = _user.value;
    return user?.email;
  }

//manage the reg
void register(String email, password) async {
  try{
   await auth.createUserWithEmailAndPassword(email: email, password: password);
  }
  catch(e){
    Get.snackbar("About user", "User message",
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    titleText: const Text(
      "Account creation failed",
      style: TextStyle(
        color: Colors.white
      ),
    ),
    messageText: Text(
      e.toString(),
      style: const TextStyle(
        color: Colors.white
      ),
    ),
    
    );
  }
}

//manage login
void login(String email, password) async {
  try{
   await auth.signInWithEmailAndPassword(email: email, password: password);
  }
  catch(e){
    Get.snackbar("About login", "login message",
    backgroundColor: Colors.redAccent,
    snackPosition: SnackPosition.BOTTOM,
    titleText: const Text(
      "Login failed",
      style: TextStyle(
        color: Colors.white
      ),
    ),
    messageText: Text(
      e.toString(),
      style: const TextStyle(
        color: Colors.white
      ),
    ),
    
    );
  }
}

//manage logout
void logout() async {
  await auth.signOut();
}

}