import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zenzone/screens/assess_screen.dart';
import 'package:zenzone/widgets/card1.dart';
import 'package:zenzone/utils/size_config.dart';
import 'package:zenzone/utils/theme.dart';
import 'package:zenzone/utils/userdata.dart';

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
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: Icon(
              Icons.account_circle_rounded,
              size: getProportionateScreenHeight(35),
            ),
          )
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello ${userData.firstName}",
              style: regularTextStyle.copyWith(
                fontSize: getProportionateScreenHeight(20),
              ),
            ),
            Text(
              "Welcome to ZenZone",
              style: regularTextStyle.copyWith(
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
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AssessScreen()),
                ),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: pinktheme,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(15),
                      vertical: getProportionateScreenHeight(10)
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(10),
                            vertical: getProportionateScreenHeight(10)
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Image.asset('assets/assess_stress.png'),
                        ),
                        SizedBox(width: getProportionateScreenWidth(20),),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Assess Your Self',
                              style: regularTextStyle.copyWith(fontSize: getProportionateScreenHeight(18)),
                            ),
                            Text(
                              'Assess you stress levels \nby answering a few \nquestions.',
                              style: lightTextStyle.copyWith(
                                fontSize: getProportionateScreenHeight(12),
                                color: Colors.grey
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}