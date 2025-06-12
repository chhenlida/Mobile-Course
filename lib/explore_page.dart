import 'package:flutter/material.dart';

import 'search_result_screen.dart';

class ExplorePage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  ExplorePage({super.key});

  void _startSearch(BuildContext context) {
    final keyword = _searchController.text.trim();
    if (keyword.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SearchResultsScreen(keyword: keyword),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Worktency",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0xFF1C3594),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.search, color: Colors.grey),
                      onPressed: () => _startSearch(context),
                    ),
                    const SizedBox(width: 16),
                    const Icon(Icons.person_outline, color: Colors.grey),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _searchController,
              onSubmitted: (_) => _startSearch(context),
              decoration: InputDecoration(
                hintText: 'Find your interested course...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () => _searchController.clear(),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Unlock Your Potential with",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),
            const Text(
              "Worktency",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color(0xFFC05E1D),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Discover industry-leading courses designed to equip you with real-world skills. Join our community and start your journey to success today.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 40),
            Center(
              child: Image.asset(
                'asset/Screenshot 2025-05-25 152520.png',
                height: 220,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.explore),
                label: const Text("Explore Courses"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEAF2FF),
                  foregroundColor: const Color(0xFF0066CC),
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Join as an educator"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF8402),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              "Why Choose Worktency?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildWhyItem(image: 'asset/Screenshot 2025-05-25 163641.png', label: 'Expert Instructors'),
                _buildWhyItem(image: 'asset/Screenshot 2025-05-25 163651.png', label: 'Flexible Learning'),
                _buildWhyItem(image: 'asset/Screenshot 2025-05-25 163656.png', label: 'Hands-On Learning'),
              ],
            ),
            const SizedBox(height: 30),
            const Text("Featured Course", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Text("Artificial Intelligent", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Machine Learning", style: TextStyle(color: Colors.grey)),
                Text("Self Development", style: TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 16),
            _buildCourseList(),
            const SizedBox(height: 20),
            _buildCourseList(),
            const SizedBox(height: 30),
            const Text("Meet Our Teachers", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTeacherCard("Dr.VALY Dona", "Researcher, AI Specialist", 'asset/teacher.png'),
                  _buildTeacherCard("HOK Tin", "Web Developer", 'asset/Screenshot 2025-05-25 173008.png'),
                  _buildTeacherCard("HENG Rothpisey", "Lecturer at ITC", 'asset/teacher.png'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: const [
                Icon(Icons.double_arrow, color: Colors.orange),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "To reach our only One goal, what we can share with you today",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Column(
              children: List.generate(4, (_) => _buildArticleCard()),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: const Text("See more"),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildWhyItem({required String image, required String label}) {
    return Column(
      children: [
        Container(
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.asset(image, fit: BoxFit.contain),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12, color: Colors.orange),
        ),
      ],
    );
  }

  Widget _buildTeacherCard(String name, String title, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imagePath, height: 100, width: 100, fit: BoxFit.cover),
          ),
          const SizedBox(height: 8),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(title, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildArticleCard() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('asset/teacher.png', height: 190, width: 90, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "“Machine learning and AI are the engines driving the technological revolution of our time...",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text("Dr. Valy Dona  •  Professor @ITC  •  Cofounder @Worktency", style: TextStyle(fontSize: 12)),
                SizedBox(height: 6),
                Wrap(
                  spacing: 8,
                  children: [
                    Chip(
                      label: Text("Machine learning"),
                      avatar: Icon(Icons.reddit, size: 12, color: Colors.blue),
                      backgroundColor: Color(0xFFEAF2FF),
                    ),
                    Chip(
                      label: Text("Artificial Intelligent"),
                      avatar: Icon(Icons.circle, size: 12, color: Colors.blue),
                      backgroundColor: Color(0xFFEAF2FF),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCourseList() {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (context, index) {
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.article, size: 50, color: Colors.blue),
                const SizedBox(height: 12),
                const Text("Microsoft Word", style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Row(
                  children: const [
                    Text("✯កំរិតដំបូង", style: TextStyle(fontSize: 10)),
                    Icon(Icons.people_alt, color: Color(0xFF6C6E73)),
                    Text("99នាក់បានរៀន", style: TextStyle(fontSize: 10)),
                    Spacer(),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 12,
                      backgroundImage: AssetImage('asset/teacher.png'),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "Mr. Bunthorn Liv\nProfessor @ITC",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Icon(Icons.attach_money),
                    Text("39.99", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("About Us", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Contact Us", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("FAQs", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Community Forum", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Term of Service", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Careers", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Leadership", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Blog", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Social Impact", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Cookies Setting", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Terms", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Accessibility Statement", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Investors", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("GO Pro Course", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Affiliate", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text("Certified", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        const SizedBox(height: 10),
        Image.asset(
          'asset/Institute_of_Technology_of_Cambodia_logo.png',
          height: 180,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.facebook, size: 28),
            SizedBox(width: 16),
            Icon(Icons.play_circle_fill, size: 28),
          ],
        ),
        const SizedBox(height: 12),
        const Text(
          '2023 © Worktency, Inc. All rights reserved.',
          style: TextStyle(fontSize: 12, color: Colors.grey),
        ),
      ],
    );
  }
}