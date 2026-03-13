import 'package:bookstore/core/thems/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldButton extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final bool isPassword;
  final bool isObscure;
   final TextEditingController? controller;
  const TextFormFieldButton({
    super.key,
    required this.hintText,
    this.suffixIcon,
    this.isPassword = false,
    this.isObscure = false, this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (v) {
        FocusScope.of(context).unfocus();
      },
      obscureText: isPassword && isObscure,
      controller:controller,
      decoration: InputDecoration(

          fillColor: AppColors.greyColor,
          filled: true,
          hintText: hintText,
          suffixIcon: suffixIcon,
          hintStyle: TextStyle(color: AppColors.textColor, fontSize: 15.sp),
          enabledBorder: const OutlineInputBorder(),
          border: const OutlineInputBorder(),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Color(0xffE8ECF4),
          ))),
    );
  }
}
