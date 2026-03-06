


      import 'package:bookstore/core/widgets/app_buttom.dart';
import 'package:bookstore/core/widgets/text_form_field_button.dart';
import 'package:bookstore/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
        const RegisterScreen({super.key});

        @override
        Widget build(BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.white,
            body:
              ListView(
                padding: EdgeInsets.all(20.r),
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
                        SizedBox(height: 20.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Expanded(child: Text(LocaleKeys.Hello.tr(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                           ],
                         ),
                         SizedBox(height: 20.h),
                       TextFormFieldButton(hintText: LocaleKeys.username.tr(),),
                    SizedBox(height: 10.h),
                    TextFormFieldButton(hintText: LocaleKeys.email.tr(),),
                    SizedBox(height: 10.h),
                    TextFormFieldButton(hintText: LocaleKeys.password.tr(),),
                    SizedBox(height: 10.h),
                    TextFormFieldButton(hintText: LocaleKeys.confirm_password.tr(),),
                        SizedBox(height: 30.h),
                     AppButtom(text: LocaleKeys.register.tr(),),
                       SizedBox(height: 100.h),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          LocaleKeys.already_have_an_account.tr(),
                          style: TextStyle(
                            color: const Color(0xff6A707C),
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),




                  ],
                ),


          );
        }
      }
