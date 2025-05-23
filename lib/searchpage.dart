import 'package:flutter/material.dart';
import 'package:flutter_app/formulapage.dart';
import 'package:flutter_app/mainpage.dart';
import 'package:flutter_app/bottomsheet.dart';
import 'package:flutter_app/profilepage.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  int _currentIndex = 1;

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
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Bánh táo',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    builder: (context) => FilterBottomSheet(),
                  );
                },
                child: Icon(
                  Icons.filter_list_alt,
                  color: Colors.amber,
                  size: 40,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: 4,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return _buildSearchItem();
          },
        ),
      ),
    );
  }

  Widget _buildSearchItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Image.asset(
                  'assets/images/foodapp.jpg',
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.favorite, color: Colors.red, size: 20),
                ),
              ),
            ],
          ),

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Salad Bò kiểu Thái',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'By Little Pony',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                    SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          Icon(Icons.history, color: Colors.amber),
                          Text('20m'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
