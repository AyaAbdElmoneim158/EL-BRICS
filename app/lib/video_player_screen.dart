import 'package:flutter/material.dart';
import 'widgets/app_floating_action_button.dart';
import 'widgets/build_welcome_widget.dart';

class VideoPlayerScreen extends StatelessWidget {
  const VideoPlayerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildWelcomeWidget(),
      floatingActionButton: const AppFloatingActionButton(),
    );
  }
}
