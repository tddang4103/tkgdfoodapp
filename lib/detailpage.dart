import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
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
                        Image.asset(
                          'assets/images/bgfood.jpg',
                          width: double.infinity,
                          height: 288,
                          fit: BoxFit.cover,
                          cacheWidth: 300,
                        ),
                        Positioned(
                          top: 50,
                          left: 16,
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back, color: Colors.white),
                              Text(
                                'Chi tiết',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
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
                            'Cách chiên trứng một cách cung phu',
                            style: TextStyle(
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
                          'Cách chiên trứng một cách cung phu',
                          style: TextStyle(fontSize: 17),
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
                          Text(
                            'Dành cho 2–4 người ăn',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('- 300g chân gà, luộc trong 20 phút'),
                          Text('- 2 chiếc xúc xích bò'),
                          Text('- 5 viên thịt bò'),
                          Text('- 100g bắp cải tím, luộc cho đến khi mềm'),
                          Text('- 1 quả trứng, đập tan'),
                          Text('- 50g cà rốt xanh, cắt thành 4 miếng'),
                          SizedBox(height: 20),
                          Text(
                            'Đối với bột gia vị',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('- 15g tỏi'),
                          Text('- 10g hành tím'),
                          Text('- 25g hành tây'),
                          Text('- 15g bột ớt'),
                          Text('- 100g đường'),
                          Text('- 50g xì dầu'),
                          Text('- 15g đường thốt nốt'),
                          Text('- 25g mật ong'),
                          Text('- 50ml dầu ăn'),
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
