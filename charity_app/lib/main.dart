import 'package:charity_app/core/constants/app_constants.dart';
import 'package:charity_app/core/services/local_storage.dart';
import 'package:charity_app/features/presentaion/manager/Organisations/org_cubit.dart';
import 'package:charity_app/features/presentaion/manager/User/user_cubit.dart';
import 'package:charity_app/features/presentaion/manager/carts/cart_cubit.dart';
import 'package:charity_app/features/presentaion/manager/price/price_cubit.dart';
import 'package:charity_app/features/presentaion/views/splash/main_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  Stripe.publishableKey = AppConstants.publishKey;
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalStorage().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OrgCubit(),
        ),
        BlocProvider(
          create: (context) => PriceCubit(),
        ),
        BlocProvider(
          create: (context) => LogCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterModelCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainSplash(),
      ),
    );
  }
}
