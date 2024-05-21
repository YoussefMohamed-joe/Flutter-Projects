import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/features/bookmark/presentation/views/bookmark_view.dart';
import 'package:bookia/features/cart/presentation/views/cart_view.dart';
import 'package:bookia/features/home/presantaion/views/home_view.dart';
import 'package:bookia/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    //context.read<OrgCubit>().getOrg();
    super.initState();
  }

  int currenindex = 0;
  List<Widget> views = [
    const HomeView(),
    const BookmarkView(),
    const CartView(),
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
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/icons/home.svg',
                    colorFilter:
                        ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
                icon: SvgPicture.asset('assets/icons/home.svg',
                    colorFilter:
                        ColorFilter.mode(AppColors.dark, BlendMode.srcIn)),
                label: 'Home'),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/icons/bookmark.svg',
                    colorFilter:
                        ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
                icon: SvgPicture.asset('assets/icons/bookmark.svg',
                    colorFilter:
                        ColorFilter.mode(AppColors.dark, BlendMode.srcIn)),
                label: 'Donate'),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/icons/cart.svg',
                    colorFilter:
                        ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
                icon: SvgPicture.asset('assets/icons/cart.svg',
                    colorFilter:
                        ColorFilter.mode(AppColors.dark, BlendMode.srcIn)),
                label: 'Cart'),
            BottomNavigationBarItem(
                activeIcon: SvgPicture.asset('assets/icons/Profile.svg',
                    colorFilter:
                        ColorFilter.mode(AppColors.primary, BlendMode.srcIn)),
                icon: SvgPicture.asset('assets/icons/profile.svg',
                    colorFilter:
                        ColorFilter.mode(AppColors.dark, BlendMode.srcIn)),
                label: 'Profile'),
          ]),
    );
  }
}
