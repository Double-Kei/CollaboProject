import 'package:flutter/material.dart';
import 'package:multi_store_app/catogories/accessories.dart';
import 'package:multi_store_app/catogories/bags.dart';
import 'package:multi_store_app/catogories/beauty.dart';
import 'package:multi_store_app/catogories/electronics.dart';
import 'package:multi_store_app/catogories/homegarden.dart';
import 'package:multi_store_app/catogories/kids.dart';
import 'package:multi_store_app/catogories/men.dart';
import 'package:multi_store_app/catogories/shoes.dart';
import 'package:multi_store_app/catogories/women.dart';
import 'package:multi_store_app/widgets/base_search.dart';


List<ItemsData> items = [
  ItemsData(label: "accessories"),
  ItemsData(label: "bags"),
  ItemsData(label: "beauty"),
  ItemsData(label: "electronics"),
  ItemsData(label: "home & garden"),
  ItemsData(label: "kids"),
  ItemsData(label: "men"),
  ItemsData(label: "shoes"),
  ItemsData(label: "women"),
];

class ItemsData {
  String label;
  bool isSelected;
  ItemsData({required this.label, this.isSelected = false});
}

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    for (var element in items) {
      element.isSelected = false;
    }
    setState(() {
      items[0].isSelected = true;
    });
    super.initState();
  }

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
    return SizedBox(
      height: size.height * 0.8, 
      width: size.width * 0.2, 
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _pageController.animateToPage(index, duration: const Duration(microseconds: 100), curve: Curves.bounceInOut);
              // _pageController.jumpToPage(index);
              // for (var element in items) {
              //   element.isSelected = false;
              // }
              // setState(() {
              //   items[index].isSelected = true;
              // });
            },
            child: Container(
              color: items[index].isSelected == true? Colors.white : Colors.grey.shade300,
              height: 100, 
              child: Center(child: Text(items[index].label)),
            ),
          );
        }
      ),
    );
  }

  Widget categoryView (Size size){
    return Container(
      height: size.height * 0.8, 
      width: size.width * 0.8, 
      color: Colors.white,
      child: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          for (var element in items) {
            element.isSelected = false;
          }
          setState(() {
            items[index].isSelected = true;
          });
        },
        scrollDirection: Axis.vertical,
        children: const [
          AccessoriesCategory(),
          BagsCategory(),
          BeautyCategory(),
          ElectronicsCategory(),
          HomegardenCategory(),
          KidsCategory(),
          MenCategory(),
          ShoesCategory(),
          WomenCategory()
        ],
      ),
    );
  }
}