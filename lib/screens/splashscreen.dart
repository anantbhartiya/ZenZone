import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zenzone/screens/homescreen.dart';
import 'package:zenzone/utils/userdata.dart';
import 'package:zenzone/utils/size_config.dart';
import 'package:zenzone/utils/theme.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<UserData>(context);
    String name = '';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(10),
              horizontal: getProportionateScreenWidth(15)
            ),
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(30)),
                Image.asset('assets/splashscreen-1.png'),
                SizedBox(height: getProportionateScreenHeight(15)),
                Text(
                  "Welcome",
                  style: semiboldTextStyle.copyWith(fontSize: getProportionateScreenHeight(30)),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: regularTextStyle.copyWith(
                      fontSize: getProportionateScreenHeight(20),
                      color: Colors.grey[600]
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20),
                      vertical: getProportionateScreenHeight(20)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: blacktheme.withOpacity(0.8)
                      ),
                      borderRadius: BorderRadius.circular(35)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: blacktheme.withOpacity(0.8)
                      ),
                      borderRadius: BorderRadius.circular(35)
                    )
                  ),
                  onChanged: (value) {
                    name = value.trim();
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size.fromHeight(getProportionateScreenHeight(50)),
                    backgroundColor: blacktheme,
                  ),
                  onPressed: () {
                   if (name.isEmpty) {
                      // Display an error if the name is empty
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Error', style: regularTextStyle,),
                            content: Text('Please enter your name.', style: regularTextStyle,),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK', style: regularTextStyle,),
                              ),
                            ],
                          );
                        },
                      );
                    }
                    else {
                      userData.splitFullName(name);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    }
                  },
                  child: Text(
                    'Next',
                    style: regularTextStyle.copyWith(fontSize: getProportionateScreenHeight(20), color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}