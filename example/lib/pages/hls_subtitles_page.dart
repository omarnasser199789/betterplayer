import 'package:better_player/better_player.dart';
import 'package:better_player_example/constants.dart';
import 'package:flutter/material.dart';

class HlsSubtitlesPage extends StatefulWidget {
  @override
  _HlsSubtitlesPageState createState() => _HlsSubtitlesPageState();
}

class _HlsSubtitlesPageState extends State<HlsSubtitlesPage> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BetterPlayerControlsConfiguration controlsConfiguration =
    BetterPlayerControlsConfiguration(
      controlBarColor: Colors.black26,
      iconsColor: Colors.white,
      playIcon: Icons.play_arrow_outlined,
      progressBarPlayedColor: Colors.indigo,
      progressBarHandleColor: Colors.indigo,
      skipBackIcon: Icons.replay_10_outlined,
      skipForwardIcon: Icons.forward_10_outlined,
      backwardSkipTimeInMilliseconds: 10000,
      forwardSkipTimeInMilliseconds: 10000,
      enableSkips: true,
      enableFullscreen: true,
      enablePip: true,
      enablePlayPause: true,
      enableMute: true,
      enableAudioTracks: true,
      enableProgressText: true,
      enableSubtitles: true,
      showControlsOnInitialize: true,
      enablePlaybackSpeed: true,
      controlBarHeight: 40,
      loadingColor: Colors.red,
      overflowModalColor: Colors.black54,
      overflowModalTextColor: Colors.white,
      overflowMenuIconsColor: Colors.white,
    );

    BetterPlayerConfiguration betterPlayerConfiguration =
    BetterPlayerConfiguration(
        controlsConfiguration: controlsConfiguration,
        aspectRatio: size.width/size.height,
        autoDetectFullscreenAspectRatio:true,
        fit: BoxFit.cover,
        subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
          fontSize: 16.0,
        ));
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network, "https://hi-erbil.s3.amazonaws.com/processVideos/2023/October/1698756840453_f0TlOTo9CO/index.m3u8",//Constants.hlsPlaylistUrl,
        useAsmsSubtitles: true,


    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            SafeArea(child: BetterPlayer(controller: _betterPlayerController)),
          ],
        ),
      ),
    );
  }
}
