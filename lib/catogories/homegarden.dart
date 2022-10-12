import 'package:flutter/material.dart';
import 'package:multi_store_app/utilities/categ_list.dart';
import 'package:multi_store_app/widgets/category_widgets.dart';

class HomegardenCategory extends StatelessWidget {
  const HomegardenCategory({Key? key}) : super(key: key);

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
                    const CategoryHeader(headerLabel: 'Homegarden',),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.68,
                      child: GridView.count(
                        mainAxisSpacing: 70,
                        crossAxisSpacing: 15,
                        crossAxisCount: 3, 
                        children: List.generate(homeandgarden.length, (index) {
                          return SubCategoryModel(
                            mainCategoryName: "homegarden",
                            subCategoryName: homeandgarden[index],
                            assetName: 'images/homegarden/home$index.jpg',
                            subCategoryLabel: homeandgarden[index],
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
            child: SiderBar(mainCategoryName: "homegarden",)
          )
        ],
      ),
    );
  }
}