import 'package:flutter/material.dart';

class BottomControllers extends StatelessWidget {
  const BottomControllers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.play_arrow),
                  const SizedBox(width: 4),
                  RichText(
                    text: const TextSpan(
                      text: '0:02 ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      children: [
                        TextSpan(
                          text: ' / ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: ' 0:20'),
                      ],
                    ),
                  ),
                ],
              ),
              const Row(children: [
                Icon(Icons.volume_up),
                SizedBox(width: 4),
                Icon(Icons.fullscreen),
                SizedBox(width: 4),
                Icon(Icons.more_vert),
                SizedBox(width: 4),
              ]),
            ],
          ),
          const Divider(color: Colors.white, thickness: 3),
        ],
      ),
    );
  }
}
