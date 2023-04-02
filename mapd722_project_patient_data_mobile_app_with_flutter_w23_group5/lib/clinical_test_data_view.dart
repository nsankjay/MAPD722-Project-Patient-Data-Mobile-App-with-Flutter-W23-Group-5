import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'dart:math';
import 'package:flutter/material.dart';

String testPatientId = "patientId";
String testTestId = "_id";
String dateTime = "dateTime";
String bloodPressure = "bloodPressure";
String respiratoryRate = "respiratoryRate";
String bloodOxygenLevel = "bloodOxygenLevel";
String heartbeatRate = "heartbeatRate";
String nurseName = "nurseName";
bool criticalStatus = true;
bool isLoaded = false;

class ClinicalTestDataView extends StatefulWidget {
  
  final String patientID;
  final String testID;
  final String patientFirstName;
  final String patientLastName;

  const ClinicalTestDataView({
    super.key,
    required this.patientID,
    required this.testID,
    required this.patientFirstName,
    required this.patientLastName,
    });

  @override
  State<ClinicalTestDataView> createState() => _ClinicalTestDataViewState();
}

class _ClinicalTestDataViewState extends State<ClinicalTestDataView> {

  Future<void> getTestDetails() async {
    // var requestBody = json.encode({
    //   "username":userNameController.text,
    //   "password":passwordController.text,
    // });
    // print(requestBody);
    final response = await http.get(
      Uri.parse(baseUrl! + "patients/tests/" + widget.testID),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
      },
      // body:  requestBody
    );
    Map<String, dynamic> map = json.decode(response.body);
    // List<dynamic> data = map["patient"];
    print(map["patientSingleTest"]["patientId"]);
    setState(() {
      isLoaded = true;
      testTestId = map["patientSingleTest"]["_id"];
      testPatientId = map["patientSingleTest"]["patientId"];
      dateTime = map["patientSingleTest"]["dateTime"];
      bloodPressure = map["patientSingleTest"]["bloodPressure"];
      respiratoryRate = map["patientSingleTest"]["respiratoryRate"];
      bloodOxygenLevel = map["patientSingleTest"]["bloodOxygenLevel"];
      heartbeatRate = map["patientSingleTest"]["heartbeatRate"];
      nurseName = map["patientSingleTest"]["nurseName"];
      criticalStatus = map["patientSingleTest"]["criticalStatus"];
    });
    // print(response.body);
    // return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {

    if (!isLoaded) {
      getTestDetails();
    }


    return WillPopScope(
      onWillPop: () async {
        isLoaded = false;
        Navigator.pop(context);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          title: Text('Test Data'),
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
                  Text(
                    "${widget.patientFirstName} ${widget.patientLastName}",
                    style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
    
                  Wrap(
                    children: [
                      const Text(
                        'Test ID: ',
                        style: TextStyle(
                          color: Colors.black26,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        testTestId,
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textScaleFactor: 0.8,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 35.0,
                  ),
    
                  //! Text Labels nad Result Labels to display Test info
                  Row(
                    children: [
                      const Text(
                        'Test Date: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        dateTime,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
    
                  Row(
                    children: [
                      const Text(
                        'Blood Pressure - mmhg: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bloodPressure,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
    
                  Row(
                    children: [
                      const Text(
                        'Respiratory Rate - /min: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        respiratoryRate,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
    
                  Row(
                    children: [
                      const Text(
                        'Blood Oxygen Level (%): ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        bloodOxygenLevel,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
    
                  Row(
                    children: [
                      const Text(
                        'Heart-Beat Rate - /min: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        heartbeatRate,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
    
                  Row(
                    children: [
                      const Text(
                        'Nurse Name: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        nurseName,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
    
                  Row(
                    children: [
                      const Text(
                        'Health Condition: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        criticalStatus ? "Critical" : "Normal",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          backgroundColor:
                              criticalStatus ? Colors.red : Colors.lightGreen,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}