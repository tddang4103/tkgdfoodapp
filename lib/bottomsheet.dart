import 'package:flutter/material.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final selectedCategories = <String>{};
    final selectedIngredients = <String>{};
    final selectedRegions = <String>{};

    final danhMuc = ['Danh mục 1', 'Danh mục 2', 'Danh mục 3', 'Danh mục 4'];
    final nguyenLieu = ['Thịt gà', 'Thịt heo', 'Danh mục', 'Ức gà', 'Chân gà'];
    final khuVuc = ['TP.HCM', 'Bình Phước', 'Đồng Nai', 'An Giang', 'Long An'];

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      maxChildSize: 0.95,
      expand: false,
      builder:
          (context, scrollController) => Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
            ),
            child: ListView(
              controller: scrollController,
              children: [
                Center(
                  child: Container(
                    height: 4,
                    width: 60,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Lọc",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedCategories.clear();
                          selectedIngredients.clear();
                          selectedRegions.clear();
                        });
                      },
                      child: TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.yellow[50],
                          minimumSize: const Size(88, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),

                        onPressed: () {},
                        child: Text(
                          'Đặt lại',
                          style: TextStyle(color: Colors.amber, fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: 1,
                    width: 1000,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                _buildSection('Danh mục', danhMuc, selectedCategories),
                _buildSection('Nguyên liệu', nguyenLieu, selectedIngredients),
                _buildSection('Khu vực', khuVuc, selectedRegions),
                const SizedBox(height: 16),
                Center(
                  child: Container(
                    height: 1,
                    width: 1200,
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Xác nhận',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildSection(
    String title,
    List<String> items,
    Set<String> selectedSet,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Stack(
                children: [
                  Icon(Icons.messenger_rounded, size: 30),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Icon(Icons.bolt_sharp, size: 16),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children:
                items.map((item) {
                  final isSelected = selectedSet.contains(item);
                  return ChoiceChip(
                    label: Text(item),
                    selected: isSelected,
                    selectedColor: Colors.amber[700],
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          selectedSet.add(item);
                        } else {
                          selectedSet.remove(item);
                        }
                      });
                    },
                    backgroundColor: Colors.grey[200],
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }
}
