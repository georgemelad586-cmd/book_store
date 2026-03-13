 import 'package:flutter/material.dart';
class CustomBackBotton extends StatelessWidget {
    const CustomBackBotton({super.key});
    @override
    Widget build(BuildContext context) {
      return  Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      );
    }
  }



