import 'package:flutter/cupertino.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sabak_6_1/common/services/questions_service.dart';
import 'package:sabak_6_1/common/constants/icons/app_icons.dart';
import 'package:sabak_6_1/riverpod/probiders/quiz_screen_provider_state.dart';

part 'quiz_screen_provider.g.dart';

@riverpod
class QuizScreenNotifier extends _$QuizScreenNotifier {
  @override
  QuizScreenProviderState build() =>
      QuizScreenProviderState(icons: [], question: service.nextQuestion());

  bool checkAnswerAndOpenDialogIfNeeded({required bool userAnswer}) {
    _addIcon(userAnswer: userAnswer, correctAnswer: service.getAnswer());

    if (!service.isFinished()) {
      service.goToNext();
      return false;
    } else {
      return true;
    }
  }

  void _addIcon({
    required bool userAnswer,
    required bool correctAnswer,
  }) {
    if (userAnswer == correctAnswer) {
      state = QuizScreenProviderState(
          icons: _getIcons(true), question: service.nextQuestion());
    } else {
      state = QuizScreenProviderState(
          icons: _getIcons(false), question: service.nextQuestion());
    }
  }

  List<Widget> _getIcons(bool correct) {
    correct
        ? state.icons.add(AppIcons.correctIcon)
        : state.icons.add(AppIcons.falseIcon);
    return state.icons;
  }

  void _clear() {
    state =
        QuizScreenProviderState(icons: [], question: service.nextQuestion());
  }

  void restart() {
    service.restart();
    _clear();
  }
}
