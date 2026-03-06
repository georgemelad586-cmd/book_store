


import 'package:bookstore/core/widgets/app_buttom.dart';
import 'package:bookstore/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 22.w),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: Image.asset(Assets.welcomeBackground.path).image, fit: BoxFit.cover)
        ),
        child: Column(

          children: [
            SizedBox(height: 15.h,),
            Row(
              children: [
                IconButton(onPressed: (){
                  if(context.locale == Locale('en')){
                    context.setLocale(Locale('ar'));
                  }else{
                    context.setLocale(Locale('en'));
                  }

                }, icon: Icon(Icons.language)),
              ],
            ),
            SizedBox(height: 105.h,),
            Assets.splash.image(),
            SizedBox(height: 28.h,),
             Expanded(
               child: Text(LocaleKeys.orderNow.tr(),
               style: TextStyle(
                 fontSize: 20.sp,

               ),
               ),
             ),
            AppButtom(
            onTap: (){

                Navigator.pushNamed(context, '/auth_screen');

            },
            ),
            SizedBox(height: 15.h,),
            AppButtom(
              onTap: (){
                Navigator.pushNamed(context, '/register_screen');
              },
              backgroundColor: Colors.white,
              text:LocaleKeys.register.tr(),
            ),
            SizedBox(height: 94.h,),


          ],
        ),
      ),

    );
  }
}
