import 'dart:convert';
import 'dart:ffi';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/add_patient_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/list_critical_patients_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/main.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/patient_details_view.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list_critical_patients_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_patient_details_view.dart';

class testList1 extends StatefulWidget {
  const testList1({super.key});

  @override
  State<testList1> createState() => _testList1State();
}

class _testList1State extends State<testList1> {
  //var patientList;
  // List patientsList = [];

  // @override
  // void initState() {
  //   //TODO: implement init state
  //   super.initState();
  //   getData();
  // }

  // void getData() async {
  //   try {
  //     var response = await Dio().get('http://localhost:3500/patients');
  //     if(response.statusCode == 200){

  //       setState(() {
  //         patientsList = response.data[""];
  //       });

  //     } else{
  //       print(response.statusCode);
  //     }
  //     print(response);
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  List patients = [];
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
      });
    } else {
      setState(() {
        patients = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patients List'),
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
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: patients == null ? 0 : patients.length,
        itemBuilder: (context, index) {
          //return Text('List item $index');
          //var firstName = patients[0];

          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PatientDetailsView(),
                ),
              );
            },
            title: Text(patients[index]['firstName'] +
                " " +
                patients[index]['lastName']),
            subtitle: Text(patients[index]['_id']),
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
