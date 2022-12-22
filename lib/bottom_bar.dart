import 'package:flutter/material.dart';
import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter_tutorial/food_home_page.dart';

class BottomBars extends StatefulWidget {
  const BottomBars({Key? key}) : super(key: key);

  @override
  State<BottomBars> createState() => _BottomBarsState();
}

class _BottomBarsState extends State<BottomBars> {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }


  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        circleColor: Color(0xffd32760),
        activeIcons:  [
          Padding(padding: EdgeInsets.all(10),
          child: Image.asset('assets/images/home.png',color: Colors.white,),
          ),
          Padding(padding: EdgeInsets.all(10),
            child: Image.asset('assets/images/spoon.png',color: Colors.white,),
          ),
          Padding(padding: EdgeInsets.all(10),
            child: Image.asset('assets/images/bookmark.png',color: Colors.white,),
          ),
          Padding(padding: EdgeInsets.all(10),
            child: Image.asset('assets/images/user.png',color: Colors.white,),
          ),
        ],
        inactiveIcons:  [
          Padding(padding: EdgeInsets.all(15),
            child: Image.asset('assets/images/home.png',color: Colors.white,),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Image.asset('assets/images/spoon.png',color: Colors.white,),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Image.asset('assets/images/bookmark.png',color: Colors.white,),
          ),
          Padding(padding: EdgeInsets.all(15),
            child: Image.asset('assets/images/user.png',color: Colors.white,),
          ),
        ],
        color: Color(0xff11171e),
        height: 60,
        circleWidth: 50,
        activeIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          pageController.jumpToPage(tabIndex);
        },
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Color(0xff05080d),
        elevation: 10,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: const [
         FoodHomePage(),
          FoodHomePage(),
          FoodHomePage(),
          FoodHomePage(),
        ],
      ),
    );
  }
}
