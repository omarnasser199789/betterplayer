import 'package:better_player/better_player.dart';
import 'package:better_player_example/constants.dart';
import 'package:flutter/material.dart';

class HlsTracksPage extends StatefulWidget {
  @override
  _HlsTracksPageState createState() => _HlsTracksPageState();
}

class _HlsTracksPageState extends State<HlsTracksPage> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 0.6,
      fit: BoxFit.contain,
    );
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "https://hi-erbil.s3.amazonaws.com/processVideos/2023/November/1698838161275_k6JqDXanyb/360p.mp4",
      // Constants.hlsTestStreamUrl,
      useAsmsSubtitles: true,
      liveStream: true,
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),

            AspectRatio(
              aspectRatio: 0.6,
              child: BetterPlayer(controller: _betterPlayerController),
            ),
          ],
        ),
      ),
    );
  }
}
