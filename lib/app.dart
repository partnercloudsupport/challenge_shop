import 'package:challenge_shop/page/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
class ShopApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _ShopAppState();
}

class _ShopAppState extends State<ShopApp> {
  HomePage _homePage = new HomePage();

  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: MaterialApp(
      localizationsDelegates: [
        PickerLocalizationsDelegate.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
      ],
      color: Colors.white,
      theme: new ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.white,
          backgroundColor: Color(0xfff5f5f5)),
      debugShowCheckedModeBanner: false,
      home: _homePage,
    ));
  }
}
