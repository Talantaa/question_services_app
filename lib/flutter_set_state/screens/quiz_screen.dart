import 'package:flutter/material.dart';
import 'package:sabak_6_1/common/services/questions_service.dart';
import 'package:sabak_6_1/common/style/color/app_color.dart';
import 'package:sabak_6_1/common/style/icons/app_icons.dart';
import 'package:sabak_6_1/common/widgets/buttons/custom_button.dart';
import 'package:sabak_6_1/common/widgets/dialogs/custom_dialog.dart';
import 'package:sabak_6_1/common/widgets/dialogs/custom_text.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> icons = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              CustomText(text: service.nextQuestion()),
              CustomButton(
                text: 'TRUE',
                onPressed: () {
                  _checkAnswer(userAnswer: true);
                },
                backgroundColor: AppColor.green,
              ),
              CustomButton(
                text: 'FALSE',
                onPressed: () => _checkAnswer(userAnswer: false),
                backgroundColor: AppColor.red,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: icons,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkAnswer({required bool userAnswer}) {
    _addIcon(userAnswer: userAnswer, correctAnswer: service.getAnswer());

    setState(() {
      !service.isFinished() ? service.goToNext() : _openDialog();
    });
  }

  void _addIcon({
    required bool userAnswer,
    required bool correctAnswer,
  }) {
    userAnswer == correctAnswer
        ? icons.add(AppIcons.correctIcon)
        : icons.add(AppIcons.falseIcon);
  }

  void _openDialog() {
    openDialog(
      context,
      () {
        service.restart();
        icons.clear();

        Navigator.of(context).pop();

        setState(() {});
      },
    );
  }
}
