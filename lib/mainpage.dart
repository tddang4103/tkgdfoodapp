import 'package:flutter/material.dart';
import 'package:flutter_app/formulapage.dart';
import 'package:flutter_app/profilepage.dart';
import 'searchpage.dart';
import 'detailpage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedCategoryIndex = 0;

  final List<String> danhMuc = ['Danh mục 1', 'Danh mục 2', 'Danh mục 3'];

  List<String> nguyenLieuDanhMuc = [
    'Danh mục 1',
    'Danh mục 2',
    'Danh mục 3',
    'Danh mục 4',
    'Danh mục 5',
  ];

  int selectedNguyenLieuIndex = 0;

  int _currentIndex = 0;

  List<String> searchHistory = [
    'Pizza hến xào',
    'Pipi đút lò',
    'Pizza thơm',
    'Pizza hải sản',
    'Pizza thịt xông khói',
  ];

  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (isSearching) {
          setState(() {
            isSearching = false;
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: Container(
          width: 65,
          height: 65,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [const Color.fromARGB(255, 109, 78, 31), Colors.amber],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 6,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: RawMaterialButton(
            shape: CircleBorder(),
            onPressed: () {},
            child: Icon(Icons.add, color: Colors.white, size: 30),
          ),
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

        bottomNavigationBar: SizedBox(
          height: 90,
          child: BottomAppBar(
            color: Colors.white,
            shape: const CircularNotchedRectangle(),
            notchMargin: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: _currentIndex == 0 ? Colors.amber : Colors.grey,
                  ),
                  onPressed: () {
                    if (_currentIndex != 0) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                      setState(() {
                        _currentIndex = 0;
                      });
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: _currentIndex == 1 ? Colors.amber : Colors.grey,
                  ),
                  onPressed: () {
                    if (_currentIndex != 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => SearchPage()),
                      );
                      setState(() {
                        _currentIndex = 1;
                      });
                    }
                  },
                ),
                const SizedBox(width: 48),
                IconButton(
                  icon: Icon(
                    Icons.bookmark_border,
                    color: _currentIndex == 2 ? Colors.amber : Colors.grey,
                  ),
                  onPressed: () {
                    if (_currentIndex != 2) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => FormulaPage()),
                      );
                      setState(() {
                        _currentIndex = 2;
                      });
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.person_outline,
                    color: _currentIndex == 3 ? Colors.amber : Colors.grey,
                  ),
                  onPressed: () {
                    if (_currentIndex != 3) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                      setState(() {
                        _currentIndex = 3;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                if (isSearching)
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      setState(() {
                        isSearching = false;
                      });
                    },
                  ),
                Expanded(
                  child: TextField(
                    onTap: () {
                      setState(() {
                        isSearching = true;
                      });
                    },

                    decoration: const InputDecoration(
                      hintText: 'Tìm kiếm sản phẩm',
                      border: InputBorder.none,
                      icon: Icon(Icons.search),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        body:
            isSearching
                ? Padding(
                  padding: const EdgeInsets.all(16),
                  child: ListView.builder(
                    itemCount: searchHistory.length,
                    itemBuilder: (context, index) {
                      final item = searchHistory[index];
                      return ListTile(
                        leading: const Icon(Icons.history),
                        title: Text(item),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                        onTap: () {},
                      );
                    },
                  ),
                )
                : SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'TP. Hồ Chí Minh',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Xem tất cả',
                              style: TextStyle(
                                color: Colors.amber[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      SizedBox(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 12),
                              width: 250,
                              height: 252,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 4,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              const BorderRadius.vertical(
                                                top: Radius.circular(12),
                                              ),
                                          child: Image.asset(
                                            'assets/images/foodapp.jpg',
                                            height: 140,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),

                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: Icon(
                                              Icons.play_circle_fill_outlined,
                                              size: 50,
                                              color: Colors.white.withAlpha(
                                                (0.9 * 255).toInt(),
                                              ),
                                            ),
                                          ),
                                        ),

                                        Positioned(
                                          top: 8,
                                          left: 8,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 9,
                                              vertical: 3,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.yellow[700],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  size: 18,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(height: 4),
                                                Text(
                                                  '5',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                '1 tiếng 20 phút',
                                                style: TextStyle(
                                                  color: Colors.blue,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Icon(Icons.favorite_border),
                                            ],
                                          ),
                                          Text(
                                            'Cách chiên trứng một cách cung phu',
                                          ),
                                          SizedBox(height: 15),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 25,
                                                backgroundImage: AssetImage(
                                                  'assets/images/avatar.jpg',
                                                ),
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                'Đinh Trọng Phúc',
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.amber,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Danh mục',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Xem tất cả',
                                  style: TextStyle(
                                    color: Colors.amber[700],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 10),

                          SizedBox(
                            height: 40,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: danhMuc.length,
                              itemBuilder: (context, index) {
                                final isSelected =
                                    selectedCategoryIndex == index;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      selectedCategoryIndex = index;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 8),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color:
                                          isSelected
                                              ? Colors.amber
                                              : Colors.grey[200],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      danhMuc[index],
                                      style: TextStyle(
                                        color:
                                            isSelected
                                                ? Colors.white
                                                : Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 16),

                          SizedBox(
                            height: 180,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: _buildItemsForSelectedCategory(),
                              ),
                            ),
                          ),

                          const SizedBox(height: 10),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Công thức gần đây',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                height: 250,

                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 0,
                                  ),
                                  itemCount: 5,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      width: 200,
                                      margin: const EdgeInsets.only(right: 0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                            child: Image.asset(
                                              'assets/images/trungchien.jpg',
                                              width: 180,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Trứng chiên',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF5E3C00),
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 20,
                                                backgroundImage: AssetImage(
                                                  'assets/images/avatar.jpg',
                                                ),
                                              ),
                                              const SizedBox(width: 6),
                                              Text(
                                                'Nguyễn Đình Trọng',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.blue[700],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      'Nguyên liệu',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Wrap(
                                      children: List.generate(
                                        nguyenLieuDanhMuc.length,
                                        (index) {
                                          return GestureDetector(
                                            onTap: () {},
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                right: 8,
                                                bottom: 8,
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 8,
                                                  ),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: Colors.grey.shade300,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                nguyenLieuDanhMuc[index],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
      ),
    );
  }

  List<Widget> _buildItemsForSelectedCategory() {
    if (selectedCategoryIndex == 0) {
      return [
        itemCard('Trứng chiên', 'Trần Đình Trọng', '20 phút'),
        itemCard('Trứng chiên', 'Trần Đình Trọng', '20 phút'),
        itemCard('Trứng chiên', 'Trần Đình Trọng', '20 phút'),
        itemCard('Trứng chiên', 'Trần Đình Trọng', '20 phút'),
      ];
    } else if (selectedCategoryIndex == 1) {
      return [
        itemCard('Mì xào bò', 'Trần Đình Trọng', '25 phút'),
        itemCard('Mì xào bò', 'Trần Đình Trọng', '25 phút'),
        itemCard('Mì xào bò', 'Trần Đình Trọng', '25 phút'),
        itemCard('Mì xào bò', 'Trần Đình Trọng', '25 phút'),
        itemCard('Mì xào bò', 'Trần Đình Trọng', '25 phút'),
      ];
    } else {
      return [
        itemCard('Cơm tấm', 'Lê Văn C', '18 phút'),
        itemCard('Cơm tấm', 'Lê Văn C', '18 phút'),
        itemCard('Cơm tấm', 'Lê Văn C', '18 phút'),
        itemCard('Cơm tấm', 'Lê Văn C', '18 phút'),
      ];
    }
  }

  Widget itemCard(String title, String author, String time) {
    return Container(
      width: 140,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF5DC),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/images/foodapp.jpg'),
          ),
          const SizedBox(height: 12),

          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF5D3A00),
            ),
          ),

          const SizedBox(height: 4),

          Text(
            'Tạo bởi\n$author',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12, color: Color(0xFF6A4E2D)),
          ),

          const Spacer(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time,
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
                Icon(Icons.feed_outlined, size: 18, color: Color(0xFF5D3A00)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
