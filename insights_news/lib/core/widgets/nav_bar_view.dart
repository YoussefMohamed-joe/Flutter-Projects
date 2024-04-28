import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights_news/core/utils/colors.dart';


class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    int currenindex = 0;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currenindex,
        onTap: (value) {
          setState(() {
                currenindex = value;      
          });
        },
          backgroundColor: Appcolors.blackbg,
          selectedItemColor: Appcolors.green,
          unselectedItemColor: Appcolors.white,
          type: BottomNavigationBarType.fixed, 
          items: [
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/gome.svg'), label: 'Home'),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/search.svg'), label: 'Search'),
            BottomNavigationBarItem(icon: SvgPicture.asset('assets/Profile.svg'), label: 'Profile'),
          ]),
    );
  }
}