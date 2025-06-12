import 'package:flutter/material.dart';

// Course model
class Course {
  final String title;
  final String description;
  final String image;

  Course({
    required this.title,
    required this.description,
    required this.image,
  });
}

class SearchResultsScreen extends StatefulWidget {
  final String keyword;

  const SearchResultsScreen({super.key, required this.keyword});

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  bool showAllCourses = false;

  @override
  Widget build(BuildContext context) {
    final baseCourse = Course(
      title: 'Computer Network',
      description:
          'A network is a system that links computers and devices to share resources and exchange data, enabling communication and access to shared services, whether locally or remotely through internet-based infrastructure.',
      image: 'asset/OIP.jpg',
    );

    final allCourses = List<Course>.generate(
      43,
      (index) => Course(
        title: '${baseCourse.title} ${index + 1}',
        description: baseCourse.description,
        image: baseCourse.image,
      ),
    );

    final filtered = allCourses
        .where((course) =>
            course.title.toLowerCase().contains(widget.keyword.toLowerCase()))
        .toList();

    final visibleCourses =
        showAllCourses ? filtered : filtered.take(16).toList();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                    
                        const SizedBox(width: 8),
                      ],
                    ),
                    Row(
                      children: const [
                        Icon(Icons.search, color: Colors.black),
                        SizedBox(width: 16),
                        Icon(Icons.account_circle, color: Colors.black),
                      ],
                    )
                  ],
                ),
              ),

              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Network',
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // Tab Row
              SizedBox(
                height: 48,
                child: Row(
                  children: [
                    const SizedBox(width: 16),
                    _buildTab('All', 43, isActive: true),
                    _buildTab('Courses', 22),
                    _buildTab('Projects', 3),
                    _buildTab('PRO sessions', 3, isPro: true),
                  ],
                ),
              ),
              const Divider(height: 1),

              // Course Cards
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    for (final course in visibleCourses)
                      CourseCard(course: course),
                    if (!showAllCourses && filtered.length > 16)
                      TextButton(
                        onPressed: () {
                          setState(() {
                            showAllCourses = true;
                          });
                        },
                        child: const Text('Show all'),
                      ),
                  ],
                ),
              ),

              // Footer
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String label, int count,
      {bool isActive = false, bool isPro = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: TextStyle(
                    color: isPro ? Colors.red : Colors.black,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                TextSpan(
                  text: ' ($count)',
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 30,
              color: Colors.orange,
            ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Column(
      children: [
        const Divider(thickness: 1),
        const SizedBox(height: 16),
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
        const SizedBox(height: 30),
      ],
    );
  }
}

class CourseCard extends StatefulWidget {
  final Course course;

  const CourseCard({super.key, required this.course});

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                widget.course.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.course.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.course.description,
                    maxLines: expanded ? null : 2,
                    overflow: expanded
                        ? TextOverflow.visible
                        : TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        expanded ? 'See less...' : 'See more...',
                        style: TextStyle(
                          color: Colors.orange.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      const Text('កម្រិតដំបូង', style: TextStyle(fontSize: 12)),
                      const SizedBox(width: 12),
                      const Icon(Icons.remove_red_eye, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      const Text('99 នាក់បានរៀន', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
