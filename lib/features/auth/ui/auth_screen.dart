import 'package:bookstore/core/custom_back_botton.dart';
import 'package:bookstore/core/thems/app_colors.dart';
import 'package:bookstore/core/widgets/app_buttom.dart';
import 'package:bookstore/core/widgets/text_form_field_button.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bookstore/generated/locale_keys.g.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
   var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }


  bool isObscure = true;

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
            hintText: LocaleKeys.name.tr(),
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
           AppButtom(
            onTap: ()async{
            await  login();
            },
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
          Container(
              width: double.infinity,
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


   login() async {
     Dio dio = Dio();
     final response = await dio.post(
       'https://codingarabic.online/api/login',
       data: {
         "email": emailController.text,
         "password": passwordController.text,
       },
     );
     print(response.statusCode.toString());
   }




}
