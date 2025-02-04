import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:nhzchat/constant.dart';
import 'package:nhzchat/screens/background_decoreation.dart';
import '../components/cusom_text_field.dart';
import '../components/custom_neon_text.dart';

class ForgetPasswordPage extends StatefulWidget {
  ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  TextEditingController emailController = TextEditingController();

  bool isClicked  = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundDecoration(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Hero(
                      tag: 'appIcon',
                      child: Image.asset(
                        'assets/images/app_icon.png',
                        height: 100.0,
                        width: 100.0,
                      ),
                    ),
                    CustomNeonText(title: 'Forget Password',),
                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
                CustomTextFormFeild(
                  controller: emailController,
                  title: "Email",
                ),
                SizedBox(
                  height: 18.0,
                ),
                GestureDetector(
                  onTap: isClicked ?  null  : (){
                    emailController.clear();
                    setState(() {
                      isClicked =!isClicked;
                    });
                  },
                  child: AnimatedContainer(
                    duration: Duration(
                      milliseconds: 600,
                    ),
                    padding: EdgeInsets.all(18.0),
                    width: isClicked ? 180.0 : 130.0,
                    decoration: BoxDecoration(
                        gradient: isClicked ? LinearGradient(colors: [
                          Colors.green,
                          Colors.green.shade400
                        ])  : kDarkGradiant,
                        borderRadius: BorderRadius.circular(100.0),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(5, 5),
                              blurRadius: 4.0
                          )
                        ]
                    ),
                    alignment: Alignment.center,
                    child: isClicked ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(   'Sent !',style: TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                        ),),
                        Icon(Icons.check,
                        color: Colors.white,
                          size: 26.0,
                        )
                      ],
                    )




                        :  Text(   'Send',style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                    ),),
                  ),
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
