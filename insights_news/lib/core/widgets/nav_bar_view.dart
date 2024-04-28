import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/features/home/home_view.dart';
import 'package:insights_news/features/profile/profile_view.dart';
import 'package:insights_news/features/search/search_view.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currenindex = 0;
  List<Widget> views = [
    const HomeView(),
    const SearchView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[currenindex],
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
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/home.svg',
                    colorFilter:
                        ColorFilter.mode(Appcolors.green, BlendMode.srcIn)),
                icon: SvgPicture.asset('assets/home.svg'),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/search.svg',
                    colorFilter:
                        ColorFilter.mode(Appcolors.green, BlendMode.srcIn)),
                icon: SvgPicture.asset('assets/search.svg'),
                label: 'Search'),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/Profile.svg',
                    colorFilter:
                        ColorFilter.mode(Appcolors.green, BlendMode.srcIn)),
                icon: SvgPicture.asset('assets/Profile.svg'),
                label: 'Profile'),
          ]),
    );
  }
}
