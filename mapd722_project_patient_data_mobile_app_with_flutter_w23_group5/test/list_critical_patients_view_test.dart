import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list_critical_patients_view.dart';

void main() {
  testWidgets('test list critical patients view ...', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: TestListCriticalPatientsView(),
      ),
    );

    await tester.pump();
    expect(find.text('Critical Patients List'), findsNWidgets(1));

    await tester.pumpAndSettle();
  });
}