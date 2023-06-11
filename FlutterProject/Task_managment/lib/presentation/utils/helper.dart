import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_managment/presentation/screen/sigInScreen.dart';
import 'package:task_managment/presentation/screen/signUpScreen.dart';

import '../widgets/bulid_rounded_bottom.dart';


class Helper {

  static ButtonStyle buildButtonStyle( ) {
    return
      ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(300.0, 50.0)),
        backgroundColor: MaterialStateProperty.all(Colors.purple),
        side: MaterialStateProperty.all(BorderSide(color: Colors.black, width: 4.0)),

    );
  }
  static Future<String> getTokenFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    return token ?? ''; // Return an empty string if token is null
  }


  static GestureDetector buildAlreadyHaveAccountText(  BuildContext context) {
    return GestureDetector(
      onTap: () {

       navigateToNextScreen (context , SignInScreen());
      },
      child: Text(
        'Already have an account? Sign in',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  static void navigateToNextScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  static TextButton buildSignInButton() {
    return TextButton(
      onPressed: () {
        // Perform sign-in logic
      },
      child: Text(
        'Sign In',
        style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'Bitcheese'),
      ),
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(Size(300.0, 50.0)),
        backgroundColor: MaterialStateProperty.all(Colors.purple),
        side: MaterialStateProperty.all(BorderSide(color: Colors.black, width: 4.0)),
      ),
    );
  }

  static GestureDetector buildSignUpText(BuildContext context ) {
    return GestureDetector(
      child: Text(
        'Don’t have an account ? Sign Up',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: () {
        navigateToNextScreen(context, SignUpScreen());

      },
    );
  }
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
  static FloatingActionButton buildFloatingActionButton(BuildContext context, Color color) {
    return

      FloatingActionButton.large(
        child: Icon(Icons.add),
        backgroundColor: color,
        onPressed: () {
          Helper.showToast('New Project Added');
          navigateToNextScreen(context, RoundedBottomSheet());
        },
      );



  }

  static Future<void> setIdProjectSharedPreferences(String projectId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('projectId', projectId);

  }

}