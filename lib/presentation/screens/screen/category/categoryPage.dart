import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sellingportal/logic/cubits/category/category_cubit.dart';
import 'package:sellingportal/presentation/screens/screen/sellFormScreens/stepperMainPage.dart';
import 'package:sellingportal/presentation/widget/bottomBarIcons.dart';


class CategorySelectionPage extends StatelessWidget {
  static const String routeName = "CategorySelectionPage";
  final List<CategoryOption> categories = [
    CategoryOption(
      title: 'Gadgets',
      icon: FontAwesomeIcons.calculator,
    ),
    CategoryOption(
      title: 'Books',
      icon: FontAwesomeIcons.book,
    ),
    CategoryOption(
      title: 'Room Essentials',
      icon: FontAwesomeIcons.bed,
    ),
    CategoryOption(
      title: 'Kitchen Appliances',
      icon: Icons.microwave,
    ),
  ];
  categoryIcons catIcon = categoryIcons();
  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CategoryCubit>(context);
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
          children: List.generate(cubit.state.categories.length, (index) {
            final category = cubit.state.categories[index];
            return CategoryCard(
              title: category.title!,
              icon: categories[index].icon,
              catid: category.sId!,
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
  final String catid;

  const CategoryCard({required this.title, required this.icon,required this.catid});

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
          Navigator.pushNamed(context, FormPage.routeName,arguments: catid);
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
