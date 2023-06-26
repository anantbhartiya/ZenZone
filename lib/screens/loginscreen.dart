import 'package:flutter/material.dart';
import 'package:zenzone/screens/homescreen.dart';
import 'package:zenzone/screens/signupscreen.dart';
import 'package:zenzone/utils/size_config.dart';
import 'package:zenzone/utils/theme.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greentheme,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(100),),
              Icon(Icons.lock, size: getProportionateScreenHeight(120),color: blacktheme,),
              SizedBox(height: getProportionateScreenHeight(30),),
              Text(
                "Welcome Back!",
                style: regularTextStyle.copyWith(
                  fontSize: getProportionateScreenHeight(25),
                  color: blacktheme
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(30),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: blacktheme),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: blacktheme),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fillColor: greentheme,
                    filled: true,
                    hintText: "Email",
                    hintStyle: TextStyle(color: blacktheme)
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(15),),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: blacktheme),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: blacktheme),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fillColor: greentheme,
                    filled: true,
                    hintText: "Password",
                    hintStyle: TextStyle(color: blacktheme)
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(15),),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                ),
                child: Container(
                  padding: EdgeInsets.all(getProportionateScreenHeight(15)),
                  margin: EdgeInsets.symmetric(horizontal: getProportionateScreenHeight(15)),
                  decoration: BoxDecoration(
                    color: blacktheme,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Sign In",
                      style: regularTextStyle.copyWith(
                        fontSize: getProportionateScreenHeight(18),
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: getProportionateScreenHeight(20),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Not a member?',
                    style: regularTextStyle.copyWith(color: Colors.grey[700]),
                  ),
                  SizedBox(width: getProportionateScreenWidth(4)),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                    ),
                    child: Text(
                      'Register Now',
                      style: boldTextStyle.copyWith(color: Colors.blue,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getProportionateScreenHeight(10),),
            ],
          ),
        ),
      ),
    );
  }
}