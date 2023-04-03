import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list_tests_view.dart';

void main() {
  testWidgets('test list tests view ...', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TestListTestsView(patientFirstName: '', patientID: '', patientLastname: '',),
      ),
    );

    await tester.pump();
    //expect(find.text('"Tests of'), findsNWidgets(1));

    final addNewTestBtn = find.byKey(Key('addNewTestBtn'));
    expect(addNewTestBtn, findsOneWidget);

    await tester.tap(addNewTestBtn);
    await tester.pumpAndSettle();
  });
}