import 'dart:async';

import 'package:fimber/fimber.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assessment/core/blocs/products/product_cubit.dart';
import 'package:flutter_assessment/core/di/injector.dart';
import 'package:flutter_assessment/features/splash/splash_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shared/constants/colors.dart';
import 'shared/routes/routes.dart';
import 'shared/utils/bloc_observer.dart';

Future<void> main() async {
  _initBlocObserver();
}

void _setUpAndroidColors() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Palette.primaryColor,
    systemNavigationBarColor: Palette.primaryColor,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
}

void _initBlocObserver() {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await setUpLocator();

      _setUpAndroidColors();
      Bloc.observer = SimpleBlocObserver();

      runApp(
        const MyApp(),
      );
    },
    (error, stack) {},
  );
}

void _initFimber() {
  Fimber.plantTree(DebugTree(useColors: true));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    _initFimber();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (ctx, __) => MultiBlocProvider(
        providers: [
          BlocProvider<ProductsCubit>(create: (ctx) {
            return inject.get<ProductsCubit>();
          }),
        ],
        child: MaterialApp(
          builder: (context, widget) {
            return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: widget!);
          },
          title: 'Gemstore',
          navigatorKey: navigationKey,
          debugShowCheckedModeBanner: false,
          initialRoute: SplashPage.routeName,
          theme: ThemeData(
            brightness: Brightness.light,
            focusColor: Palette.gray90,
            hintColor: Palette.gray90,
            textTheme: GoogleFonts.ptSansTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          onGenerateRoute: GemStoreRouter.routes,
        ),
      ),
    );
  }
}
