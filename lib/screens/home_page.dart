import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nhzchat/constant.dart';
import 'package:nhzchat/screens/login_page.dart';
import 'package:nhzchat/screens/signup_page.dart';
import '../components/custom_button.dart';
import 'background_decoreation.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundDecoration(),
          Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              children: [
                Hero(
                  tag: 'appIcon',
                  child: Image.asset(
                    'assets/images/app_icon.png',
                    height: 200.0,
                    width: 200.0,
                  ),
                ),
                Center(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontFamily: 'Pacifico',
                      letterSpacing: 2.0
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText(
                          'Welcome To NHZ Chat App',
                          speed: const Duration(milliseconds: 200),
                        ),
                      ],
                      isRepeatingAnimation: false,
                      onTap: () {
                        print("Tap Event");
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 18.0,
                ),
                Hero(
                  tag: 'signupButton',
                  child: CustomButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LogInPage()));
                    },
                    title: "Log In",
                    color: kLightGradiant,
                  ),
                ),
                SizedBox(height: 18.0),
                CustomButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpPage()));
                  },
                  title: "Sign Up",
                  color: kDarkGradiant,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// ElevatedButton(onPressed: (){}, child: Text("Log In",style: TextStyle(
// color: Colors.white,
// fontSize: 26.0,
// ),),
// style: ButtonStyle(
// backgroundColor: MaterialStateProperty.all(Colors.red),
// ),
// ),

// GestureDetector(
// onTap: (){
// print("HHHHHHHHHHH");
// },
// child: Container(
// width: 250.0,
// height: 65.0,
// alignment: Alignment.center,
// child: Text("Log In",style: TextStyle(
// color: Colors.white,
// fontSize: 26.0,
// ),),
// decoration: BoxDecoration(
// gradient: kLightGradiant,
// borderRadius: BorderRadius.circular(100.0),
// boxShadow: [
// BoxShadow(
// color: Colors.black54,
// offset: Offset(5, 5),
// blurRadius: 4.0
// )
// ]
// ),
// ),
// ),
// SizedBox(height: 18.0,),
