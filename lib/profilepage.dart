import 'package:flutter/material.dart';
import 'package:flutter_app/formulapage.dart';
import 'package:flutter_app/mainpage.dart';
import 'package:flutter_app/searchpage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 3;

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
                  color: currentIndex == 0 ? Colors.amber : Colors.grey,
                ),
                onPressed: () {
                  if (currentIndex != 0) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                    setState(() {
                      currentIndex = 0;
                    });
                  }
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: currentIndex == 1 ? Colors.amber : Colors.grey,
                ),
                onPressed: () {
                  if (currentIndex != 1) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPage()),
                    );
                    setState(() {
                      currentIndex = 1;
                    });
                  }
                },
              ),
              const SizedBox(width: 48),
              IconButton(
                icon: Icon(
                  Icons.bookmark_border,
                  color: currentIndex == 2 ? Colors.amber : Colors.grey,
                ),
                onPressed: () {
                  if (currentIndex != 2) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => FormulaPage()),
                    );
                    setState(() {
                      currentIndex = 2;
                    });
                  }
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.person_outline,
                  color: currentIndex == 3 ? Colors.amber : Colors.grey,
                ),
                onPressed: () {
                  if (currentIndex != 3) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                    setState(() {
                      currentIndex = 3;
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
          'Trang cá nhân',
          style: TextStyle(color: Colors.amber, fontSize: 18),
        ),
        centerTitle: true,
        actions: const [Icon(Icons.more_vert, color: Colors.amber)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/avatar.jpg'),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Nguyễn Đình Trọng',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Column(
                  children: [
                    Text('Bài viết', style: TextStyle(fontSize: 16)),
                    Text(
                      '100',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Text('|', style: TextStyle(fontSize: 40)),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text('Người theo dõi', style: TextStyle(fontSize: 16)),
                    Text(
                      '100',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Text('|', style: TextStyle(fontSize: 40)),
                SizedBox(width: 10),
                Column(
                  children: [
                    Text('Theo dõi', style: TextStyle(fontSize: 16)),
                    Text(
                      '100',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Follow",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.amber),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Message",
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Danh sách yêu thích",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 15,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (_, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/pizza.jpg',
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
