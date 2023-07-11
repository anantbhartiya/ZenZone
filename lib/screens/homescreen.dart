import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zenzone/screens/assess_screen.dart';
import 'package:zenzone/screens/meditationscreen.dart';
import 'package:zenzone/widgets/card1.dart';
import 'package:zenzone/utils/size_config.dart';
import 'package:zenzone/utils/theme.dart';
import 'package:zenzone/utils/userdata.dart';
import 'package:zenzone/widgets/card2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shape: Border(
          bottom: BorderSide(color: blacktheme, width: 0.5)
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello ${userData.firstName}",
              style: semiboldTextStyle.copyWith(
                fontSize: getProportionateScreenHeight(20),
              ),
            ),
            Text(
              "Welcome to ZenZone",
              style: lightTextStyle.copyWith(
                fontSize: getProportionateScreenHeight(10),
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
            vertical: getProportionateScreenHeight(15)
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card1(color: greentheme, icon: 'assets/brain_icon.png', text: 'Self Assess',),
                  Card1(color: pinktheme, icon: 'assets/brain_icon.png', text: 'Self Assess',),
                  Card1(color: yellowtheme, icon: 'assets/brain_icon.png', text: 'Self Assess',),
                  Card1(color: bluetheme, icon: 'assets/brain_icon.png', text: 'Self Assess',),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              Container(
                height: 0.2,
                color: blacktheme,
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              Card2(
                color: pinktheme,
                image: 'assets/assess_stress.png',
                title: 'Assess Your Self',
                description: 'Assess your stress levels by answeing a few questions',
                screen: const AssessScreen()
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              Card2(
                color: bluetheme,
                image: 'assets/meditation.png',
                title: 'Explore Meditation',
                description: 'Discover Transformative Meditations for Inner Peace',
                screen: const MeditationScreen()
              ),
            ]
          ),
        ),
      ),
    );
  }
}