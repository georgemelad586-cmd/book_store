


      import 'package:bookstore/core/custom_back_botton.dart';
import 'package:bookstore/core/thems/app_colors.dart';
import 'package:bookstore/core/widgets/app_buttom.dart';
import 'package:bookstore/core/widgets/text_form_field_button.dart';
import 'package:bookstore/generated/locale_keys.g.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatefulWidget {

        const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
      var nameController = TextEditingController();
      var emailController = TextEditingController();
      var passwordController = TextEditingController();
        var confirmPasswordController = TextEditingController();



        @override
        void dispose() {
          nameController.dispose();
          emailController.dispose();
          passwordController.dispose();
          confirmPasswordController.dispose();
          super.dispose();


        }





        Widget build(BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.white,
            body:
              ListView(
                padding: EdgeInsets.all(20.r),
                  children: [
                  CustomBackBotton(),
                        SizedBox(height: 20.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Expanded(child: Text(LocaleKeys.Hello.tr(),

                               style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
                           ],
                         ),
                         SizedBox(height: 20.h),
                       TextFormFieldButton(hintText: LocaleKeys.username.tr(),
                       controller: nameController,),
                    SizedBox(height: 10.h),
                    TextFormFieldButton(hintText: LocaleKeys.email.tr(),
                      controller: emailController,
                    ),
                    SizedBox(height: 10.h),
                    TextFormFieldButton(hintText: LocaleKeys.password.tr(),
                    controller: passwordController,
                    ),
                    SizedBox(height: 10.h),
                    TextFormFieldButton(hintText: LocaleKeys.confirm_password.tr(),
                    controller: confirmPasswordController,
                    ),
                        SizedBox(height: 30.h),
                     AppButtom(text: LocaleKeys.register.tr(),
                     onTap: (){
                       register();
                     },),
                       SizedBox(height: 100.h),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          LocaleKeys.already_have_an_account.tr(),
                          style: TextStyle(
                            color: AppColors.textColor,
                            fontSize: 15.sp,
                          ),
                        ),
                      ),
                    ),




                  ],
                ),


          );
        }
      register() async {
        try {
          Dio dio = Dio();

          final response = await dio.post(
            'https://codingarabic.online/api/register',
            data: {
              "name": nameController.text,
              "email": emailController.text,
              "password": passwordController.text,
              "password_confirmation": confirmPasswordController.text,
            },
          );

          print("SUCCESS: ${response.statusCode}");
        } on DioException catch (e) {
          if (e.response != null) {
            print("SERVER ERROR: ${e.response!.data}");
          } else {
            print("ERROR: $e");
          }
        }
      }







}
