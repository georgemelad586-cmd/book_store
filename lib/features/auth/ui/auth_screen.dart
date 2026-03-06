
import 'package:bookstore/core/widgets/app_buttom.dart';
import 'package:bookstore/core/widgets/text_form_field_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/generated/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16.r),
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ],
          ),

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
            hintText: LocaleKeys.name.tr(),
          ),

          SizedBox(height: 20.h),

          TextFormFieldButton(
            hintText: LocaleKeys.password.tr(),
            suffixIcon: const Icon(Icons.remove_red_eye),
          ),

          SizedBox(height: 20.h),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                LocaleKeys.forgetPassword.tr(),
                style: TextStyle(
                  color: const Color(0xff6A707C),
                  fontSize: 15.sp,
                ),
              ),
            ),
          ),

          SizedBox(height: 30.h),

          AppButtom(),

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

          Container(width: double.infinity,
              child: Center(child: Assets.icons.google.image())),

          SizedBox(height: 30.h),
          Container(
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
                onPressed: () {},
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