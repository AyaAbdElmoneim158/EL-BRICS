import 'package:app/app_theme.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

import 'screens/google_map/google_map_screen.dart';

void main() {
  runApp(const MyApp());
}
// https://cdn.pixabay.com/video/2019/02/28/21723-320725678_large.mp4

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Appinio Video Player Demo',
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,
      home: const CustomGoogleMap(),
      // const GoogleMapScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late CachedVideoPlayerController _assetsVideoPlayerController;
  late CachedVideoPlayerController _networkVideoPlayerController;

  late CustomVideoPlayerController _customAssetsVideoPlayerController;
  late CustomVideoPlayerController _customNetWorkVideoPlayerController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings(
    playButton: Icon(
      Icons.play_arrow_rounded,
      color: Colors.white,
    ),
    pauseButton: Icon(
      Icons.pause,
      color: Colors.white,
    ),
    enterFullscreenButton: Icon(
      Icons.fullscreen,
      color: Colors.white,
    ),
    exitFullscreenButton: Icon(
      Icons.fullscreen_exit,
      color: Colors.white,
    ),
    settingsButton: Icon(
      Icons.settings,
      color: Colors.white,
    ),
    showMuteButton: false,
    showSeekButtons: true,
    seekDuration: Duration(seconds: 10),
  );

  @override
  void initState() {
    super.initState();

    _networkVideoPlayerController = CachedVideoPlayerController.network(
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
    )..initialize().then((value) => setState(() {}));

    _assetsVideoPlayerController = CachedVideoPlayerController.asset(
      'assets/waterfall.mp4',
    )..initialize().then((value) => setState(() {}));

    _customAssetsVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _assetsVideoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
    );
    _customNetWorkVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _networkVideoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
    );
  }

  @override
  void dispose() {
    _customAssetsVideoPlayerController.dispose();
    _customNetWorkVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Appinio Video Player"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                child: TabBar(
                  tabs: const [
                    Tab(
                      text: "asset video",
                    ),
                    Tab(
                      text: "network video",
                    )
                  ],
                  onTap: (index) {
                    _customAssetsVideoPlayerController.videoPlayerController
                        .pause();
                    _customNetWorkVideoPlayerController.videoPlayerController
                        .pause();
                  },
                ),
              ),
              Expanded(
                child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 250,
                            child: CustomVideoPlayer(
                              customVideoPlayerController:
                                  _customAssetsVideoPlayerController,
                            ),
                          ),
                          //   CupertinoButton(
                          //     child: const Text("Play Fullscreen"),
                          //     onPressed: () {
                          //       if (kIsWeb) {
                          //         _customAssetsVideoPlayerController
                          //             .setFullscreen(true);
                          //         _customAssetsVideoPlayerController
                          //             .videoPlayerController
                          //             .play();
                          //       } else {
                          //         _customAssetsVideoPlayerController
                          //             .setFullscreen(true);
                          //         _customAssetsVideoPlayerController
                          //             .videoPlayerController
                          //             .play();
                          //       }
                          //     },
                          //   ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 250,
                            child: CustomVideoPlayer(
                              customVideoPlayerController:
                                  _customNetWorkVideoPlayerController,
                            ),
                          ),
                          // CupertinoButton(
                          //   child: const Text("Play Fullscreen"),
                          //   onPressed: () {
                          //     if (kIsWeb) {
                          //       _customAssetsVideoPlayerController
                          //           .setFullscreen(true);
                          //       _customAssetsVideoPlayerController
                          //           .videoPlayerController
                          //           .play();
                          //     } else {
                          //       _customAssetsVideoPlayerController
                          //           .setFullscreen(true);
                          //       _customAssetsVideoPlayerController
                          //           .videoPlayerController
                          //           .play();
                          //     }
                          //   },
                          // ),
                        ],
                      ),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
