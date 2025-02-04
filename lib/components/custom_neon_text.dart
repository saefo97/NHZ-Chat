import 'package:flutter/material.dart';
import 'package:neon_widgets/neon_widgets.dart';

class CustomNeonText extends StatelessWidget {

  final String title;

  const CustomNeonText({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return NeonText(
      text: title,
      spreadColor: Colors.blue.shade900,
      blurRadius: 30,
      textSize: 28.0,
      textColor: Colors.blue.shade400,
    );
  }
}