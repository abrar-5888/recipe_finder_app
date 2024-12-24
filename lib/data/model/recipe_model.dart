import 'package:hive/hive.dart';

part 'recipe_model.g.dart';

@HiveType(typeId: 0) 
class RecipeModel {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final List<String> ingredients;

  @HiveField(3)
  final List<String> instructions;

  @HiveField(4)
  final int prepTimeMinutes;

  @HiveField(5)
  final int cookTimeMinutes;

  @HiveField(6)
  final int servings;

  @HiveField(7)
  final String difficulty;

  @HiveField(8)
  final String cuisine;

  @HiveField(9)
  final int caloriesPerServing;

  @HiveField(10)
  final List<String> tags;

  @HiveField(11)
  final int userId;

  @HiveField(12)
  final String image;

  @HiveField(13)
  final double rating;

  @HiveField(14)
  final int reviewCount;

  @HiveField(15)
  final List<String> mealType;

  RecipeModel({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.difficulty,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.mealType,
  });

  // Factory method to create an instance from a JSON object
  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      id: json['id'],
      name: json['name'],
      ingredients: List<String>.from(json['ingredients']),
      instructions: List<String>.from(json['instructions']),
      prepTimeMinutes: json['prepTimeMinutes'],
      cookTimeMinutes: json['cookTimeMinutes'],
      servings: json['servings'],
      difficulty: json['difficulty'],
      cuisine: json['cuisine'],
      caloriesPerServing: json['caloriesPerServing'],
      tags: List<String>.from(json['tags']),
      userId: json['userId'],
      image: json['image'],
      rating: json['rating'].toDouble(),
      reviewCount: json['reviewCount'],
      mealType: List<String>.from(json['mealType']),
    );
  }

  // Method to convert an instance into a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'ingredients': ingredients,
      'instructions': instructions,
      'prepTimeMinutes': prepTimeMinutes,
      'cookTimeMinutes': cookTimeMinutes,
      'servings': servings,
      'difficulty': difficulty,
      'cuisine': cuisine,
      'caloriesPerServing': caloriesPerServing,
      'tags': tags,
      'userId': userId,
      'image': image,
      'rating': rating,
      'reviewCount': reviewCount,
      'mealType': mealType,
    };
  }
}
