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
          Text(subCategoryLabel, style: const TextStyle(fontSize: 11),)
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

const style = TextStyle(color: Colors.brown, fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 10);
class SiderBar extends StatelessWidget {
  final String mainCategoryName;

  const SiderBar({
    Key? key, required this.mainCategoryName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Container(
          decoration: BoxDecoration(color: Colors.brown.withOpacity(0.2), borderRadius: BorderRadius.circular(50),),
          child: RotatedBox(
            quarterTurns: 3, 
            child: Row( 
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                mainCategoryName == "women" ? const Text("") : const Text("<<", style: style,),
                Text(mainCategoryName.toUpperCase(), style: style),
                mainCategoryName == "accessories" ? const Text("") : const Text(">>", style: style)
              ],
            ),),
        ),
      ),
    );
  }
}