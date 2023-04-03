import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/register_user_view.dart';

void main() {
  testWidgets('register user view ...', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: RegisterUserView(),
      ),
    );

    await tester.pump();
    expect(find.text('Sign Up Form'), findsNWidgets(1));

    expect(find.text('Registration'), findsNWidgets(1));

    final firstNameField = find.byKey(Key('firstNameField'));
    expect(firstNameField, findsOneWidget);
    await tester.enterText(firstNameField, 'Bret');

    final lastNameField = find.byKey(Key('lastNameField'));
    expect(lastNameField, findsOneWidget);
    await tester.enterText(lastNameField, 'Hart');

    final emailField = find.byKey(Key('emailField'));
    expect(emailField, findsOneWidget);
    await tester.enterText(emailField, 'sharp_shooter@wwe.com');

    final userNameField = find.byKey(Key('userNameField'));
    expect(userNameField, findsOneWidget);
    await tester.enterText(userNameField, 'bret');

    final passwordField = find.byKey(Key('passwordField'));
    expect(passwordField, findsOneWidget);
    await tester.enterText(passwordField, '123');

    final registerUserBtn = find.byKey(Key('registerUserBtn'));
    expect(registerUserBtn, findsOneWidget);

    await tester.tap(registerUserBtn);
    await tester.pumpAndSettle();
  });
}