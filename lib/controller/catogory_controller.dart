import 'package:flutter_app/model/meal_category.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MealCategoryController extends GetxController {
  // Danh sách các danh mục
  var categories = <MealCategory>[].obs;

  // Chỉ số danh mục đang được chọn
  var selectedCategoryIndex = 0.obs;

  // Chọn danh mục
  void selectCategory(int index) {
    if (index >= 0 && index < categories.length) {
      selectedCategoryIndex.value = index;
    }
  }

  // Gọi API lấy danh mục từ TheMealDB
  Future<void> fetchMealCategories() async {
    const url = 'https://www.themealdb.com/api/json/v1/1/categories.php';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List list = data['categories'];
        categories.value =
            list.map((item) => MealCategory.fromJson(item)).toList();
      } else {
        Get.snackbar('Lỗi', 'Không thể tải danh mục: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar('Lỗi', 'Đã xảy ra lỗi: $e');
    }
  }

  // Gọi khi controller được khởi tạo
  @override
  void onInit() {
    super.onInit();
    fetchMealCategories();
  }
}
