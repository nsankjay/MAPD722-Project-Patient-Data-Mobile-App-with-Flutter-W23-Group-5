import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ffi';

class TestPatientDetailsView extends StatefulWidget {

  const TestPatientDetailsView(patient, {super.key});

  @override
  State<TestPatientDetailsView> createState() => _TestPatientDetailsViewState();
}

class _TestPatientDetailsViewState extends State<TestPatientDetailsView> {

  List patientDetails = [];
  bool isLoading = false;

  @override
  void initState() {
    //Todo implement init state
    super.initState();
    this.fetchPatientDetails();
  }

  fetchPatientDetails() async {
    print("Fetching....");
    var url = "http://localhost:3500/patients/636109c1f09a7e4a5483107d";
    var response = await http.get(Uri.parse(url));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['patient'];
      setState(() {
        patientDetails = items;
      });
    } else {
      setState(() {
        patientDetails = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sankjay Nithyanandalingam'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: patientDetails == null ? 0 : patientDetails.length,
        itemBuilder: (context, index) {
          //return Text('List item $index');
          //var firstName = patients[0];

          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => TestPatientDetailsView(patientDetails[index]),
                ),
              );
            },
            title: Text(patientDetails[index]['firstName'] +
                " " +
                patientDetails[index]['lastName']),
            subtitle: Text(patientDetails[index]['_id']),
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