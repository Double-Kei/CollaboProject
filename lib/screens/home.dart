import 'package:flutter/material.dart';
import 'package:multi_store_app/minor_screens/search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 10,
      child: Scaffold(
        appBar: AppBar(
          title: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchScreen()));
            },
            child: Container(
              height: 35,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.yellow, width: 1.4),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,  
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(Icons.search, color: Colors.grey,),
                      ),
                      Text("What are you looking for?", style: TextStyle(fontSize: 16, color: Colors.grey),),
                    ],
                  ),
                  Container(
                    height: 32,
                    width: 75,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Center(
                      child: Text("Search", style: TextStyle(fontSize: 16, color: Colors.grey),)
                    ),
                  ),
                ],
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.yellow,
            indicatorWeight: 8,
            tabs: [
              RepeatedTab(label: "Accessories",),
              RepeatedTab(label: "Bags",),
              RepeatedTab(label: "Beauty",),
              RepeatedTab(label: "Electronics",),
              RepeatedTab(label: "Home & Garden",),
              RepeatedTab(label: "Inapp",),
              RepeatedTab(label: "Kids",),
              RepeatedTab(label: "Men",),
              RepeatedTab(label: "Shoes",),
              RepeatedTab(label: "Women",),
            ],
          ),
        ),
        body: const TabBarView(children: [
          Center(child: Text("Accessories Page in Screen"),),
          Center(child: Text("Bags Page in Screen"),),
          Center(child: Text("Beauty Page in Screen"),),
          Center(child: Text("Electronics Page in Screen"),),
          Center(child: Text("Home & Garden Page in Screen"),),
          Center(child: Text("Inapp Page in Screen"),),
          Center(child: Text("Kids Page in Screen"),),
          Center(child: Text("Men Page in Screen"),),
          Center(child: Text("Shoes Page in Screen"),),
          Center(child: Text("Women Page in Screen"),),
        ]),
      ),
    );
  }
}

class RepeatedTab extends StatelessWidget {
  final String label;
  const RepeatedTab({
    Key? key, required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(child: Text(label, style: TextStyle(color: Colors.grey.shade600),),);
  }
}