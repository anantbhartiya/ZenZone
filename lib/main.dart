import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zenzone/screens/splashscreen.dart';
import 'package:zenzone/utils/size_config.dart';
import 'package:zenzone/utils/userdata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ChangeNotifierProvider(
      create: (context) => UserData(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: const SplashScreen(),
      ),
    );
  }
}