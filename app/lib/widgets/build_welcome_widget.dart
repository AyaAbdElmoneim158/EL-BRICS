import 'package:flutter/material.dart';

Center buildWelcomeWidget() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/choose_video.png",
          width: 150,
        ),
        const SizedBox(height: 12),
        const Text("Welcome at video player app"),
      ],
    ),
  );
}
