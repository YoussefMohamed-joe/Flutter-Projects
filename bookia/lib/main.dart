import 'package:bookia/core/services/api_services.dart';
import 'package:bookia/core/services/local_storage.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/nav_bar_view.dart';
import 'package:bookia/features/Profile/presentation/manager/profile_cubit.dart';
import 'package:bookia/features/auth/presentation/manager/auth_cubit.dart';
import 'package:bookia/features/cart/presentation/manager/cart_cubit.dart';
import 'package:bookia/features/home/presantaion/manager/home_cubit.dart';
import 'package:bookia/features/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalStorage().init();
  await ApiServices().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(create: (context) => ProfileCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
            inputDecorationTheme: InputDecorationTheme(
              fillColor: AppColors.textformcolor,
              filled: true,
              hintStyle: getBodyStyle(color: AppColors.grey),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.semiwhite),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.semiwhite),
              ),
            )),
        debugShowCheckedModeBanner: false,
        home: AppLocalStorage.getData('token') == null
            ? const WelcomeView()
            : const NavBar(),
      ),
    );
  }
}
