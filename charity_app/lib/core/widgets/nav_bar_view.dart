import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/features/presentaion/views/cart/cart_view.dart';
import 'package:charity_app/features/presentaion/views/donate/donate_view.dart';
import 'package:charity_app/features/presentaion/views/home/homeview.dart';
import 'package:charity_app/features/presentaion/manager/Organisations/org_cubit.dart';
import 'package:charity_app/features/presentaion/views/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBar extends StatefulWidget {
  static int index = 0;
  const NavBar({super.key});
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  void initState() {
    context.read<OrgCubit>().getOrg();
    super.initState();
  }

  int currenindex = NavBar.index;
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
                    activeIcon: SvgPicture.asset('assets/icons/home.svg',
                        colorFilter:
                            ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
                    icon: SvgPicture.asset('assets/icons/home.svg',
                        colorFilter:
                            ColorFilter.mode(AppColors.white, BlendMode.srcIn)),
                    label: 'Home'),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset('assets/icons/donate.svg',
                        colorFilter:
                            ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
                    icon: SvgPicture.asset('assets/icons/donate.svg',
                        colorFilter:
                            ColorFilter.mode(AppColors.white, BlendMode.srcIn)),
                    label: 'Donate'),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset('assets/icons/cart.svg',
                        colorFilter:
                            ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
                    icon: SvgPicture.asset('assets/icons/cart.svg',
                        colorFilter:
                            ColorFilter.mode(AppColors.white, BlendMode.srcIn)),
                    label: 'Cart'),
                BottomNavigationBarItem(
                    activeIcon: SvgPicture.asset('assets/icons/Profile.svg',
                        colorFilter:
                            ColorFilter.mode(AppColors.black, BlendMode.srcIn)),
                    icon: SvgPicture.asset('assets/icons/profile.svg',
                        colorFilter:
                            ColorFilter.mode(AppColors.white, BlendMode.srcIn)),
                    label: 'Profile'),
              ]),
        ),
      ),
    );
  }
}
