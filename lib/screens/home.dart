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
          bottom: TabBar(
            tabs: [
              Tab(child: Text("Men", style: TextStyle(color: Colors.grey.shade600),),),
              Tab(child: Text("Women", style: TextStyle(color: Colors.grey.shade600),),),
              Tab(child: Text("Shoes", style: TextStyle(color: Colors.grey.shade600),),),
            ],
          ),
        ),
      ),
    );
  }
}