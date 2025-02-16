import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue.shade600,
          Colors.blue.shade900,
        ],transform: GradientRotation(90)),
      ),
      child: SpinKitFadingCircle(
        size: 80,
        color: Colors.white,
      ),
    );
  }
}
