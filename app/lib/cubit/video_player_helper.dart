// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';

// class VideoPlayerHelper {
//   // static late VideoPlayerController videoController;
//   static Future<void> initializeVideoPlayer(String videoUrl) async {
//     VideoPlayerController videoController =
//         VideoPlayerController.networkUrl(Uri.parse(videoUrl));
//     return await videoController.initialize();
//   }

//   static void disposeVideoPlayer(VideoPlayerController videoController) =>
//       videoController.dispose();
//   static void pause(VideoPlayerController videoController) =>
//       videoController.pause();
//   static void seekTo(
//           VideoPlayerController videoController, Duration position) =>
//       videoController.seekTo(position);
//   static void setVolume(VideoPlayerController videoController, double volume) =>
//       videoController.setVolume(volume);
//   static void setPlaybackSpeed(
//           VideoPlayerController videoController, double speed) =>
//       videoController.setPlaybackSpeed(speed);
//   static void toggleLooping(VideoPlayerController videoController) =>
//       videoController.setLooping(!videoController.value.isLooping);

//   static void toggleFullscreen(BuildContext context) {
//     bool isFullScreen =
//         MediaQuery.of(context).orientation == Orientation.landscape;
//     if (!isFullScreen) {
//       // SystemChrome.setSystemUIOverlayStyle([]);
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.landscapeLeft,
//         DeviceOrientation.landscapeRight,
//       ]);
//     } else {
//       // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlay.values);
//       SystemChrome.setPreferredOrientations([
//         DeviceOrientation.portraitUp,
//         DeviceOrientation.portraitDown,
//       ]);
//     }
//   }
// }

// class VideoPlayerHelper2 {
//   static void toggleFullscreen(BuildContext context) {
//     // Implement fullscreen toggle logic here
//   }

//   static void toggleSubtitle(
//       VideoPlayerController videoController, String subtitleUrl) {
//     // Implement subtitle loading logic here
//   }

//   static void showPlaybackSpeedOptions(
//       BuildContext context, List<double> speeds) {
//     // Show a dialog with playback speed options
//   }

//   static void showSubtitleOptions(
//       BuildContext context, List<String> subtitleUrls) {
//     // Show a dialog with subtitle options
//   }

//   static void showVolumeSlider(
//       BuildContext context, VideoPlayerController videoController) {
//     // Show a slider to control volume
//   }

//   static void showBrightnessSlider(
//       BuildContext context, VideoPlayerController videoController) {
//     // Show a slider to control brightness
//   }

//   static void toggleAspectRatio(VideoPlayerController videoController) {
//     // Toggle between aspect ratio options (e.g., fit, fill)
//   }

//   static void toggleCaption(VideoPlayerController videoController) {
//     // Toggle closed caption display
//   }

//   static void showPlaybackControls(
//       BuildContext context, VideoPlayerController videoController) {
//     // Show/hide playback controls
//   }

//   static void showQualityOptions(
//       BuildContext context, List<String> qualityOptions) {
//     // Show a dialog with video quality options
//   }

//   static void switchVideoSource(
//       VideoPlayerController videoController, String newVideoUrl) {
//     // Switch to a different video source
//   }

//   static void togglePictureInPictureMode(
//       VideoPlayerController videoController) {
//     // Toggle Picture-in-Picture mode
//   }

//   static void showShareOptions(BuildContext context, String videoUrl) {
//     // Show options to share video
//   }

//   static void toggleRepeatMode(VideoPlayerController videoController) {
//     // Toggle repeat mode (e.g., repeat one, repeat all)
//   }

//   static void captureThumbnail(VideoPlayerController videoController) {
//     // Capture thumbnail image from video
//   }

//   static void showPlaylist(BuildContext context, List<String> playlist) {
//     // Show a playlist of videos
//   }

//   static void showFavorites(BuildContext context, List<String> favoriteVideos) {
//     // Show a list of favorite videos
//   }

//   static void toggleAutoPlay(VideoPlayerController videoController) {
//     // Toggle auto play on video load
//   }

//   static void showRecentlyPlayed(
//       BuildContext context, List<String> recentlyPlayedVideos) {
//     // Show a list of recently played videos
//   }

//   // Add more functions for additional features as needed
// }
