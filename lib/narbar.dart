import 'package:flutter/material.dart';
import 'package:tp4/explore_page.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _page = [
    Center(
      child: Text("My Course Screen"),
    ),

    Center(
      child: Text("Online Course Screen"),
    ),
    ExplorePage(),
    Center(
      child: Text("Category Screen"),
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 0 ? _buildMainContent() : _page[_selectedIndex],
      bottomNavigationBar: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey, width: 0.3)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BottomAppBar(
                  color: Colors.white,
                  child: SizedBox(
                    // height: ,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildNavItem(Icons.explore, "Explore", 0),
                        _buildNavItem(Icons.menu_book, "My Course", 1),
                        _buildNavItem(Icons.play_circle_fill, "Online Course", 2),
                        _buildNavItem(Icons.category, "Category", 3)
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildMainContent() {
    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final _isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: _isSelected ? const Color(0xFFFF8402) : Colors.grey),
            const SizedBox(
              height: 4,
            ),
            Text(
              label,
              style: TextStyle(
                color: _isSelected ? const Color(0xFFFF8402) : Colors.grey,
                fontSize: 14,
              ),
            )
          ],
        ),
      ),
    );
  }
}