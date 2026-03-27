



     import 'package:flutter/material.dart';

import '../../../core/custom_back_botton.dart';

class BottomNavBarScreen extends StatelessWidget {
       const BottomNavBarScreen({super.key});

       @override
       Widget build(BuildContext context) {
         return Scaffold(
           appBar: AppBar(
         leading: CustomBackBotton(),

           ),
         );
       }
     }
