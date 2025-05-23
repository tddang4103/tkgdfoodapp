class MealCategory {
  final String name;
  final String thumb;
  final String description;

  MealCategory({
    required this.name,
    required this.thumb,
    required this.description,
  });

  factory MealCategory.fromJson(Map<String, dynamic> json) {
    return MealCategory(
      name: json['strCategory'],
      thumb: json['strCategoryThumb'],
      description: json['strCategoryDescription'],
    );
  }
}
