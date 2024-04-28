import 'package:animated_expandable_fab/animated_expandable_fab.dart';
import 'package:flutter/material.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpandableFab(
      distance: 100,
      openIcon: const Icon(Icons.add),
      closeIcon: const Icon(Icons.close, color: Color(0xffe51449)),
      closeBackgroundColor: const Color(0xfffefefe),
      children: [
        ActionButton(
          color: const Color(0xffe51449),
          icon: const Icon(Icons.folder_open),
          onPressed: () => debugPrint("folder_open"),
          // text: const Text("Pick video"),
        ),
        ActionButton(
          color: const Color(0xffe51449),
          icon: const Icon(Icons.link),
          onPressed: () => debugPrint("link"),
        ),
        ActionButton(
          color: const Color(0xffe51449),
          icon: const Icon(Icons.play_arrow),
          onPressed: () => debugPrint("play_arrow"),
        ),
      ],
    );
  }
}
