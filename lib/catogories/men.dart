import 'package:flutter/material.dart';
import 'package:multi_store_app/utilities/categ_list.dart';
import 'package:multi_store_app/widgets/category_widegets.dart';

class MenCategory extends StatelessWidget {
  const MenCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.75,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CategoryHeader(headerLabel: 'Men',),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.68,
                      child: GridView.count(
                        mainAxisSpacing: 70,
                        crossAxisSpacing: 15,
                        crossAxisCount: 3, 
                        children: List.generate(men.length, (index) {
                          return SubCategoryModel(
                            mainCategoryName: "men",
                            subCategoryName: men[index],
                            assetName: 'images/men/men$index.jpg',
                            subCategoryLabel: men[index],
                          );
                        }
                      ),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            child: SiderBar(mainCategoryName: "men",)
          )
        ],
      ),
    );
  }
}

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
                const Text("<<", style: TextStyle(color: Colors.brown, fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 10),),
                Text(mainCategoryName.toUpperCase(), style: const TextStyle(color: Colors.brown, fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 10)),
                const Text(">>", style: TextStyle(color: Colors.brown, fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: 10))
              ],
            ),),
        ),
      ),
    );
  }
}