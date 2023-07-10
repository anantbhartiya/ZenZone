import 'package:flutter/material.dart';
import 'package:zenzone/utils/size_config.dart';
import 'package:zenzone/utils/theme.dart';

class Card1 extends StatelessWidget {
  final Color color;
  final String icon;
  final String text;

  const Card1({super.key, required this.color, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(100),
      width: getProportionateScreenWidth(80),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: getProportionateScreenHeight(12),
          horizontal: getProportionateScreenWidth(20)
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: blacktheme.withOpacity(0.5)
                )
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenHeight(5),
                  horizontal: getProportionateScreenWidth(5)
                ),
                child: Image.asset(icon),
              )
            ),
            SizedBox(height: getProportionateScreenHeight(10)),
            Text(
              text,
              style: regularTextStyle.copyWith(
                fontSize: getProportionateScreenHeight(8),
                color: Colors.grey[700]
              ),
            )
          ],
        ),
      ),
    );
  }
}