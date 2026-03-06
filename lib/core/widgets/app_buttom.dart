

import 'package:bookstore/generated/locale_keys.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:easy_localization/easy_localization.dart';

import '../thems/app_colors.dart';
class AppButtom extends StatelessWidget {
  final Color? backgroundColor;
  final String? text;
  final void Function()? onTap;
  const AppButtom({super.key, this.backgroundColor, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 19.h),
      decoration: BoxDecoration(
        border: backgroundColor==null?null: Border.all(
          color: Colors.black,
        ),
        color: backgroundColor??AppColors.primaryColor,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: InkWell(
        onTap: onTap,
      child: Center(
        child:  Text(text??LocaleKeys.login.tr(),style:  TextStyle(
          fontSize: 15.sp,color:backgroundColor==Colors.white? Colors.black:Colors.white,
        ),),
      ),
      )  );
  }
}
