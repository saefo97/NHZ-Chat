import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';
import 'package:nhzchat/constant.dart';
import 'package:nhzchat/screens/chat_page.dart';
import 'package:nhzchat/screens/forget_password.dart';
import '../auth_service.dart';
import '../components/cusom_text_field.dart';
import '../components/custom_button.dart';
import '../components/custom_neon_text.dart';
import '../components/loading_screen.dart';
import 'background_decoreation.dart';

class LogInPage extends StatefulWidget {
  LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final AuthService _authService = AuthService();

  bool isLoading = false;

  void _signIn(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });
      String? errorMessage = await _authService.signIn(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (errorMessage == null) {
        setState(() {
          isLoading = false;
        });
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ChatScreen()),(route) => false,
        );
      } else {
        setState(() {
          isLoading = false;
        });
        _showErrorMessage(errorMessage,context);
      }
    }
  }

  void _showErrorMessage(String message,BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading? LoadingScreen() :  Scaffold(
      body: Form(
        key: _formKey,
        child: Stack(
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
                      SizedBox(width: 36.0,),
                      CustomNeonText(title: 'Log In',),

                    ],
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  CustomTextFormFeild(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: emailController,
                    title: "Email",
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  CustomTextFormFeild(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your Password';
                      }else if(value.length < 6){
                        return 'Weak Password';

                      }
                      return null;
                    },
                    controller: passwordController,
                    title: "Password",
                    isPassword: true,
                  ),
                  Align(
                    alignment: FractionalOffset.centerRight,
                    child: TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordPage()));
                    }, child:
                    NeonText(

                        spreadColor: Colors.blue.shade900,
                        blurRadius: 30,
                        textColor: Colors.blue.shade400,

                        text: 'Forget Password?'),),
                  ),
                  SizedBox(
                    height: 18.0,
                  ),
                  Hero(
                    tag: 'logInButton',
                    child: CustomButton(
                      onPressed: () => _signIn(context),
                      title: "Log In",
                      color: kLightGradiant,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
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
