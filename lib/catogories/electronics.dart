import 'package:flutter/material.dart';
import 'package:multi_store_app/utilities/categ_list.dart';
import 'package:multi_store_app/widgets/category_widgets.dart';

class ElectronicsCategory extends StatelessWidget {
  const ElectronicsCategory({Key? key}) : super(key: key);

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
                    const CategoryHeader(headerLabel: 'Electronics',),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.68,
                      child: GridView.count(
                        mainAxisSpacing: 70,
                        crossAxisSpacing: 15,
                        crossAxisCount: 3, 
                        children: List.generate(electronics.length, (index) {
                          return SubCategoryModel(
                            mainCategoryName: "electronics",
                            subCategoryName: electronics[index],
                            assetName: 'images/electronics/electronics$index.jpg',
                            subCategoryLabel: electronics[index],
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
            child: SiderBar(mainCategoryName: "electronics",)
          )
        ],
      ),
    );
  }
}