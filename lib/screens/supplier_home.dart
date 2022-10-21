import 'package:flutter/material.dart';
import 'package:multi_store_app/screens/home.dart';
import 'package:multi_store_app/screens/category.dart';
import 'package:multi_store_app/screens/storescreen.dart';

class SupplierHomeScreen extends StatefulWidget {
  const SupplierHomeScreen({Key? key}) : super(key: key);

  @override
  State<SupplierHomeScreen> createState() => _SupplierHomeScreenState();
}

// Example : BottomNavigatorBar
class _SupplierHomeScreenState extends State<SupplierHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = const [
    HomeScreen(),
    CategoryScreen(),
    StoresScreen(),
    Center(child: Text("Dashboard"),),
    Center(child: Text("Upload"),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color.fromRGBO(0, 0, 0, 1),
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedItemColor: Colors.red,
        elevation: 0,
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Category"),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: "Stores"),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Dashboard"),
          BottomNavigationBarItem(icon: Icon(Icons.upload), label: "Upload"),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
