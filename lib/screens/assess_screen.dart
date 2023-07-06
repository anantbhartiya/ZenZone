import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:zenzone/widgets/questioncard.dart';
import 'package:zenzone/utils/size_config.dart';
import 'package:zenzone/utils/theme.dart';
import 'package:http/http.dart' as http;


class AssessScreen extends StatefulWidget {
  const AssessScreen({super.key});

  @override
  State<AssessScreen> createState() => _AssessScreenState();
}

class _AssessScreenState extends State<AssessScreen> {

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<Question> questions = [
    Question(
      'How would you rate your energy level today?',
      [
        Option('option1', 'Low', 'My energy level is low'),
        Option('option2', 'Medium', 'My energy level is medium'),
        Option('option3', 'High', 'My energy level is High'),
      ],
    ),
    Question(
      'Did you engage in physical exercise today?',
      [
        Option('option1', 'Yes', 'Yes, I engaged in physical exercise today'),
        Option('option2', 'No', 'No, I did not engage in physical exercise today'),
      ],
    ),
    Question(
      'Did you engage in physical exercise today?',
      [
        Option('option1', 'Yes', 'Yes, I engaged in physical exercise today'),
        Option('option2', 'No', 'No, I did not engage in physical exercise today'),
      ],
    ),
    Question(
      'Did you engage in physical exercise today?',
      [
        Option('option1', 'Yes', 'Yes, I engaged in physical exercise today'),
        Option('option2', 'No', 'No, I did not engage in physical exercise today'),
      ],
    ),
    // Add more questions and options as needed
  ];

  List<Option> selectedOptions = [];
  List<Color> cardColors = [yellowtheme, bluetheme, greentheme, pinktheme];

  @override
  void initState() {
    super.initState();
    selectedOptions = List<Option>.filled(questions.length, Option('', '', ''));
  }

  Future<void> sendSelectedDescriptions(GlobalKey<ScaffoldState> scaffoldKey, String descriptions) async {
    
    try {
      
      // Define the API endpoint URL
      const apiUrl = 'https://stress-monitoring-app.onrender.com/predict';
      
      // Prepare the request body with the selected descriptions
      final requestBody = {'text': descriptions};

      // Send a POST request to the API
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(requestBody),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final prediction = responseData['prediction'] as int;
        String resultText = '';
        if (prediction == 1) {
          resultText = 'You are in stress.';
        } else if (prediction == 0) {
          resultText = 'You are not in stress.';
        }

        showDialog(
          context: scaffoldKey.currentContext!,
          builder: (context) => AlertDialog(
            title: Text(
              'Prediction Result',
              style: regularTextStyle,
            ),
            content: Text(
              resultText,
              style: regularTextStyle,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedOptions = List<Option>.filled(
                      questions.length,
                      Option('', '', ''),
                    );
                  });
                  Navigator.pop(context);
                },
                child: Text(
                  'OK',
                  style: regularTextStyle,
                ),
              ),
            ],
          ),
        );
      } else {
        throw Exception('Failed to fetch data from the API');
      }
    } catch (error) {
      
      // Handle any errors that occur during the API request
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Error',
            style: regularTextStyle,
          ),
          content: Text(
            'Failed to send the selected descriptions to the API.',
            style: regularTextStyle,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'OK',
                style: regularTextStyle,
              ),
            ),
          ],
        ),
      );
    }
  }

  void submitAnswers() {
    if (selectedOptions.any((option) => option.description.isEmpty)) {
      // Show error dialog if any options are not selected
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Error',
            style: regularTextStyle,
          ),
          content: Text(
            'Please select all options.',
            style: regularTextStyle,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'OK',
                style: regularTextStyle,
              ),
            ),
          ],
        ),
      );
    } 
    else {
      // Combine selected options' descriptions into a single string
      String selectedDescriptions = selectedOptions.map((option) => option.description).join('\n');
      
      // Send the selected descriptions to the API
       sendSelectedDescriptions(scaffoldKey, selectedDescriptions);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: blacktheme, width: 0.5)),
        leading: BackButton(
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hey Anant",
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submitAnswers,
        backgroundColor: blacktheme.withOpacity(0.85),
        foregroundColor: Colors.white,
        child: const Icon(Icons.check),
      ),
    );
  }
}