import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  final String url;
  const Video({super.key, required this.url});

  @override
  State<Video> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<Video> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url
        // 'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
        );
    _controller.addListener(() {
      setState(() {});
    });
    _controller.initialize().then((value) {
      setState(() {});
    });
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  Widget renderItem(String title) {
    return Container(
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.only(bottom: 8),
        color: Colors.white,
        child: Column(
          children: [
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: VideoPlayer(_controller),
                        ),

                        // ClosedCaption(text: 'asas'),
                        // Here you can also add Overlay capacities
                        // Row(
                        //   // mainAxisAlignment: MainAxisAlignment.end,
                        //   crossAxisAlignment: CrossAxisAlignment.center,
                        //   children: [
                        //     Expanded(
                        //       child: VideoProgressIndicator(
                        //         _controller,
                        //         allowScrubbing: true,
                        //         padding: EdgeInsets.all(3),
                        //         colors: VideoProgressColors(
                        //             playedColor: Theme.of(context).primaryColor),
                        //       ),
                        //     ),
                        //     Container(
                        //       margin: const EdgeInsets.only(left: 10, right: 10),
                        //       child: ValueListenableBuilder(
                        //         valueListenable: _controller,
                        //         builder: (context, VideoPlayerValue value, child) {
                        //           //Do Something with the value.
                        //           return Text(
                        //               "${value.position.inSeconds}:${_controller.value.duration.inSeconds}");
                        //         },
                        //       ),
                        //     )
                        //   ],
                        // ),

                        Visibility(
                          visible: true,
                          child: Container(
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Center(
                                      child: FlatButton(
                                        color: Colors.blueAccent,
                                        height: 48,
                                        shape: CircleBorder(
                                            side: BorderSide(
                                                color: Colors.white)),
                                        child: Icon(
                                          _controller.value.isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          color: Colors.white,
                                          size: 28,
                                        ),
                                        onPressed: () {
                                          // pause while video is playing, play while video is pausing
                                          setState(() {
                                            _controller.value.isPlaying
                                                ? _controller.pause()
                                                : _controller.play();
                                          });

                                          // Auto dismiss overlay after 1 second
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    child: FlatButton(
                                      height: 28,
                                      shape: CircleBorder(
                                          side:
                                              BorderSide(color: Colors.white)),
                                      child: Icon(
                                        _controller.value.isPlaying
                                            ? Icons.volume_off_rounded
                                            : Icons.volume_up_outlined,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      onPressed: () {
                                        // pause while video is playing, play while video is pausing
                                        setState(() {
                                          _controller.value.isPlaying
                                              ? _controller.pause()
                                              : _controller.play();
                                        });

                                        // Auto dismiss overlay after 1 second
                                      },
                                    ),
                                  )
                                ],
                              )),
                        )
                      ],
                    ),
                  )
                : SizedBox(
                    height: 250,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            Container(
                margin: EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                    children: const [Icon(Icons.play_arrow), Text('3 gio')])),
            Text(
              'Chim bay tung troi Chim bay tung troi Chim bay tung troi Chim bay tung troi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[300],
        child: ListView(children: <Widget>[
          renderItem(
            'Chim bay tung troi Chim bay tung troi Chim bay tung troi Chim bay tung troi',
          ),
          renderItem(
            'Chim bay tung troi Chim bay tung troi Chim bay tung troi Chim bay tung troi',
          ),
          renderItem(
            'Chim bay tung troi Chim bay tung troi Chim bay tung troi Chim bay tung troi',
          ),
          renderItem(
            'Chim bay tung troi Chim bay tung troi Chim bay tung troi Chim bay tung troi',
          )
        ]));
  }
}
