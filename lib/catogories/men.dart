import 'package:flutter/material.dart';
import 'package:multi_store_app/utilities/categ_list.dart';

import '../minor_screens/subcategory_products.dart';

class MenCategory extends StatelessWidget {
  const MenCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text("Men", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, letterSpacing: 1.5),),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.68,
                    child: GridView.count(
                      mainAxisSpacing: 70,
                      crossAxisSpacing: 15,
                      crossAxisCount: 3, 
                      children: List.generate(men.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SubCategoryProducts(mainCategoryName: "Men",  subCategoryName: men[index],)));
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                height: 65, 
                                width: 65,
                                child: Image(image: AssetImage("images/men/men$index.jpg")),
                              ),
                              Text(men[index])
                            ],
                          ),
                        );
                      }
                    ),),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              decoration: BoxDecoration(color: Colors.brown.withOpacity(0.2)),
            ),
          )
        )
      ],
    );
  }
}