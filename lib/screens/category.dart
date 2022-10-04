import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/base_search.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const BaseSearch(),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(),
    );
  }
}