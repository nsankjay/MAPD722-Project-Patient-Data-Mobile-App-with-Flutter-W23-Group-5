import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/add_clinical_data_view.dart';

void main() {
  testWidgets('add clinical data view ...', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: AddClinicalDataView(addTestPatientFirstName: '', addTestPatientLastName: '', addTestpatientID: '',),
      ),
    );

    await tester.pump();
    expect(find.text('Add Clinical Data'), findsNWidgets(1));

    expect(find.text('New Test'), findsNWidgets(1));

    final testDateField = find.byKey(Key('testDateField'));
    expect(testDateField, findsOneWidget);
    await tester.enterText(testDateField, '11/11/2022');

    final bloodPressureField = find.byKey(Key('bloodPressureField'));
    expect(bloodPressureField, findsOneWidget);
    await tester.enterText(bloodPressureField, '180/90');

    final respiratoryField = find.byKey(Key('respiratoryField'));
    expect(respiratoryField, findsOneWidget);
    await tester.enterText(respiratoryField, '98');

    final bloodOxygenField = find.byKey(Key('bloodOxygenField'));
    expect(bloodOxygenField, findsOneWidget);
    await tester.enterText(bloodOxygenField, '95');

    final heartBeatField = find.byKey(Key('heartBeatField'));
    expect(heartBeatField, findsOneWidget);
    await tester.enterText(heartBeatField, '85');

    final nurseField = find.byKey(Key('nurseField'));
    expect(nurseField, findsOneWidget);
    await tester.enterText(nurseField, 'Hart');

    final saveTestBtn = find.byKey(Key('saveTestBtn'));
    expect(saveTestBtn, findsOneWidget);

    await tester.tap(saveTestBtn);
    await tester.pumpAndSettle();
  });
}