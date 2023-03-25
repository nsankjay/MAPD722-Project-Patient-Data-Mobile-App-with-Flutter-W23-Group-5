import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/add_clinical_data_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/add_patient_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/clinical_test_data_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/main.dart';
import 'dart:convert';

import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list1.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list_critical_patients_view.dart';

class TestListTestsView extends StatefulWidget {
  final String patientID;
  final String patientFirstName;
  final String patientLastname;
  const TestListTestsView({super.key, required this.patientID, required this.patientFirstName, required this.patientLastname});

  @override
  State<TestListTestsView> createState() => _TestListTestsViewState();
}

class _TestListTestsViewState extends State<TestListTestsView> {

  List patientTests = [];
  bool isLoading = false;
  //String patienId = widget.patientID;

  @override
  void initState() {
    //Todo implement init state
    super.initState();
    this.fetchPatientTests();
  }

  fetchPatientTests() async {
    print("Fetching....");
    var url = "http://localhost:3500/patients/${widget.patientID}/tests";
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
    String lasstName;
    lasstName = widget.patientLastname;
    return Scaffold(
      appBar: AppBar(
        title: Text("Tests of ${widget.patientFirstName} $lasstName", textScaleFactor: 1,),
      ),
      floatingActionButton: Container(
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
                      return const AddClinicalDataView();
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
      // drawer: SafeArea(
      //   child: Drawer(
      //     child: Column(
      //       children: [
      //         const DrawerHeader(
      //           decoration: BoxDecoration(
      //             color: Colors.blue,
      //           ),
      //           child: ListTile(
      //             title: Text(
      //               'WeCare App',
      //               style: TextStyle(color: Colors.white, fontSize: 20.0),
      //             ),
      //           ),
      //         ),
      //         ListTile(
      //           onTap: () {
      //             Navigator.of(context).push(
      //               MaterialPageRoute(
      //                 builder: (BuildContext context) {
      //                   return const testList1();
      //                 },
      //               ),
      //             );
      //           },
      //           leading: const Icon(Icons.person),
      //           title: const Text(
      //             'Patients List',
      //           ),
      //         ),
      //         ListTile(
      //           onTap: () {
      //             Navigator.of(context).push(
      //               MaterialPageRoute(
      //                 builder: (BuildContext context) {
      //                   return const AddPatientView();
      //                 },
      //               ),
      //             );
      //           },
      //           leading: const Icon(Icons.document_scanner_rounded),
      //           title: const Text(
      //             'Add Patient',
      //           ),
      //         ),
      //         ListTile(
      //           onTap: () {
      //             Navigator.of(context).pushReplacement(
      //               MaterialPageRoute(
      //                 builder: (BuildContext context) {
      //                   return const TestListCriticalPatientsView();
      //                 },
      //               ),
      //             );
      //           },
      //           leading: const Icon(Icons.crisis_alert_rounded),
      //           title: const Text(
      //             'Critical Patients',
      //           ),
      //         ),
      //         ListTile(
      //           onTap: () {
      //             Navigator.of(context).pushReplacement(
      //               MaterialPageRoute(
      //                 builder: (BuildContext context) {
      //                   return const LoginPage();
      //                 },
      //               ),
      //             );
      //           },
      //           leading: const Icon(Icons.logout_rounded),
      //           title: const Text(
      //             'Logout',
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
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