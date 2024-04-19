import 'package:sabak_6_1/common/data/questions_data.dart';

class QuestionsService {
  // 0. suroolordun indeksi
  int index = 0;

  // 1. Suroolordun tizmesi
  /// [questions]

  // 2. Kiyinki suroonu korsot

  String nextQuestion() {
    return questions[index].question;
  }

  // 3. Jooptu teksher

  // 4. kiyinki suroogo ot
  void goToNext() {
    if (index < questions.length - 1) {
      index++;
    }
  }

// 5. tuura jooptu alip kel
  bool getAnswer() {
    return questions[index].answer;
  }

// 6. suroolor buttubu teksher
  bool isFinished() {
    return questions.length - 1 == index;
  }

  // 7. kayradan bashta
  void restart() {
    index = 0;
  }
}

final QuestionsService service = QuestionsService();
