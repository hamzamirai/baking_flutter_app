// ignore: slash_for_doc_comments
import 'package:baking_app_flutter/Utils/Constant.dart';

import 'Ingredient.dart';
import 'Step.dart';

// ignore: slash_for_doc_comments
/**
 * Created By Hamza Chaouki [DevHcH].
 * 9/9/2020
 */

class Recipe {
  int id;

  String name;

  List<Ingredient> ingredients;

  List<Step> steps;

  int servings;

  String image;

  Recipe(
      {this.id,
      this.name,
      this.ingredients,
      this.steps,
      this.servings,
      this.image});

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
        ingredients: List<Ingredient>.from(
            json[Constant.KEY_RECIPE_INGREDIENTS].map((x) => Ingredient.fromJson(x))),
        steps: List<Step>.from(json[Constant.KEY_RECIPE_STEPS].map((x) => Step.fromJson(x))),
        name: json[Constant.KEY_RECIPE_NAME],
        id: json[Constant.KEY_RECIPE_ID],
        servings: json[Constant.KEY_RECIPE_SERVINGS],
        image: json[Constant.KEY_RECIPE_IMAGE],
      );

  Map<String, dynamic> toJson() => {
        Constant.KEY_RECIPE_INGREDIENTS: List<dynamic>.from(ingredients.map((x) => x.toJson())),
        Constant.KEY_RECIPE_STEPS: List<dynamic>.from(steps.map((x) => x.toJson())),
        Constant.KEY_RECIPE_NAME: name,
        Constant.KEY_RECIPE_ID: id,
        Constant.KEY_RECIPE_SERVINGS: servings,
        Constant.KEY_RECIPE_IMAGE: image,
      };
}
