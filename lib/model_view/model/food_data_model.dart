// To parse this JSON data, do
//
//     final foodDataModel = foodDataModelFromJson(jsonString);

import 'dart:convert';

FoodDataModel foodDataModelFromJson(String str) => FoodDataModel.fromJson(json.decode(str));

String foodDataModelToJson(FoodDataModel data) => json.encode(data.toJson());

class FoodDataModel {
  final List<Recipe>? recipes;
  final int? total;
  final int? skip;
  final int? limit;

  FoodDataModel({
    this.recipes,
    this.total,
    this.skip,
    this.limit,
  });

  factory FoodDataModel.fromJson(Map<String, dynamic> json) => FoodDataModel(
    recipes: json["recipes"] == null ? [] : List<Recipe>.from(json["recipes"]!.map((x) => Recipe.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "recipes": recipes == null ? [] : List<dynamic>.from(recipes!.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Recipe {
  final int? id;
  final String? name;
  final List<String>? ingredients;
  final List<String>? instructions;
  final int? prepTimeMinutes;
  final int? cookTimeMinutes;
  final int? servings;
  final Difficulty? difficulty;
  final String? cuisine;
  final int? caloriesPerServing;
  final List<String>? tags;
  final int? userId;
  final String? image;
  final double? rating;
  final int? reviewCount;
  final List<String>? mealType;

  Recipe({
    this.id,
    this.name,
    this.ingredients,
    this.instructions,
    this.prepTimeMinutes,
    this.cookTimeMinutes,
    this.servings,
    this.difficulty,
    this.cuisine,
    this.caloriesPerServing,
    this.tags,
    this.userId,
    this.image,
    this.rating,
    this.reviewCount,
    this.mealType,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
    id: json["id"],
    name: json["name"],
    ingredients: json["ingredients"] == null ? [] : List<String>.from(json["ingredients"]!.map((x) => x)),
    instructions: json["instructions"] == null ? [] : List<String>.from(json["instructions"]!.map((x) => x)),
    prepTimeMinutes: json["prepTimeMinutes"],
    cookTimeMinutes: json["cookTimeMinutes"],
    servings: json["servings"],
    difficulty: difficultyValues.map[json["difficulty"]]!,
    cuisine: json["cuisine"],
    caloriesPerServing: json["caloriesPerServing"],
    tags: json["tags"] == null ? [] : List<String>.from(json["tags"]!.map((x) => x)),
    userId: json["userId"],
    image: json["image"],
    rating: json["rating"]?.toDouble(),
    reviewCount: json["reviewCount"],
    mealType: json["mealType"] == null ? [] : List<String>.from(json["mealType"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "ingredients": ingredients == null ? [] : List<dynamic>.from(ingredients!.map((x) => x)),
    "instructions": instructions == null ? [] : List<dynamic>.from(instructions!.map((x) => x)),
    "prepTimeMinutes": prepTimeMinutes,
    "cookTimeMinutes": cookTimeMinutes,
    "servings": servings,
    "difficulty": difficultyValues.reverse[difficulty],
    "cuisine": cuisine,
    "caloriesPerServing": caloriesPerServing,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
    "userId": userId,
    "image": image,
    "rating": rating,
    "reviewCount": reviewCount,
    "mealType": mealType == null ? [] : List<dynamic>.from(mealType!.map((x) => x)),
  };
}

enum Difficulty {
  EASY,
  MEDIUM
}

final difficultyValues = EnumValues({
  "Easy": Difficulty.EASY,
  "Medium": Difficulty.MEDIUM
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}