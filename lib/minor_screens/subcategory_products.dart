import 'package:flutter/material.dart';

class SubCategoryProducts extends StatelessWidget {
  const SubCategoryProducts({Key? key, required this.mainCategoryName, required this.subCategoryName}) : super(key: key);

  final String subCategoryName;
  final String mainCategoryName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,),
          onPressed:() {
            Navigator.pop(context);
          },
        ),
        title: Text(subCategoryName, style: TextStyle(color: Colors.black),),
      ),
      body: Center(child: Text(mainCategoryName)),
    );
  }
}