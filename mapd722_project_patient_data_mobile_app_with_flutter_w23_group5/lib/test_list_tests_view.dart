import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/add_patient_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/clinical_test_data_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/main.dart';
import 'dart:convert';
import 'dart:ffi';

import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list1.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list_critical_patients_view.dart';

class TestListTestsView extends StatefulWidget {
  const TestListTestsView({super.key});

  @override
  State<TestListTestsView> createState() => _TestListTestsViewState();
}

class _TestListTestsViewState extends State<TestListTestsView> {

  List patientTests = [];
  bool isLoading = false;
  String patienId = '636109c1f09a7e4a5483107d';

  @override
  void initState() {
    //Todo implement init state
    super.initState();
    this.fetchPatientTests();
  }

  fetchPatientTests() async {
    print("Fetching....");
    var url = "http://localhost:3500/patients/$patienId/tests";
    var response = await http.get(Uri.parse(url));
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      var items = json.decode(response.body);
      setState(() {
        patientTests = items;
      });
    } else {
      setState(() {
        patientTests = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tests of $patienId", textScaleFactor: 0.9,),
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
                onTap: () {
                  Navigator.of(context).pushReplacement(
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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: patientTests == null ? 0 : patientTests.length,
        itemBuilder: (context, index) {
          //return Text('List item $index');
          //var firstName = patients[0];

          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ClinicalTestDataView(),
                ),
              );
            },
            title: Text(patientTests[index]['dateTime']),
            subtitle: Text(patientTests[index]['_id']),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          );
        },
        // separatorBuilder: (BuildContext context, int index) {
        //   return const Divider();
        // },
      ),
    );
  }
}