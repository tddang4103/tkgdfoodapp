import 'package:flutter_app/model/meal_category.dart';
import 'package:flutter_app/model/meal_item.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'dart:convert';

class MealController extends GetxController {
  var categories = <MealCategory>[].obs;
  var meals = <MealItem>[].obs;
  var selectedCategoryIndex = 0.obs;

  late Box<MealItem> favoriteBox;

  @override
  void onInit() {
    super.onInit();
    favoriteBox = Hive.box<MealItem>('favorites');
    fetchCategories();
  }

  Future<void> fetchCategories() async {
    final res = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/categories.php'),
    );
    final data = jsonDecode(res.body);

    categories.value = List<MealCategory>.from(
      data['categories'].map((x) => MealCategory.fromJson(x)),
    );

    if (categories.isNotEmpty) {
      fetchMealsByCategory(categories[0].name);
    }
  }

  Future<void> fetchMealsByCategory(String categoryName) async {
    meals.clear();

    final res = await http.get(
      Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/filter.php?c=$categoryName',
      ),
    );
    final data = jsonDecode(res.body);

    if (data['meals'] != null) {
      List mealsData = data['meals'];

      for (var meal in mealsData) {
        final id = meal['idMeal'];
        final detailRes = await http.get(
          Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id'),
        );
        final detailData = jsonDecode(detailRes.body);

        if (detailData['meals'] != null) {
          final detailedMeal = MealItem.fromJson(detailData['meals'][0]);
          meals.add(detailedMeal);
        }
      }
    }
  }

  void selectCategory(int index) {
    selectedCategoryIndex.value = index;
    final selectedCategory = categories[index].name;
    fetchMealsByCategory(selectedCategory);
  }

  /// ✅ Kiểm tra món đã lưu chưa
  bool isFavorite(MealItem meal) {
    return favoriteBox.values.any((item) => item.id == meal.id);
  }

  /// ❤️ Lưu hoặc gỡ lưu món ăn
  void toggleFavorite(MealItem meal) {
    final existingKey = favoriteBox.keys.firstWhere(
      (k) => favoriteBox.get(k)?.id == meal.id,
      orElse: () => null,
    );

    if (existingKey != null) {
      favoriteBox.delete(existingKey);
    } else {
      favoriteBox.add(meal);
    }

    update(); // thông báo cho các widget đang dùng controller này
  }

  /// 🔁 Trả về danh sách món đã lưu
  List<MealItem> getFavorites() {
    return favoriteBox.values.toList();
  }
}
