import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ffi';

import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/add_patient_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/list_critical_patients_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/main.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/patient_details_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list1.dart';

class TestListCriticalPatientsView extends StatefulWidget {
  const TestListCriticalPatientsView({super.key});

  @override
  State<TestListCriticalPatientsView> createState() =>
      _TestListCriticalPatientsViewState();
}

class _TestListCriticalPatientsViewState
    extends State<TestListCriticalPatientsView> {
  List criticalPatients = [];
  List criticalPatientsForDisplay = [];
  bool isLoading = false;

  @override
  void initState() {
    //Todo implement init state
    super.initState();
    this.fetchCriticalPatientDetails();
  }

  fetchCriticalPatientDetails() async {
    print("Fetching....");
    var url = "http://localhost:3500/patients/criticalStatus";
    var response = await http.get(Uri.parse(url));
    //print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        criticalPatients = items;
        criticalPatientsForDisplay = items;
      });
    } else {
      setState(() {
        criticalPatients = [];
        criticalPatientsForDisplay = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Critical Patients List'),
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
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const testList1();
                      },
                    ),
                  );
                },
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
                onTap: () {},
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
                  criticalPatientsForDisplay =
                      criticalPatients.where((criticalPatient) {
                    var criticalPatientTitle =
                        criticalPatient['firstName'].toLowerCase() +
                            criticalPatient['lastName'].toLowerCase();
                    return criticalPatientTitle.contains(text);
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
              itemCount: criticalPatientsForDisplay == null
                  ? 0
                  : criticalPatientsForDisplay.length,
              itemBuilder: (context, index) {
                //return Text('List item $index');
                //var firstName = patients[0];

                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PatientDetailsView(
                          patientID: criticalPatientsForDisplay[index]['_id'],
                        ),
                      ),
                    );
                  },
                  title: Text(criticalPatientsForDisplay[index]['firstName'] +
                      " " +
                      criticalPatientsForDisplay[index]['lastName']),
                  subtitle: Text(criticalPatientsForDisplay[index]['_id']),
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
