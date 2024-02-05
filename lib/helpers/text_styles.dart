import 'package:flutter/material.dart';

class AppTextStyle {
  static title() {
    return const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w800, color: Colors.black);
  }

  static titleLight() {
    return const TextStyle(
        fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white);
  }

  static body() {
    return const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black);
  }

  static bodyLight() {
    return const TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white);
  }

  static label() {
    return const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black);
  }

  staticLabelLight() {
    return const TextStyle(
        fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white);
  }
}
