
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SecondVideo extends StatefulWidget {
  const SecondVideo({Key? key}) : super(key: key);

  @override
  State<SecondVideo> createState() => _SecondVideoState();
}

class _SecondVideoState extends State<SecondVideo> {
  String videoUrl = "https://www.youtube.com/watch?v=hEdzv7D4CbQ";
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        // mute: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SizedBox(
                width: width,
                height: height,
                child: YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    bottomActions: [
                      CurrentPosition(),
                    ],
                  ),
                  builder: (BuildContext context, player) {
                    return Column(
                      children: [
                        player,
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
