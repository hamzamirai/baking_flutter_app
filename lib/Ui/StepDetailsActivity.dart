import 'package:baking_app_flutter/Utils/Constant.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

// ignore: slash_for_doc_comments
/**
 * Created By Hamza Chaouki [DevHcH].
 * 9/9/2020
 */

// ignore: must_be_immutable
class StepDetailsActivity extends StatefulWidget {
  int position;
  List steps;

  StepDetailsActivity(this.steps, this.position);

  @override
  _StepDetailsActivityState createState() => _StepDetailsActivityState();
}

class _StepDetailsActivityState extends State<StepDetailsActivity> {

  int currentPosition = 0;

  var videoPlayerUrl = '';

  TargetPlatform _platform = TargetPlatform.iOS;
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();

    currentPosition = widget.position;
    videoPlayerUrl =
        widget.steps[currentPosition][Constant.KEY_RECIPE_STEPS_VIDEO_URL];

    initialiseVideoPlayer(videoPlayerUrl);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
              Constant.KEY_DARK_BLUE_COLOR,
              Constant.KEY_BLUE_COLOR,
            ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                tileMode: TileMode.clamp)),
        child: new Scaffold(
          backgroundColor: Colors.transparent,
          appBar: new AppBar(
            title: new Text(Constant.KEY_STEPS_DETAILS_ACTIVITY_TITLE),
          ),
          body: new ListView(
            children: <Widget>[
              new Container(
                width: MediaQuery.of(context).size.width,
                height: Constant.KEY_VIDEO_PLAYER_HEIGHT,
                child: Center(
                  child: new Expanded(
                    child: Center(
                      child: Chewie(
                        controller: _chewieController,
                      ),
                    ),
                  ),
                ),
              ),
              new Container(
                height: MediaQuery.of(context).size.height -
                    Constant.KEY_VIDEO_PLAYER_HEIGHT -
                    Constant.KEY_BOTTOM_NAVIGATION_BAR_HEIGHT -
                    50,
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: new Text(
                        " ${widget.steps[currentPosition][Constant.KEY_RECIPE_STEPS_DESCRIPTION]}",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: new BottomAppBar(
            color: Constant.KEY_BLUE_COLOR,
            child: Container(
              height: Constant.KEY_BOTTOM_NAVIGATION_BAR_HEIGHT,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.all(Constant.KEY_MARGIN_FOUR),
                    child: new OutlineButton(
                      onPressed: () {
                        setState(() {
                          if (currentPosition == 0) return;
                          currentPosition--;
                          videoPlayerUrl = widget.steps[currentPosition]
                              [Constant.KEY_RECIPE_STEPS_VIDEO_URL];
                          initialiseVideoPlayer(videoPlayerUrl);
                        });
                      },
                      child: new Text(
                        Constant.KEY_OUTLINE_BUTTON_PREVIOUS,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Constant.KEY_TEXT_SIZE),
                      ),
                    ),
                  ),
                  new Container(
                    child: new Text(
                      " ${currentPosition + 1} / ${widget.steps.length}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  new Container(
                    margin: EdgeInsets.all(4.0),
                    child: new OutlineButton(
                      onPressed: () {
                        setState(() {
                          if (currentPosition == widget.steps.length - 1)
                            return;
                          currentPosition++;
                          videoPlayerUrl = widget.steps[currentPosition]
                              [Constant.KEY_RECIPE_STEPS_VIDEO_URL];
                          initialiseVideoPlayer(videoPlayerUrl);
                        });
                      },
                      child: new Text(
                        Constant.KEY_OUTLINE_BUTTON_NEXT,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Constant.KEY_TEXT_SIZE),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  initialiseVideoPlayer(String videoUrl) {
    _videoPlayerController = VideoPlayerController.network(videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:
      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: textColor,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }
}
