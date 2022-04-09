import 'package:driver/brand_colors.dart';
import 'package:driver/screens/tabs/earning_tab.dart';
import 'package:driver/screens/tabs/home_tab.dart';
import 'package:driver/screens/tabs/profile_tab.dart';
import 'package:driver/screens/tabs/rating_tab.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;
  void onTaped(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: TabBarView(
          controller: tabController,
          children: [HomeTab(), EarningTab(), RatingTab(), ProfileTab()]),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: BrandColors.colorOrange,
          showUnselectedLabels: true,
          currentIndex: selectedIndex,
          onTap: onTaped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.money), label: "Earning"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "Rating"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ]),
    ));
  }
}
