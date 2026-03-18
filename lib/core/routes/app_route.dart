import 'package:bookstore/features/auth/ui/auth_screen.dart';
import 'package:bookstore/features/register/cubit/register_cubit.dart';
import 'package:bookstore/features/register/ui/register_screen.dart';
import 'package:bookstore/features/welcome/ui/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../features/auth/cubit/auth_cubit.dart';
import '../../features/bottom_nav_bar/ui/bottom_nav_bar_screen.dart';

class AppRoute {
  static const String welcome = '/';
  static const String login = '/auth';
  static const String register = '/register';
  static const String bottomNavBar = '/bottomNavBar';

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: const AuthScreen(),
                ));
      case register:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => RegisterCubit(),
                  child: const RegisterScreen(),
                ));
      case bottomNavBar:
        return MaterialPageRoute(builder: (_) => const BottomNavBarScreen());
      default:
        return null;
    }
  }
}
