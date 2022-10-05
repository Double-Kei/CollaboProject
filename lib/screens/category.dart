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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const BaseSearch(),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Stack(children: [
        Positioned(bottom: 0, left: 0, child: sideNavigator(size)),
        Positioned(bottom: 0, right: 0, child: categoryView(size)),
      ],),
    );
  }

  Widget sideNavigator (Size size){
    return Container(
      height: size.height * 0.8, 
      width: size.width * 0.2, 
      color: Colors.grey.shade300,
    );
  }

  Widget categoryView (Size size){
    return Container(
      height: size.height * 0.8, 
      width: size.width * 0.8, 
      color: Colors.white,
    );
  }
}