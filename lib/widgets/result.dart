// Packages
import 'package:flutter/material.dart';
// Main Screen
import '../main.dart';

class Result extends StatelessWidget {
  const Result(this.holder, this.resultScore, {Key? key}) : super(key: key);

  final Function() holder;
  final int resultScore;

  String get resultPhrase {
    String resultText = '';
    if (resultScore >= 5) {
      resultText = 'GOOD';
    } else if (resultScore >= 3) {
      resultText = 'Not Bad';
    } else {
      resultText = 'Bad!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Done!',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: isSwitched == false ? Colors.black : Colors.white,
            ),
          ),
          Text(
            'Total Score = $resultScore',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: isSwitched == false ? Colors.black : Colors.white,
            ),
          ),
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: isSwitched == false ? Colors.black : Colors.white,
            ),
          ),
          TextButton(
            onPressed: holder,
            child: const Text(
              'Restart The App',
              style: TextStyle(
                fontSize: 30,
                //fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
