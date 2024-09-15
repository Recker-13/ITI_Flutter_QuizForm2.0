import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';  // Ensure this path is correct for your project

void main() {
  testWidgets('Welcome screen test', (WidgetTester tester) async {
    // Build the QuizApp widget and trigger a frame.
    await tester.pumpWidget(QuizApp());

    // Verify if the 'QUIZ' title is present on the screen.
    expect(find.text('QUIZ'), findsOneWidget);

    // Verify if the 'WELCOME' message is present on the screen.
    expect(find.text('WELCOME'), findsOneWidget);

    // Verify if the 'Submit' button is present on the screen.
    expect(find.text('Submit'), findsOneWidget);
  });

  testWidgets('Quiz screen test', (WidgetTester tester) async {
    // Build the QuizApp widget and navigate to the QuizScreen.
    await tester.pumpWidget(QuizApp());
    await tester.enterText(find.byType(TextField), 'Test User');
    await tester.tap(find.text('Submit'));
    await tester.pumpAndSettle();

    // Verify if the first question is present on the screen.
    expect(find.text('Who is the best superhero?'), findsOneWidget);

    // Select the correct answer for the first question.
    await tester.tap(find.text('Batman'));
    await tester.pump();

    // Verify if the 'Next' button is present and enable it.
    expect(find.text('Next'), findsOneWidget);
    expect(tester.widget<ElevatedButton>(find.text('Next')).enabled, true);

    // Move to the next question.
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Verify if the second question is present on the screen.
    expect(find.text('What is the largest planet in the solar system?'), findsOneWidget);

    // Select the correct answer for the second question.
    await tester.tap(find.text('Jupiter'));
    await tester.pump();

    // Move to the third question.
    await tester.tap(find.text('Next'));
    await tester.pumpAndSettle();

    // Verify if the third question is present on the screen.
    expect(find.text('What is the speed of light?'), findsOneWidget);

    // Select the correct answer for the third question.
    await tester.tap(find.text('300,000 km/s'));
    await tester.pump();

    // Verify if the 'Finish' button is present and enabled.
    expect(find.text('Finish'), findsOneWidget);
    expect(tester.widget<ElevatedButton>(find.text('Finish')).enabled, true);

    // Tap the 'Finish' button and verify the success message.
    await tester.tap(find.text('Finish'));
    await tester.pumpAndSettle();

    // Verify if the result screen is displayed with the correct message.
    expect(find.text('Congratulations Test User!'), findsOneWidget);
    expect(find.text('You answered 3 out of 3 questions correctly.'), findsOneWidget);
    expect(find.text('Your score is: 3'), findsOneWidget);
  });
}
