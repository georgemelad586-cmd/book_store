  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


   class TextFormFieldButton extends StatelessWidget {
     final String hintText;
     final Widget?suffixIcon;
     const TextFormFieldButton({super.key, required this.hintText, this.suffixIcon});

     @override
     Widget build(BuildContext context) {
       return TextFormField(
         decoration: InputDecoration(
           hintText: hintText,
             suffixIcon: suffixIcon,
             hintStyle: TextStyle(color: Color(0xff8391A1),
               fontSize: 15.sp
             ),

             enabledBorder: OutlineInputBorder(),
             border: OutlineInputBorder(),
             focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(
                   color: Color(0xffE8ECF4),
                 )
             )
         ),

       );
     }
   }


