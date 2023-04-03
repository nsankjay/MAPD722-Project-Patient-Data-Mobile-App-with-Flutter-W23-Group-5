import 'package:flutter/material.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/list_tests_view.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/patient_details_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list_tests_view.dart';
import 'constants.dart';
import 'dart:convert';
import 'dart:math';

final TextEditingController addTestDateController = TextEditingController();
final TextEditingController addBloodPressureController = TextEditingController();
final TextEditingController addRespiratoryController = TextEditingController();
final TextEditingController addBloodOxygenController = TextEditingController();
final TextEditingController addHeartBeatController = TextEditingController();
final TextEditingController addNurseNameController = TextEditingController();

class AddClinicalDataView extends StatefulWidget {

  final String addTestpatientID;
  final String addTestPatientFirstName;
  final String addTestPatientLastName;

  const AddClinicalDataView({super.key,
  required this.addTestpatientID,
  required this.addTestPatientFirstName,
  required this.addTestPatientLastName,

  });

  @override
  State<AddClinicalDataView> createState() => _AddClinicalDataViewState();
}

class _AddClinicalDataViewState extends State<AddClinicalDataView> {

  @override
  Widget build(BuildContext context) {

    String patientIDforAPI = widget.addTestpatientID;

    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Text('Add Clinical Data'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: const [
                    Text(
                      'New Test',
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: const [
                    Text(
                      'Enter details to create new Clinical Data/Test',
                      style: TextStyle(
                        color: Colors.black26,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),

                //! Text Fields
                TextField(
                  key: const Key("testDateField"), //for unit test
                  controller: addTestDateController,
                  decoration: InputDecoration(
                    labelText: 'Test Date (dd/mm/yyyy)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  //keyboardType: TextInputType.number,
                  //inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  key: const Key("bloodPressureField"), //for unit test
                  controller: addBloodPressureController,
                  decoration: InputDecoration(
                    labelText: 'Blood Pressure - mmhg',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  //keyboardType: TextInputType.number,
                  //inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  key: const Key("respiratoryField"), //for unit test
                  controller: addRespiratoryController,
                  decoration: InputDecoration(
                    labelText: 'Respiratory Rate - /min',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  //keyboardType: TextInputType.number,
                  //inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  key: const Key("bloodOxygenField"), //for unit test
                  controller: addBloodOxygenController,
                  decoration: InputDecoration(
                    labelText: 'Blood Oxygen Level (%)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  //keyboardType: TextInputType.number,
                  //inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  key: const Key("heartBeatField"), //for unit test
                  controller: addHeartBeatController,
                  decoration: InputDecoration(
                    labelText: 'Heart-Beat Rate - /min',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  //keyboardType: TextInputType.number,
                  //inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  key: const Key("nurseField"), //for unit test
                  controller: addNurseNameController,
                  decoration: InputDecoration(
                    labelText: 'Nurse Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  //keyboardType: TextInputType.number,
                  //inputFormatters: <TextInputFormatter> [FilteringTextInputFormatter.digitsOnly],
                ),
                const SizedBox(
                  height: 10,
                ),

                //! Save New Clinical Data
                ElevatedButton(
                  onPressed: () async {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) {
                    //       return const ListTestsView();
                    //     },
                    //   ),
                    // );
                    int responseCode = await addClinicalDataAPI();
                    if (responseCode == 200) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => TestListTestsView(
                            patientID: widget.addTestpatientID,
                            patientFirstName: widget.addTestPatientFirstName,
                            patientLastname: widget.addTestPatientLastName,
                            
                          ),
                        ),
                      );
                      addTestDateController.clear();
                      addBloodPressureController.clear();
                      addRespiratoryController.clear();
                      addBloodOxygenController.clear();
                      addHeartBeatController.clear();
                      addNurseNameController.clear();
                    } else {
                      _showMyDialogAddClinicalData(context);
                    }
                  },
                  key: const Key("saveTestBtn"), //for unit test
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(420, 50),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Save Data',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<int> addClinicalDataAPI() async {

  var requestBody = json.encode({
    "patientId": patientId,
    "dateTime": addTestDateController.text,
    "bloodPressure": addBloodPressureController.text,
    "respiratoryRate": addRespiratoryController.text,
    "bloodOxygenLevel": addBloodOxygenController.text,
    "heartbeatRate": addHeartBeatController.text,
    "nurseName": addNurseNameController.text,
    //add Critical status
  });
  print(requestBody);
  final response = await http.post(Uri.parse(baseUrl! + "patients/clinicalRecords"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
      },
      body: requestBody);
  print(response.body);
  return response.statusCode;
}

// Future<int> updateCriticalStatusAPI() async {

//   var requestBody2 = json.encode({
//     "criticalStatus": //need to add a variable,
//   });
//   print(requestBody2);
//   final response = await http.post(Uri.parse(baseUrl! + "patients/criticalStatus/" + patientId),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//         "Accept": "application/json",
//       },
//       body: requestBody2);
//   print(response.body);
//   return response.statusCode;
// }

Future<void> _showMyDialogAddClinicalData(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Missing Data'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              //Text('Login Error'),
              Text('All fields are mandatory. please enter data'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

