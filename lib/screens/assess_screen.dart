import 'package:flutter/material.dart';
import 'package:zenzone/widgets/questioncard.dart';
import 'package:zenzone/utils/size_config.dart';
import 'package:zenzone/utils/theme.dart';

class AssessScreen extends StatefulWidget {
  const AssessScreen({super.key});

  @override
  State<AssessScreen> createState() => _AssessScreenState();
}

class _AssessScreenState extends State<AssessScreen> {
  List<Question> questions = [
    Question(
      'How would you rate your energy level today?',
      [
        Option('option1', 'Low'),
        Option('option2', 'Medium'),
        Option('option3', 'High'),
      ],
    ),
    Question(
      'Did you engage in physical exercise today?',
      [
        Option('option1', 'Yes'),
        Option('option2', 'No'),
      ],
    ),
    Question(
      'Did you engage in physical exercise today?',
      [
        Option('option1', 'Yes'),
        Option('option2', 'No'),
      ],
    ),
    Question(
      'Did you engage in physical exercise today?',
      [
        Option('option1', 'Yes'),
        Option('option2', 'No'),
      ],
    ),
    // Add more questions and options as needed
  ];

  List<Option> selectedOptions = [];
  List<Color> cardColors = [yellowtheme, bluetheme, greentheme, pinktheme];

  @override
  void initState() {
    super.initState();
    selectedOptions = List<Option>.filled(questions.length, Option('', ''));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: blacktheme, width: 0.5)),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello Anant",
              style: regularTextStyle.copyWith(
                fontSize: getProportionateScreenHeight(20),
                color: blacktheme,
              ),
            ),
            Text(
              "Assess Yourself",
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
            vertical: getProportionateScreenHeight(20),
          ),
          child: Column(
            children: questions
            .asMap()
            .entries
            .map((entry) => QuestionCard(
              question: entry.value,
              selectedOption: selectedOptions[entry.key],
              onOptionSelected: (option) {
                setState(() {
                  selectedOptions[entry.key] = option;
                });
              },
              cardColor: cardColors[entry.key % cardColors.length],
            ))
            .toList(),
          ),
        )
      )
    );
  }
}
