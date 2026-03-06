import 'package:bookstore/book_store.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp( EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations', // <-- change the path of the translation files
      fallbackLocale: Locale('en'),
      child: BookStore()));

}
//flutter pub run easy_localization:generate -S assets/translations -f keys -o locale_keys.g.dart