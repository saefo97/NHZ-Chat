import 'package:flutter/material.dart';

LinearGradient kLightGradiant = LinearGradient(
  colors: [
    Colors.blue.shade300,
    Colors.blue.shade500,
  ],
  transform: GradientRotation(90),
);
LinearGradient kDarkGradiant = LinearGradient(colors: [
  Colors.blue.shade700,
  Colors.blue.shade900,
], transform: GradientRotation(90));