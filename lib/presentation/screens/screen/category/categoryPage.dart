import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Category Selection', theme: ThemeData(primarySwatch: Colors.blue,),
      home: CategorySelectionPage(),
    );
  }
}

class CategorySelectionPage extends StatelessWidget {
  final List<CategoryOption> categories = [
    CategoryOption(
      title: 'Books',
      icon: Icons.book,
    ),
    CategoryOption(
      title: 'Gadgets',
      icon: Icons.phone,
    ),
    CategoryOption(
      title: 'Room Essentials',
      icon: Icons.home,
    ),
    CategoryOption(
      title: 'Kitchen Appliances',
      icon: Icons.kitchen,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: List.generate(categories.length, (index) {
            return CategoryCard(
              title: categories[index].title,
              icon: categories[index].icon,
            );
          }),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryCard({required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      color: Colors.white,
      child: InkWell(
        onTap: () {
          // Handle category selection here
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 32,
                color: Colors.black,
              ),
              SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryOption {
  final String title;
  final IconData icon;

  CategoryOption({required this.title, required this.icon});
}
