import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nhzchat/constant.dart';
import 'package:nhzchat/screens/login_page.dart';
import 'package:nhzchat/screens/signup_page.dart';
import '../components/custom_button.dart';
import 'background_decoreation.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? colorTween;
  Animation<Offset>? imageAnimation;
  Animation<double>? fadeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    colorTween = ColorTween(
      begin: Colors.blue,
      end: ThemeData().scaffoldBackgroundColor,
    ).animate(controller!);

    imageAnimation = Tween<Offset>(
      begin: Offset(-1.5, -1.5),
      end: Offset(0.0, 0.0),
    ).animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller!, curve: Curves.easeIn));

    controller!.forward();
    controller!.addListener(
      () {
        setState(() {});
      },
    );
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorTween!.value,
      body: Stack(
        children: [
          BackGroundDecoration(),
          Center(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              children: [
                FadeTransition(
                  opacity: fadeAnimation!,
                  child: SlideTransition(
                    position: imageAnimation!,
                    child: Hero(
                      tag: 'appIcon',
                      child: Image.asset(
                        'assets/images/app_icon.png',
                        height: 200.0,
                        width: 200.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: DefaultTextStyle(
                    style: const TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontFamily: 'Pacifico',
                        letterSpacing: 2.0),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        WavyAnimatedText(
                          'Welcome To NHZ Chat App',
                          speed: const Duration(milliseconds: 200),
                        ),
                      ],
                      isRepeatingAnimation: false,
                    ),
                  ),
                ),
                SizedBox(height: 18.0),
                Hero(
                  tag: 'signupButton',
                  child: CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LogInPage()),
                      );
                    },
                    title: "Log In",
                    color: kLightGradiant,
                  ),
                ),
                SizedBox(height: 18.0),
                CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  title: "Sign Up",
                  color: kDarkGradiant,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
