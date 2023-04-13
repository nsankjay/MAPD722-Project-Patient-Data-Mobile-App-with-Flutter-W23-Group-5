import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/add_patient_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/list_critical_patients_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/main.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/patient_details_view.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list_critical_patients_view.dart';

class testList1 extends StatefulWidget {
  const testList1({super.key});

  @override
  State<testList1> createState() => _testList1State();
}

class _testList1State extends State<testList1> {
  List patients = [];
  List patientsForDisplay = [];
  bool isLoading = false;

  @override
  void initState() {
    //Todo implement init state
    super.initState();
    this.fetchPatient();
  }

  fetchPatient() async {
    print("Fetching....");
    var url = "http://localhost:3500/patients";
    var response = await http.get(Uri.parse(url));
    //print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        patients = items;
        patientsForDisplay = items;
      });
    } else {
      setState(() {
        patients = [];
        patientsForDisplay = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients List'),
      ),
      floatingActionButton: Container(
        key: const Key("addNewPatientBtn"), //for unit test
        height: 70,
        width: 70,
        child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromARGB(255, 233, 148, 139), width: 3.0),
              color: const Color.fromARGB(255, 233, 148, 139),
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(500.0),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const AddPatientView();
                    },
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                size: 35,
              ),
            ),
          ),
        ),
      ),
      drawer: SafeArea(
        child: Drawer(
          child: Column(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: ListTile(
                  title: Text(
                    'WeCare App',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                ),
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.person),
                title: const Text(
                  'Patients List',
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const AddPatientView();
                      },
                    ),
                  );
                },
                leading: const Icon(Icons.document_scanner_rounded),
                title: const Text(
                  'Add Patient',
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const TestListCriticalPatientsView();
                      },
                    ),
                  );
                },
                leading: const Icon(Icons.crisis_alert_rounded),
                title: const Text(
                  'Critical Patients',
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const LoginPage();
                      },
                    ),
                  );
                },
                leading: const Icon(Icons.logout_rounded),
                title: const Text(
                  'Logout',
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: 'Search Patient',
                suffixIcon: Icon(Icons.search),
              ),
              onChanged: (text) {
                text = text.toLowerCase();
                setState(() {
                  patientsForDisplay = patients.where((patient) {
                    var patientTitle = patient['firstName'].toLowerCase() + patient['lastName'].toLowerCase();
                    return patientTitle.contains(text);
                  }).toList();
                });
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.28,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: patientsForDisplay == null ? 0 : patientsForDisplay.length,
              itemBuilder: (context, index) {
                //return Text('List item $index');
                //var firstName = patients[0];

                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientDetailsView(
                          patientID: patientsForDisplay[index]['_id'],
                        ),
                      ),
                    );
                  },
                  title: Text(patientsForDisplay[index]['firstName'] +
                      " " +
                      patientsForDisplay[index]['lastName']),
                  subtitle: Text(patientsForDisplay[index]['_id']),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                );
              },
              // separatorBuilder: (BuildContext context, int index) {
              //   return const Divider();
              // },
            ),
          ),
        ],
      ),
    );
  }
}
