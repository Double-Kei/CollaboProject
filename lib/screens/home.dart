import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const CupertinoSearchTextField(),
          elevation: 0,
          backgroundColor: Colors.white,
          bottom: const TabBar(
            tabs: [
              RepeatedTab(label: "Men",),
              RepeatedTab(label: "Women",),
              RepeatedTab(label: "Shoes",),
            ],
          ),
        ),
        body: const TabBarView(children: [
          Center(child: Text("Men Page in Screen"),),
          Center(child: Text("Women Page in Screen"),),
          Center(child: Text("Shoes Page in Screen"),),
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