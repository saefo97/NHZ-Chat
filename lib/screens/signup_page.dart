import 'package:flutter/material.dart';
import 'package:nhzchat/constant.dart';
import '../components/cusom_text_field.dart';
import '../components/custom_button.dart';
import '../components/custom_neon_text.dart';
import 'background_decoreation.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
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
                    CustomNeonText(title: 'Sign Up',),

                  ],
                ),
                SizedBox(
                  height: 18.0,
                ),
                CustomTextFormFeild(
                  controller: nameController,
                  title: "Name",
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

                CustomTextFormFeild(
                  controller: passwordController,
                  title: "Password",
                  isPassword: true,
                ),
                SizedBox(
                  height: 18.0,
                ),               CustomTextFormFeild(
                  controller: confirmPasswordController,
                  title: "Confirn Password",
                  isPassword: true,
                ),
                SizedBox(
                  height: 18.0,
                ),
                Hero(
                  tag: 'signupButton',
                  child: CustomButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    title: "Sign Up",
                    color: kDarkGradiant,
                  ),
                )
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
