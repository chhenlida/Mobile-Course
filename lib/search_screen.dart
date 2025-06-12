import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController _searchController = TextEditingController();
  final List<String> allCourses = [
    'Computer Network',
    'Cyber Security',
    'Cryptography',
    'Network Administrator',
    'Operating Systems',
    'Data Structures',
  ];

  List<String> filteredCourses = [];

  @override
  void initState() {
    super.initState();
    filteredCourses = List.from(allCourses); // show all initially
  }

  void _searchCourses(String query) {
    setState(() {
      filteredCourses = allCourses
          .where((course) =>
              course.toLowerCase().contains(query.toLowerCase().trim()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("workteeny", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () => _searchCourses(_searchController.text),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for documents',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: _searchCourses, // filters as you type
              onSubmitted: _searchCourses,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredCourses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading:
                      const Icon(Icons.description, color: Colors.blue),
                  title: Text(
                    filteredCourses[index],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('College of Technology'),
                  trailing: const Icon(Icons.bookmark_border),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
