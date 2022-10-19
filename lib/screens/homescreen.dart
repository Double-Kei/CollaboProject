import 'package:flutter/material.dart';
import 'package:multi_store_app/screens/cartscreen.dart';
import 'package:multi_store_app/screens/home.dart';
import 'package:multi_store_app/screens/category.dart';
import 'package:multi_store_app/screens/storescreen.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

// Example : BottomNavigatorBar
class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _tabs = const [
    // Center(child: Text("home screen"),),
    HomeScreen(),
    // Center(child: Text("category screen"),),
    CategoryScreen(),
    // Center(child: Text("stores screen"),),
    StoresScreen(),
    // Center(child: Text("cart screen"),),
    CartScreen(),
    Center(child: Text("profile screen"),),
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
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
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


// Example : TopNavigatorBar
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         bottom: const TabBar(
//           tabs: [
//             Tab(text: 'Naver'),
//             Tab(text: 'Daum',),
//             Tab(text: 'Google'),
//           ],
//         ),
//         title: const Text('WebView Test'),
//       ),
//       body: const Center(child: Text("home screen"),),
//     );
//   }
// }