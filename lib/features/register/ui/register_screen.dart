import 'package:bookstore/core/custom_back_botton.dart';
import 'package:bookstore/core/thems/app_colors.dart';
import 'package:bookstore/core/widgets/app_buttom.dart';
import 'package:bookstore/core/widgets/text_form_field_button.dart';
import 'package:bookstore/features/register/cubit/register_cubit.dart';
import 'package:bookstore/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

 import '../../../core/routes/routes.dart';

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

  bool isObscure = true;
  bool isConfirmObscure = true;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(20.r),
        children: [
          const CustomBackBotton(),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Text(
                    LocaleKeys.Hello.tr(),
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          SizedBox(height: 20.h),
          TextFormFieldButton(
            hintText: LocaleKeys.username.tr(),
            controller: nameController,
          ),
          SizedBox(height: 10.h),
          TextFormFieldButton(
            hintText: LocaleKeys.email.tr(),
            controller: emailController,
          ),
          SizedBox(height: 10.h),
          TextFormFieldButton(
            hintText: LocaleKeys.password.tr(),
            controller: passwordController,
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
          SizedBox(height: 10.h),
          TextFormFieldButton(
            hintText: LocaleKeys.confirm_password.tr(),
            controller: confirmPasswordController,
            isPassword: true,
            isObscure: isConfirmObscure,
            suffixIcon: InkWell(
                onTap: () {
                  setState(() {
                    isConfirmObscure = !isConfirmObscure;
                  });
                },
                child: Icon(
                    isConfirmObscure ? Icons.visibility_off : Icons.visibility)),
          ),
          SizedBox(height: 30.h),
          BlocListener<RegisterCubit, RegisterState>(
            listener: (context, state) {
              if (state is RegisterLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  ),
                );
              } else if (state is RegisterErorr) {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    title: Text("Error"),
                    content: Text("Registration failed. Please try again."),
                  ),
                );
              } else if (state is RegisterSuccess) {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                    context, Routes.bottomNavBar, (route) => false);
              }
            },
            child: AppButtom(
              text: LocaleKeys.register.tr(),
              onTap: () {
                context.read<RegisterCubit>().register(
                  email: emailController.text,
                  password: passwordController.text,
                  name: nameController.text,
                  passwordConfirmation: confirmPasswordController.text,
                );
              },
            ),
          ),
          SizedBox(height: 50.h),
          Align(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
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
}
