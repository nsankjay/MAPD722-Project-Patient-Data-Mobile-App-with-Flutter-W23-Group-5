import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/main.dart';

void main() {
  testWidgets('main ...', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginPage(),
      ),
    );

    await tester.pump();
    expect(find.text('Login'), findsNWidgets(2));

    final userNameField = find.byKey(Key('userNameField'));
    expect(userNameField, findsOneWidget);
    await tester.enterText(userNameField, 'san');

    final passwordField = find.byKey(Key('passwordField'));
    expect(passwordField, findsOneWidget);
    await tester.enterText(passwordField, '123');

    final loginBtn = find.byKey(Key('loginBtn'));
    expect(loginBtn, findsOneWidget);

    await tester.tap(loginBtn);
    await tester.pumpAndSettle();

    //expect(find.text('Patients List'), findsOneWidget);
  });
}
