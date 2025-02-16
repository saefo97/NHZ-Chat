import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';

class CustomTextFormFeild extends StatefulWidget {
  final String title;
  bool isPassword;
  String? Function(String?)? validator;
  CustomTextFormFeild(
      {super.key,
      required this.controller,
      required this.title,
        this.validator,
        this.isPassword = false});

  final TextEditingController controller;

  @override
  State<CustomTextFormFeild> createState() => _CustomTextFormFeildState();
}

class _CustomTextFormFeildState extends State<CustomTextFormFeild> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      obscureText: !isVisible,
      decoration: InputDecoration(
        // fillColor: Colors.red,
        // filled: true
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.blue.shade600,
            )),

        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.blue.shade800,
              width: 2.5,
            )),
        label: Text(
          widget.title,
          style: TextStyle(color: Colors.black),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: isVisible
                    ? NeonIcon(icon: Icons.visibility,)
                    : NeonIcon(icon: Icons.visibility_off,),
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                  print(isVisible);
                },
              )
            : null,
      ),
    );
  }
}

class NeonIcon extends StatelessWidget {
  final IconData icon;
  NeonIcon({
    required this.icon
  });

  @override
  Widget build(BuildContext context) {
    return NeonContainer(
                      spreadColor: Colors.blue.shade400,
                      lightSpreadRadius: 1.0,
                      lightBlurRadius: 6.0,
                      borderWidth: 1.0,
    containerColor: Colors.transparent,
    borderRadius: BorderRadius.circular(200.0),
    borderColor: Colors.blue.shade800,
    child: Icon(icon,
    color: Colors.blue.shade800,
    ));
  }
}

// suffixIcon: widget.isPassword
// ? IconButton(
// icon: isVisible
// ? Icon(Icons.visibility)
//     : Icon(Icons.visibility_off),
// onPressed: () {
// setState(() {
// isVisible = !isVisible;
// });
// print(isVisible);
// },
// )
// : null,