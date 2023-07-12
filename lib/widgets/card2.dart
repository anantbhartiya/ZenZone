import 'package:flutter/material.dart';
import 'package:zenzone/utils/size_config.dart';
import 'package:zenzone/utils/theme.dart';

class Card2 extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final Widget screen;
  final Color color;
  
  const Card2({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.screen,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen),
      ),
      child: Container(
        height: getProportionateScreenHeight(150),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: color,
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
                width: getProportionateScreenWidth(135),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(20)
                ),                          
                child: Image.asset(image),
              ),
              SizedBox(width: getProportionateScreenWidth(20),),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text(
                      title,
                      style: regularTextStyle.copyWith(fontSize: getProportionateScreenHeight(17)),
                    ),
                    SizedBox(height: getProportionateScreenHeight(5)),
                    Flexible(
                      child: Text(
                        description,
                        style: lightTextStyle.copyWith(
                          fontSize: getProportionateScreenHeight(11.5),
                          color: Colors.grey
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}