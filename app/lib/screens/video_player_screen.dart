// import 'dart:io';

// import 'package:animated_expandable_fab/animated_expandable_fab.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:file_picker/file_picker.dart';

// class VideoPlayerScreen extends StatefulWidget {
//   const VideoPlayerScreen({Key? key}) : super(key: key);

//   @override
//   State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
// }

// class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
//   late VideoPlayerController videoController;
//   late Future<void> initializeVideoPlayerFuture;
//   bool isFullScreen = true;

//   @override
//   void initState() {
//     super.initState();
//     String videoUrl =
//         'https://cdn.pixabay.com/video/2019/02/28/21723-320725678_large.mp4';
//     videoController = VideoPlayerController.networkUrl(Uri.parse(videoUrl));
//     initializeVideoPlayerFuture = videoController.initialize();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     videoController.dispose();
//   }

//   Future<void> _pickVideo() async {
//     FilePickerResult? result =
//         await FilePicker.platform.pickFiles(type: FileType.video);
//     if (result != null) {
//       setState(() {
//         videoController =
//             VideoPlayerController.file(File(result.files.single.path!));
//         initializeVideoPlayerFuture = videoController.initialize();
//       });
//     }
//   }

//   void _toggleFullScreen() {
//     setState(() {
//       isFullScreen = !isFullScreen;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Scaffold(
//         body: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Stack(
//               alignment: AlignmentDirectional.bottomEnd,
//               children: [
//                 // Image.asset("assets/bg.png"),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: FutureBuilder(
//                     future: initializeVideoPlayerFuture,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.done) {
//                         return AspectRatio(
//                           aspectRatio: videoController.value.aspectRatio,
//                           child: VideoPlayer(videoController),
//                         );
//                       } else {
//                         return const Center(child: CircularProgressIndicator());
//                       }
//                     },
//                   ),
//                 ),
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: AspectRatio(
//                     aspectRatio: videoController.value.aspectRatio,
//                     child: Container(
//                       width: double.infinity,
//                       // height: videoController.value.aspectRatio,
//                       color: Colors.black.withOpacity(0.5),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               IconButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     if (videoController.value.isPlaying) {
//                                       videoController.pause();
//                                     } else {
//                                       videoController.play();
//                                     }
//                                   });
//                                 },
//                                 icon: Icon(
//                                   color: Colors.white,
//                                   videoController.value.isPlaying ||
//                                           videoController.value.isCompleted
//                                       ? Icons.pause
//                                       : Icons.play_arrow,
//                                 ),
//                                 // const Icon(Icons.play_arrow),
//                               ),
//                               const SizedBox(width: 4),
//                               RichText(
//                                 text: const TextSpan(
//                                   text: '0:02 ',
//                                   style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     color: Colors.white,
//                                   ),
//                                   children: [
//                                     TextSpan(
//                                       text: ' / ',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     TextSpan(text: ' 0:20'),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Row(children: [
//                             IconButton(
//                               onPressed: () async {
//                                 Duration? duration =
//                                     await videoController.position;
//                                 videoController.seekTo(
//                                     duration! - const Duration(seconds: 5));
//                                 setState(() {});
//                               },
//                               icon: const Icon(
//                                 Icons.keyboard_double_arrow_left,
//                                 color: Colors.white,
//                               ),
//                               // const Icon(Icons.play_arrow),
//                             ),
//                             IconButton(
//                               onPressed: () async {
//                                 Duration? duration =
//                                     await videoController.position;
//                                 videoController.seekTo(
//                                     duration! + const Duration(seconds: 5));
//                                 setState(() {});
//                               },
//                               color: Colors.white,
//                               icon: const Icon(
//                                 Icons.keyboard_double_arrow_right,
//                               ),
//                               // const Icon(Icons.play_arrow),
//                             ),
//                           ]),
//                           Row(children: [
//                             const Icon(Icons.volume_up),
//                             const SizedBox(width: 4),
//                             IconButton(
//                               onPressed: () {
//                                 // https://stackoverflow.com/questions/52431109/flutter-video-player-fullscreen
//                                 //https://community.flutterflow.io/widgets-and-design/post/video-player-full-screen-orientation-LgtyZ2W2VIUiWIq
//                                 /* _isFullScreen =
//                                     MediaQuery.of(context).orientation ==
//                                         Orientation.landscape;
//                                 setState(() {
//                                   _isFullScreen = !_isFullScreen;
//                                   if (_isFullScreen) {
//                                     SystemChrome.setPreferredOrientations([
//                                       DeviceOrientation.landscapeLeft,
//                                       DeviceOrientation.landscapeRight,
//                                     ]);
//                                     // _chewieController.enterFullScreen();
//                                   } else {
//                                     SystemChrome.setPreferredOrientations([
//                                       DeviceOrientation.portraitUp,
//                                       DeviceOrientation.portraitDown,
//                                     ]);
//                                     // _chewieController.exitFullScreen();
//                                   }
//                                 });*/
//                                 _toggleFullScreen();
//                               },
//                               icon: Icon(
//                                 isFullScreen
//                                     ? Icons.fullscreen_exit
//                                     : Icons.fullscreen,
//                               ),
//                             ),
//                             const SizedBox(width: 4),
//                             const Icon(Icons.more_vert),
//                             const SizedBox(width: 4),
//                           ]),
//                         ],
//                       ),
//                       const Divider(color: Colors.white, thickness: 3),
//                     ],
//                   ),
//                 ),
//                 // const BottomControllers(),
//               ],
//             ),
//           ),
//         ),
//         floatingActionButton: ExpandableFab(
//           distance: 100,
//           openIcon: const Icon(Icons.add),
//           closeIcon: const Icon(Icons.close, color: Color(0xffe51449)),
//           closeBackgroundColor: const Color(0xfffefefe),
//           children: [
//             ActionButton(
//               color: const Color(0xffe51449),
//               icon: const Icon(Icons.folder_open),
//               onPressed: () {
//                 debugPrint("folder_open");
//                 _pickVideo();
//               },
//               // text: const Text("Pick video"),
//             ),
//             ActionButton(
//               color: const Color(0xffe51449),
//               icon: const Icon(Icons.link),
//               onPressed: () => debugPrint("link"),
//             ),
//             ActionButton(
//               color: const Color(0xffe51449),
//               icon: const Icon(Icons.play_arrow),
//               onPressed: () => debugPrint("play_arrow"),
//             ),
//           ],
//         ),
//         // const AppFloatingActionButton(),
//       ),
//     );
//   }
// }
