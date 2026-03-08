import 'package:flutter/material.dart';
import 'package:latihan_kuis_123230110/models/animals_data.dart';
import 'package:latihan_kuis_123230110/pages/detail_page.dart';
import 'package:latihan_kuis_123230110/pages/login_page.dart';
import 'package:latihan_kuis_123230110/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.username});
  final String username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),

      appBar: AppBar(
        title: Text(
          _selectedIndex == 0 ? "Animal List" : "Profile",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            color: Colors.white,
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      'Logout',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                      ),
                    ),

                    content: const Text('Yakin ingin Logout?'),

                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),

                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const LoginPage();
                              },
                            ),
                          );
                        },
                        child: const Text('Logout'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),

      body: _selectedIndex == 0
          ? _buildAnimalGrid()
          : ProfilePage(username: widget.username),
    );
  }

  Widget _buildAnimalGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: dummyAnimals.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.8,
      ),
      itemBuilder: (context, index) {
        final animal = dummyAnimals[index];

        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailPage(animal: animal,);
                },
              ),
            );
          },

          child: Card(
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Image.network(
                  animal.image,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),

                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        animal.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Tipe : ${animal.type}"),
                      Text("Habitat : ${animal.habitat.join(', ')}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
