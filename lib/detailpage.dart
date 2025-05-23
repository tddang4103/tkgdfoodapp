import 'package:flutter/material.dart';
import 'package:flutter_app/mainpage.dart';
import 'package:flutter_app/model/meal_item.dart';

class DetailPage extends StatefulWidget {
  final MealItem meal;
  const DetailPage({super.key, required this.meal});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final meal = widget.meal;
    if (meal == null || meal.name.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: Text('Chi tiết món ăn')),
        body: Center(child: Text('Không có dữ liệu món ăn')),
      );
    }

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.network(
                          widget.meal.thumbnail,
                          width: double.infinity,
                          height: 288,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 50,
                          left: 16,
                          child: Row(
                            children: [
                              TextButton.icon(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const MainPage(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  'Chi tiết',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80, // chiều cao cố định của khung hình ảnh
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10, // số lượng ảnh
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                'assets/images/foodapp.jpg', // thay bằng ảnh của bạn
                                width: 70,
                                height: 70,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.meal.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(Icons.favorite_outline_rounded, size: 25),
                        ],
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.meal.category} • ${widget.meal.area}',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 18),
                          SizedBox(width: 4),
                          Text('4.2', style: TextStyle(fontSize: 16)),
                          SizedBox(width: 8),
                          Text(
                            '|',
                            style: TextStyle(color: Colors.black, fontSize: 25),
                          ),
                          SizedBox(width: 8),
                          Text(
                            '120 đánh giá',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(
                              'assets/images/avatar.jpg',
                            ),
                            radius: 28,
                          ),
                          SizedBox(width: 10),

                          Text(
                            'Đinh Trọng Phúc',
                            style: TextStyle(color: Colors.amber, fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Center(
                        child: Container(
                          height: 4,
                          width: 1000,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'Nguyên liệu',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(width: 8),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text(
                                  'Chế biến',
                                  style: TextStyle(color: Colors.amber),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.meal.instructions),
                          SizedBox(height: 20),
                          Center(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: Icon(
                                Icons.play_circle_fill,
                                size: 30,
                                color: Colors.amber,
                              ),
                              label: Text(
                                'Xem video',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.amber,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow[100],
                                foregroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 120,
                                  vertical: 16,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
