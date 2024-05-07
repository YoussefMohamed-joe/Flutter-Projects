import 'package:charity_app/core/services/local_storage.dart';
import 'package:charity_app/features/manager/Organisations/org_cubit.dart';
import 'package:charity_app/features/manager/User/user_cubit.dart';
import 'package:charity_app/features/manager/price/price_cubit.dart';
import 'package:charity_app/features/splash/main_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLocalStorage().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PriceCubit(),
      child: BlocProvider(
        create: (context) => OrgCubit(),
        child: BlocProvider(
          create: (context) => LogCubit(),
          child: BlocProvider(
            create: (context) => RegisterModelCubit(),
            child: const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MainSplash(),
            ),
          ),
        ),
      ),
    );
  }
}
