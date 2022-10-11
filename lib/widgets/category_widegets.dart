import 'package:flutter/material.dart';
import 'package:multi_store_app/minor_screens/subcategory_products.dart';

class SubCategoryModel extends StatelessWidget {
  final String mainCategoryName;
  final String subCategoryName;
  final String assetName;
  final String subCategoryLabel;

  const SubCategoryModel({
    Key? key, required this.mainCategoryName, required this.subCategoryName, required this.assetName, required this.subCategoryLabel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategoryProducts(mainCategoryName: mainCategoryName,  subCategoryName: subCategoryName,)));
      },
      child: Column(
        children: [
          SizedBox(
            height: 65, 
            width: 65,
            child: Image(image: AssetImage(assetName)),
          ),
          Text(subCategoryLabel)
        ],
      ),
    );
  }
}

class CategoryHeader extends StatelessWidget {
  final String headerLabel;
  const CategoryHeader({
    Key? key, required this.headerLabel
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(headerLabel, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5),),
    );
  }
}