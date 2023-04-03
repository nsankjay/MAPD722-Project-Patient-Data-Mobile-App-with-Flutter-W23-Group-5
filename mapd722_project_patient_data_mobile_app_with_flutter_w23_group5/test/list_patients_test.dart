import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list1.dart';

void main() {
  testWidgets('test list1 ...', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: testList1(),
      ),
    );

    await tester.pump();
    expect(find.text('Patients List'), findsNWidgets(1));

    final addNewPatientBtn = find.byKey(Key('addNewPatientBtn'));
    expect(addNewPatientBtn, findsOneWidget);

    await tester.tap(addNewPatientBtn);
    await tester.pumpAndSettle();

    //expect(find.text('Patients List'), findsOneWidget);
  });
}