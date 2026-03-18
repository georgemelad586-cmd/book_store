import 'package:bookstore/core/custom_back_botton.dart';
import 'package:bookstore/core/thems/app_colors.dart';
import 'package:bookstore/core/widgets/app_buttom.dart';
import 'package:bookstore/core/widgets/text_form_field_button.dart';
import 'package:bookstore/features/auth/cubit/auth_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/generated/locale_keys.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/routes/routes.dart';
import '../../../gen/assets.gen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isObscure = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          const CustomBackBotton(),
          SizedBox(height: 20.h),
          Text(
            LocaleKeys.welcomeBack.tr(),
            style: TextStyle(
              fontSize: 30.sp,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20.h),
          TextFormFieldButton(
            controller: emailController,
            hintText: LocaleKeys.email.tr(),
          ),
          SizedBox(height: 20.h),
          TextFormFieldButton(
            controller: passwordController,
            hintText: LocaleKeys.password.tr(),
            isPassword: true,
            isObscure: isObscure,
            suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                child: Icon(
                    isObscure ? Icons.visibility_off : Icons.visibility)),
          ),
          SizedBox(height: 20.h),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                LocaleKeys.forgetPassword.tr(),
                style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),
          SizedBox(height: 30.h),
          BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthLoadingState) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  ),
                );
              } else if (state is AuthErrorState) {
                Navigator.pop(context); // Close loading
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text("Error"),
                    content: Text("Invalid email or password"),
                  ),
                );
              } else if (state is AuthSuccessState) {
                Navigator.pop(context); // Close loading
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.bottomNavBar, (route) => false);
              }
            },
            child: AppButtom(
              text: LocaleKeys.login.tr(),
              onTap: () {
                context.read<AuthCubit>().login(
                    email: emailController.text,
                    password: passwordController.text);
              },
            ),
          ),
          SizedBox(height: 10.h),
          Center(
            child: Text(
              "or",
              style: TextStyle(
                fontSize: 14.sp,
                color: const Color(0xff6A707C),
              ),
            ),
          ),
          SizedBox(height: 30.h),
          SizedBox(
              width: double.infinity,
              child: Center(child: Assets.icons.google.image())),
          SizedBox(height: 30.h),
          SizedBox(
            width: double.infinity,
            child: Center(
              child: Assets.icons.apple.image(),
            ),
          ),
          SizedBox(height: 50.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                LocaleKeys.dont_have_an_account.tr(),
                style: TextStyle(
                  color: const Color(0xff6A707C),
                  fontSize: 15.sp,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.register);
                },
                child: Text(
                  LocaleKeys.register_now.tr(),
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: const Color(0xffBFA054),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
