import 'package:app/app_theme.dart';
import 'package:flutter/material.dart';

class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
      home: Scaffold(
        body: Center(
          child: Text(
            "Video player 📹",
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
