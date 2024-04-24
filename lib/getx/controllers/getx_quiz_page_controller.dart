import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:sabak_6_1/common/services/questions_service.dart';
import 'package:sabak_6_1/common/constants/icons/app_icons.dart';

class GetxQuizPageController extends GetxController {
  RxList<Widget> icons = <Widget>[].obs;

  RxString question = ''.obs;

  @override
  void onInit() {
    _getNextQuestion();
    super.onInit();
  }

  void _getNextQuestion() {
    question.value = service.nextQuestion();
  }

  bool checkAnswerAndOpenDialogIfNeeded({required bool userAnswer}) {
    _addIcon(userAnswer: userAnswer, correctAnswer: service.getAnswer());

    if (!service.isFinished()) {
      service.goToNext();

      _getNextQuestion();
      return false;
    } else {
      _getNextQuestion();
      return true;
    }
  }

  void _addIcon({
    required bool userAnswer,
    required bool correctAnswer,
  }) {
    userAnswer == correctAnswer
        ? icons.add(AppIcons.correctIcon)
        : icons.add(AppIcons.falseIcon);
  }

  void _clearIcons() {
    icons.clear();
  }

  void restart() {
    _clearIcons();
    service.restart();
    _getNextQuestion();
  }
}
