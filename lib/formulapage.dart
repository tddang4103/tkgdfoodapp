import 'package:flutter/material.dart';
import 'package:flutter_app/mainpage.dart';
import 'package:flutter_app/profilepage.dart';
import 'package:flutter_app/searchpage.dart';

class FormulaPage extends StatefulWidget {
  const FormulaPage({super.key});

  @override
  State<FormulaPage> createState() => _FormulaPageState();
}

class _FormulaPageState extends State<FormulaPage> {
  int _currentIndex = 2;

  List<String> anh = ['pizza.jpg', 'banhngot.jpg', 'hamburger.jpg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        leading: Icon(Icons.arrow_back, color: Colors.amber),
        title: Text(
          'Công thức',
          style: TextStyle(color: Colors.amber, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Video",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow[100],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 5),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Công thức",
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    width: 361,
                    height: 260,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            'assets/images/${anh[index]}',
                            width: double.infinity,
                            height: 140,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                              Text('Cách chiên trứng một cách cung phu'),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 20,
                                    backgroundImage: AssetImage(
                                      'assets/images/avatar.jpg',
                                    ),
                                  ),
                                  SizedBox(width: 15),
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
          ],
        ),
      ),
    );
  }
}
