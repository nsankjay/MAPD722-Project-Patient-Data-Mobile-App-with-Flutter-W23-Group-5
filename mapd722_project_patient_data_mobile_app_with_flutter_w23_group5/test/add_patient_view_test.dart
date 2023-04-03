import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/add_patient_view.dart';

void main() {
  testWidgets('add patient view ...', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AddPatientView(),
      ),
    );

    await tester.pump();
    expect(find.text('Add Patient'), findsNWidgets(1));

    expect(find.text('New Patient'), findsNWidgets(1));

    final firstNameField = find.byKey(Key('firstNameField'));
    expect(firstNameField, findsOneWidget);
    await tester.enterText(firstNameField, 'Nick');

    final lastNameField = find.byKey(Key('lastNameField'));
    expect(lastNameField, findsOneWidget);
    await tester.enterText(lastNameField, 'Fury');

    final dobField = find.byKey(Key('dobField'));
    expect(dobField, findsOneWidget);
    await tester.enterText(dobField, '07/06/1955');

    final addressField = find.byKey(Key('addressField'));
    expect(addressField, findsOneWidget);
    await tester.enterText(addressField, '946 Progress Ave');

    final contactNoField = find.byKey(Key('contactNoField'));
    expect(contactNoField, findsOneWidget);
    await tester.enterText(contactNoField, '1234567891');

    final emailField = find.byKey(Key('emailField'));
    expect(emailField, findsOneWidget);
    await tester.enterText(emailField, 'fury@shield.com');

    final emergencyContactNameField = find.byKey(Key('emergencyContactNameField'));
    expect(emergencyContactNameField, findsOneWidget);
    await tester.enterText(emergencyContactNameField, 'Maria');

    final emergencyContactNoField = find.byKey(Key('emergencyContactNoField'));
    expect(emergencyContactNoField, findsOneWidget);
    await tester.enterText(emergencyContactNoField, '2345165543');

    final departmentField = find.byKey(Key('departmentField'));
    expect(departmentField, findsOneWidget);
    await tester.enterText(departmentField, 'Agent');

    final doctorField = find.byKey(Key('doctorField'));
    expect(doctorField, findsOneWidget);
    await tester.enterText(doctorField, 'Coulson');

    final createPatientBtn = find.byKey(Key('createPatientBtn'));
    expect(createPatientBtn, findsOneWidget);

    await tester.tap(createPatientBtn);
    await tester.pumpAndSettle();

  });
}