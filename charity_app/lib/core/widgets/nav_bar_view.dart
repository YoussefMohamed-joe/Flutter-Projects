import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/features/cart/cart_view.dart';
import 'package:charity_app/features/donate/donate_view.dart';
import 'package:charity_app/features/home/homeview.dart';
import 'package:charity_app/features/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currenindex = 0;
  List<Widget> views = [
    const HomeView(),
    const DonateView(),
    const CartView(),
    const ProfileView()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[currenindex],
      
      bottomNavigationBar: Container(
        color: AppColors.boneWhite,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
          child: BottomNavigationBar(
            
              currentIndex: currenindex,
              onTap: (value) {
                setState(() {
                  currenindex = value;
                });
              },
              backgroundColor: AppColors.green,
              selectedItemColor: AppColors.black,
              unselectedItemColor: AppColors.white,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset('assets/home.svg',
                        colorFilter:
                            ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
                    icon: SvgPicture.asset('assets/home.svg',colorFilter:
                            ColorFilter.mode(AppColors.white, BlendMode.srcIn)),
                    label: 'Home'),
                     BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset('assets/Profile.svg',
                        colorFilter:
                            ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
                    icon: SvgPicture.asset('assets/donate.svg',colorFilter:
                            ColorFilter.mode(AppColors.white, BlendMode.srcIn)),
                    label: 'Donate'),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset('assets/search.svg',
                        colorFilter:
                            ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
                    icon: SvgPicture.asset('assets/cart.svg',colorFilter:
                            ColorFilter.mode(AppColors.white, BlendMode.srcIn)),
                    label: 'Cart'),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset('assets/Profile.svg',
                        colorFilter:
                            ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
                    icon: SvgPicture.asset('assets/profile.svg',colorFilter:
                            ColorFilter.mode(AppColors.white, BlendMode.srcIn)),
                    label: 'Profile'),
              ]),
        ),
      ),
    );
  }
}