import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab04_magic8ball/main.dart';

void main() {
  testWidgets('Mỗi lần hỏi chọn đúng câu trả lời từ danh sách', (tester) async {
    final random = Random(4);
    await tester.pumpWidget(
      MaterialApp(home: MagicBallPage(random: Random(4))),
    );
    expect(find.text('Điều gì đang chờ bạn?'), findsOneWidget);
    for (var i = 0; i < 12; i++) {
      await tester.ensureVisible(find.byKey(const Key('ask')));
      await tester.tap(find.byKey(const Key('ask')));
      await tester.pumpAndSettle();
      expect(
        tester.widget<Text>(find.byKey(const Key('answer'))).data,
        answers[random.nextInt(answers.length)],
      );
    }
    expect(tester.takeException(), isNull);
  });
}
