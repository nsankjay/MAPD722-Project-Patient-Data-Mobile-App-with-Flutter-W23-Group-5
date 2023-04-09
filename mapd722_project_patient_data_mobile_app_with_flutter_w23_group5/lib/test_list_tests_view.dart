import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/add_clinical_data_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/add_patient_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/clinical_test_data_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/main.dart';
import 'dart:convert';

import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list1.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list_critical_patients_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

RefreshController _testRefreshController = RefreshController(initialRefresh: false);

class TestListTestsView extends StatefulWidget {
  final String patientID;
  final String patientFirstName;
  final String patientLastname;
  const TestListTestsView(
      {super.key,
      required this.patientID,
      required this.patientFirstName,
      required this.patientLastname});

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
        title: Text(
          "Tests of ${widget.patientFirstName} $lasstName",
          textScaleFactor: 1,
        ),
      ),
      floatingActionButton: Container(
        key: const Key("addNewTestBtn"), //for unit test
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddClinicalDataView(
                      addTestpatientID: widget.patientID,
                      addTestPatientFirstName: widget.patientFirstName,
                      addTestPatientLastName: widget.patientLastname,
                    ),
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
      body: SmartRefresher(
        controller: _testRefreshController,
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: () {
          _testRefreshController.refreshCompleted(resetFooterState: false);
          
          fetchPatientTests();
          
        },
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: patientTests == null ? 0 : patientTests.length,
          itemBuilder: (context, index) {
            //return Text('List item $index');
            //var firstName = patients[0];

            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClinicalTestDataView(
                      patientID: widget.patientID,
                      patientFirstName: widget.patientFirstName,
                      patientLastName: widget.patientLastname,
                      testID: patientTests[index]['_id'],
                    ),
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
      ),
    );
  }
}
