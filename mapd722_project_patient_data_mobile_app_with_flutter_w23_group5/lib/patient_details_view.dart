// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/list_tests_view.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list_tests_view.dart';

import 'constants.dart';

String patientId = "patientID";
String firstName = "firstName";
String lastName = "lastName";
String dateOfBirth = "dateOfBirth";
String address = "address";
String phoneNumber = "phoneNumber";
String email = "email";
String emergencyContactName = "emergencyContactName";
String emergencyContactNumber = "emergencyContactNumber";
String assignedDoctor = "assignedDoctor";
String department = "department";
bool criticalStatus = true;
bool isLoaded = false;

class PatientDetailsView extends StatefulWidget {
  final String patientID;
  const PatientDetailsView({super.key, required this.patientID});

  @override
  State<PatientDetailsView> createState() => _PatientDetailsViewState();
}

class _PatientDetailsViewState extends State<PatientDetailsView> {
  Future<void> getPatientDetails() async {
    // var requestBody = json.encode({
    //   "username":userNameController.text,
    //   "password":passwordController.text,
    // });
    // print(requestBody);
    final response = await http.get(
      Uri.parse(baseUrl! + "patients/" + widget.patientID),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
      },
      // body:  requestBody
    );
    Map<String, dynamic> map = json.decode(response.body);
    // List<dynamic> data = map["patient"];
    print(map["patient"]["firstName"]);
    setState(() {
      isLoaded = true;
      firstName = map["patient"]["firstName"];
      lastName = map["patient"]["lastName"];
      dateOfBirth = map["patient"]["dateOfBirth"];
      address = map["patient"]["address"];
      phoneNumber = map["patient"]["phoneNumber"];
      email = map["patient"]["email"];
      emergencyContactName = map["patient"]["emergencyContactName"];
      emergencyContactNumber = map["patient"]["emergencyContactNumber"];
      assignedDoctor = map["patient"]["assignedDoctor"];
      department = map["patient"]["department"];
      criticalStatus = map["patient"]["criticalStatus"];
      patientId = map["patient"]["_id"];
    });
    // print(response.body);
    // return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    if (!isLoaded) {
      getPatientDetails();
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
          title: const Text('Patients Details'),
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
                    children: [
                      Text(
                        firstName + " " + lastName,
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  //! Go to Tests List View Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TestListTestsView(
                            patientID: patientId,
                            patientFirstName: firstName,
                            patientLastname: lastName,
                            
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 233, 148, 139),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(420, 50),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      'View Tests',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  //! Text Labels nad Result Labels to display patient info
                  Row(
                    children: [
                      Text(
                        'First Name: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        firstName,
                        style: TextStyle(
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
                      Text(
                        'Last Name: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        lastName,
                        style: TextStyle(
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
                      Text(
                        'Date of Birth: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        dateOfBirth,
                        style: TextStyle(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Address: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: MediaQuery.of(context).size.height / 20,
                        child: Text(
                          address,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  Row(
                    children: [
                      Text(
                        'Contact Number: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        phoneNumber,
                        style: TextStyle(
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
                      Text(
                        'E-Mail: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        email,
                        style: TextStyle(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Emergency Contact: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 5,
                        height: MediaQuery.of(context).size.height / 35,
                        child: Text(
                          emergencyContactName,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Emergency Number: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.5,
                        //height: MediaQuery.of(context).size.height/35,
                        child: Text(
                          maxLines: 2,
                          emergencyContactNumber,
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),

                  Row(
                    children: [
                      Text(
                        'Department: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        department,
                        style: TextStyle(
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
                      Text(
                        'Attending Doctor: ',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        assignedDoctor,
                        style: TextStyle(
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
                      Text(
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
