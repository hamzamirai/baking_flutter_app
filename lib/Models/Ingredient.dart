import 'package:baking_app_flutter/Utils/Constant.dart';

// ignore: slash_for_doc_comments
/**
 * Created By Hamza Chaouki [DevHcH].
 * 9/9/2020
 */

class Ingredient {

   double quantity;

   String measure;

   String ingredient;

   Ingredient({this.quantity, this.measure, this.ingredient});

   factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
      quantity: json[Constant.KEY_RECIPE_INGREDIENTS_QUANTITY],
      measure: json[Constant.KEY_RECIPE_INGREDIENTS_MEASURE],
      ingredient: json[Constant.KEY_RECIPE_INGREDIENTS_INGREDIENT],
   );

   Map<String, dynamic> toJson() => {
      Constant.KEY_RECIPE_INGREDIENTS_QUANTITY: quantity,
      Constant.KEY_RECIPE_INGREDIENTS_MEASURE: measure,
      Constant.KEY_RECIPE_INGREDIENTS_INGREDIENT: ingredient,
   };
}