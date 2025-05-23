import 'package:hive/hive.dart';

part 'meal_item.g.dart';

@HiveType(typeId: 0)
class MealItem extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String thumbnail;

  @HiveField(3)
  final String category;

  @HiveField(4)
  final String area;

  @HiveField(5)
  final String instructions;

  @HiveField(6)
  final String? youtubeUrl;

  @HiveField(7)
  final List<String> ingredients;

  @HiveField(8)
  final List<String> measures;

  MealItem({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.category,
    required this.area,
    required this.instructions,
    this.youtubeUrl,
    required this.ingredients,
    required this.measures,
  });

  factory MealItem.fromJson(Map<String, dynamic> json) {
    List<String> ingredients = [];
    List<String> measures = [];

    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingredient != null &&
          ingredient.toString().trim().isNotEmpty &&
          measure != null &&
          measure.toString().trim().isNotEmpty) {
        ingredients.add(ingredient.toString());
        measures.add(measure.toString());
      }
    }

    return MealItem(
      id: json['idMeal'],
      name: json['strMeal'],
      thumbnail: json['strMealThumb'],
      category: json['strCategory'],
      area: json['strArea'],
      instructions: json['strInstructions'],
      youtubeUrl: json['strYoutube'],
      ingredients: ingredients,
      measures: measures,
    );
  }
}
