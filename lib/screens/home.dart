import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/base_search.dart';

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
          title: const BaseSearch(),
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