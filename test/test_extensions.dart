import 'dart:collection';

import 'package:mockito/mockito.dart';

extension MultipleExpectations<T> on PostExpectation<T> {
  void thenAnswerInOrder(List<T> answers) {
    final qAnswers = Queue.of(answers);
    thenAnswer(
      (realInvocation) => qAnswers.removeFirst(),
    );
  }
}
