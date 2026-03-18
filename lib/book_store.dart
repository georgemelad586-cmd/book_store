

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/routes/app_route.dart';
import 'features/welcome/ui/welcome_screen.dart';
import 'package:bookstore/features/auth/ui/auth_screen.dart';
import 'package:bookstore/features/register/ui/register_screen.dart';

class BookStore extends StatelessWidget {
  const BookStore({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(fontFamily: "DM"),
             onGenerateRoute: AppRoute().onGenerateRoute,
        home: WelcomeScreen(),
      ),
    );
  }



}
