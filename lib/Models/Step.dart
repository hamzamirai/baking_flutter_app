
// ignore: slash_for_doc_comments
import 'package:baking_app_flutter/Utils/Constant.dart';

/**
 * Created By Hamza Chaouki [DevHcH].
 * 9/9/2020
 */

class Step {

  int id;

  String shortDescription;

  String description;

  String videoURL;

  String thumbnailURL;

  Step({this.id, this.shortDescription, this.description, this.videoURL, this.thumbnailURL}) ;

  factory Step.fromJson(Map<String, dynamic> json) => Step(
    id: json[Constant.KEY_RECIPE_STEPS_ID],
    shortDescription: json[Constant.KEY_RECIPE_STEPS_SHORT_DESCRIPTION],
    description: json[Constant.KEY_RECIPE_STEPS_DESCRIPTION],
    videoURL: json[Constant.KEY_RECIPE_STEPS_VIDEO_URL],
    thumbnailURL: json[Constant.KEY_RECIPE_STEPS_THUMBNAIL_URL],
  );

  Map<String, dynamic> toJson() => {
    Constant.KEY_RECIPE_STEPS_ID: id,
    Constant.KEY_RECIPE_STEPS_SHORT_DESCRIPTION: shortDescription,
    Constant.KEY_RECIPE_STEPS_DESCRIPTION: description,
    Constant.KEY_RECIPE_STEPS_VIDEO_URL: videoURL,
    Constant.KEY_RECIPE_STEPS_THUMBNAIL_URL: thumbnailURL,
  };
}