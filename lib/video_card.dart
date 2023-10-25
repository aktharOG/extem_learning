import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:extem_learning/theme.dart';
import 'package:extem_learning/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';

class VideoCard extends StatefulWidget {
  final String videoPath;
  final bool showControlls;
  final bool autoPlay;
  const VideoCard({super.key, required this.videoPath,this.showControlls=true,this.autoPlay = true});

  @override
  State<VideoCard> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoCard> {
  late VideoPlayerController _controller;
  late ChewieController chewieController;
  bool _showControls = false;

  //Stream
  StreamController<Duration> positionStreamController =
      StreamController<Duration>();
  Stream<ProgressBarState>? combinedStream;
  Stream? stream;

  //! chewie

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoPath),
        videoPlayerOptions: VideoPlayerOptions())
      ..addListener(() {
        setState(() {
          stream = Stream.value(_controller.value).asBroadcastStream();
          combinedStream = Rx.combineLatest2(
              _controller.position.asStream(),
              stream!,
              (a, b) => ProgressBarState(
                  current: a!,
                  buffered: b.buffered[0].start,
                  total: b.duration)).asBroadcastStream();
        });
      })
      ..setLooping(true)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        chewieController = ChewieController(
          showControls: widget.showControlls,
          // customControls: SizedBox(),
          videoPlayerController: _controller,
          autoPlay: widget.autoPlay,
          looping: true,
        );
        setState(() {});
      })
      ..play();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _showControls = true;
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              _showControls = false;
            });
          });
        });
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(height: 10,color: Colors.black,),
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: 16.0 / 9.0,
                  //_controller.value.aspectRatio,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Chewie(controller: chewieController)
                      // VideoPlayer(_controller),
                      // if (_showControls)
                      //   _ControlsOverlay(controller: _controller),
                      // if (_showControls)
                      //   ProgressBarControls(
                      //       controller: _controller,
                      //       combinedStream: combinedStream)
                    ],
                  ),
                )
              : const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({required this.controller});

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          color: Colors.black26,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: InkWell(
                    onDoubleTap: () {
                      final correntPosition = controller.value.position;
                      final newPostion =
                          Duration(seconds: correntPosition.inSeconds - 3);
                      controller.seekTo(newPostion);
                    },
                    child: const SizedBox(
                      height: 100,
                      width: 100,
                    )),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 50),
                reverseDuration: const Duration(milliseconds: 200),
                child: controller.value.isPlaying
                    ? Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent.withOpacity(0.1),
                          child: const CircleAvatar(
                            radius: 35,
                            backgroundColor: primaryColor,
                            child: Icon(
                              Icons.pause,
                              color: Colors.white,
                              size: 60.0,
                              semanticLabel: 'Play',
                            ),
                          ),
                        ),
                      )
                    : Center(
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.transparent.withOpacity(0.1),
                          child: const CircleAvatar(
                            radius: 35,
                            backgroundColor: primaryColor,
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 60.0,
                              semanticLabel: 'Play',
                            ),
                          ),
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                    onDoubleTap: () {
                      final correntPosition = controller.value.position;
                      final newPostion =
                          Duration(seconds: correntPosition.inSeconds + 3);
                      controller.seekTo(newPostion);
                    },
                    child: const SizedBox(
                      height: 100,
                      width: 100,
                    )),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.topLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text(
                '${controller.value.playbackSpeed}x',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProgressBarControls extends StatelessWidget {
  final Stream<ProgressBarState>? combinedStream;
  final VideoPlayerController controller;

  const ProgressBarControls(
      {super.key, required this.controller, required this.combinedStream});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // StreamBuilder<Duration?>(
          //   stream: _controller.position.asStream(),
          //   builder: (context, snapshot) => Text(
          //     "${snapshot.data!.inMinutes.toString()}:${snapshot.data!.inSeconds.toString()}",
          //     style: TextStyle(color: Colors.white),
          //   ),
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StreamBuilder<ProgressBarState>(
                  stream: combinedStream,
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    if (snapshot.hasData) {
                      return Text(
                        "${data!.current.inMinutes.toString()}:${data.current.inSeconds.toString()}/${data.total.inMinutes}:${data.total.inSeconds}",
                        style: const TextStyle(color: Colors.white),
                      );
                    } else {
                      return const SizedBox();
                    }
                  }),
              const Row(
                children: [
                  Icon(
                    Icons.settings_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SvgIcon(
                    path: "maximize-icon",
                    height: 20,
                  )
                ],
              )
            ],
          ),
          VideoProgressIndicator(controller,
              allowScrubbing: true,
              colors: const VideoProgressColors(
                  playedColor: Color(0xff015C8B),
                  backgroundColor: Colors.white)),
        ],
      ),
    );
  }
}

class ProgressBarState {
  const ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
}
