import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.title, required this.color,
  });

  final void Function()? onPressed;
  final String title;
  final LinearGradient color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: color,
          borderRadius: BorderRadius.circular(100.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                offset: Offset(5, 5),
                blurRadius: 4.0
            )
          ]
      ),
      child: MaterialButton(onPressed: onPressed,
        color: Colors.transparent,
        elevation: 0.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100.0))),
        height: 65,
        minWidth: 250.0,
        child: Text(title,style: TextStyle(
          color: Colors.white,
          fontSize: 26.0,
        ),),

      ),
    );
  }
}