import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/appbar_widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const AppBarTitle(title: "Dashboard",),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.logout, color: Colors.black,)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView.count(
          mainAxisSpacing: 50,
          crossAxisSpacing: 50,
          crossAxisCount: 2, 
          children: List.generate(6, (index){
            return Card(
              elevation: 20,
              color: Colors.blueGrey.withOpacity(0.7),
              shadowColor: Colors.purpleAccent.shade200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.store, color: Colors.yellowAccent, size: 50,),
                  Text("My Store".toUpperCase(), style: const TextStyle(color: Colors.yellowAccent, fontSize: 24, fontWeight: FontWeight.w600, fontFamily: "Asap", letterSpacing: 2),)
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}