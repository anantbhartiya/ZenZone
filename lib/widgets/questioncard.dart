import 'package:flutter/material.dart';
import 'package:zenzone/utils/size_config.dart';
import 'package:zenzone/utils/theme.dart';

class Question {
  final String questionText;
  final List<Option> options;

  Question(this.questionText, this.options);
}

class Option {
  final String id;
  final String label;

  Option(this.id, this.label);
}

class QuestionCard extends StatelessWidget {
  final Question question;
  final Option selectedOption;
  final ValueChanged<Option> onOptionSelected;
  final Color cardColor;

  const QuestionCard({
    super.key, 
    required this.question,
    required this.selectedOption,
    required this.onOptionSelected,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {

    // final index = cardColors.length > 0 ? cardColors.length % question.hashCode : 0;
    // final cardColor = cardColors[index];

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(17),
        vertical: getProportionateScreenHeight(10)
      ),
      margin: EdgeInsets.symmetric(vertical: getProportionateScreenHeight(10)),
      decoration: BoxDecoration(
        color: cardColor,
        border: Border.all(color: blacktheme.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question.questionText,
            style: boldTextStyle.copyWith(fontSize: getProportionateScreenHeight(15))
          ),
          SizedBox(height: getProportionateScreenHeight(10)),
          ...question.options.map((option) {
            bool isSelected = selectedOption.id == option.id;

            return OptionWidget(
              option: option,
              isSelected: isSelected,
              onTap: () {
                onOptionSelected(option);
              },
              cardColor: cardColor,
            );
          }).toList(),
        ],
      ),
    );
  }
}

class OptionWidget extends StatelessWidget {
  final Option option;
  final bool isSelected;
  final VoidCallback onTap;
  final Color cardColor;

  const OptionWidget({
    super.key, 
    required this.option,
    required this.isSelected,
    required this.onTap,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? cardColor.withOpacity(0.5) : Colors.white,
            border: Border.all(color: blacktheme.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(30)
          ),
          child: Row(
            children: [
              Radio(
                fillColor: MaterialStateColor.resolveWith((states) => blacktheme),
                value: option.id,
                groupValue: isSelected ? option.id : null,
                onChanged: (_) {},
              ),
              Text(
                option.label,
                style: regularTextStyle.copyWith(fontSize: getProportionateScreenHeight(15))
              ),
            ],
          ),
        ),
      ),
    );
  }
}
