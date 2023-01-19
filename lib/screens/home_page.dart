import 'package:flutter/material.dart';
import 'package:to_buy/screens/bought_page.dart';
import 'package:to_buy/screens/to_buy_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isToBuyScreen = true;
  int currentPageIndex = 0; 

  Widget currentPage() {
    if(currentPageIndex == 0) {
      return const ToBuyScreen();
    } else {
      return const BoughtPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentPage(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: "To buy",
            icon: Icon(
              Icons.attach_money_rounded
            )
          ),
          BottomNavigationBarItem(
            label: "Bought",
            icon: Icon(
              Icons.attach_money_rounded
            )
          ),
        ]
      ),
    );
  }
}