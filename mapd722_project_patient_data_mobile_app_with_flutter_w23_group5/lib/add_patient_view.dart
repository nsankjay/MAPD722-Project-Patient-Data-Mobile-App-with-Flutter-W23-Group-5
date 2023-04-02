import 'package:flutter/material.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/list_critical_patients_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/list_patients_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/main.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/register_user_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list1.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_list_critical_patients_view.dart';
import 'package:http/http.dart' as http;
import 'constants.dart';
import 'dart:convert';

final TextEditingController addfirstNameController = TextEditingController();
final TextEditingController addlastNameController = TextEditingController();
final TextEditingController addDobController = TextEditingController();
final TextEditingController addAddressController = TextEditingController();
final TextEditingController addContactNoController = TextEditingController();
final TextEditingController addEmailController = TextEditingController();
final TextEditingController addEmergencyNameController = TextEditingController();
final TextEditingController addEmergencyNoController = TextEditingController();
final TextEditingController addDepartmentController = TextEditingController();
final TextEditingController addDoctorController = TextEditingController();

class AddPatientView extends StatelessWidget {
  const AddPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Patient'),
        centerTitle: true,
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
                onTap: () {},
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
                      'New Patient',
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
                      'Enter details to create a new Patient',
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
                  controller: addfirstNameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
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
                  controller: addlastNameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
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
                  controller: addDobController,
                  decoration: InputDecoration(
                    labelText: 'Date of Birth (dd/mm/yyyy)',
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
                  controller: addAddressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
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
                  controller: addContactNoController,
                  decoration: InputDecoration(
                    labelText: 'Contact Number',
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
                  controller: addEmailController,
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
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
                  controller: addEmergencyNameController,
                  decoration: InputDecoration(
                    labelText: 'Emergency Contact Name',
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
                  controller: addEmergencyNoController,
                  decoration: InputDecoration(
                    labelText: 'Emergency Contact Number',
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
                  controller: addDepartmentController,
                  decoration: InputDecoration(
                    labelText: 'Department',
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
                  controller: addDoctorController,
                  decoration: InputDecoration(
                    labelText: 'Attending Doctor',
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

                //! Save New Patient Button
                ElevatedButton(
                  onPressed: () async {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (BuildContext context) {
                    //       return const ListPatientsView();
                    //     },
                    //   ),
                    // );
                    int responseCode = await addPatientAPI();
                    if (responseCode == 200) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const testList1();
                          },
                        ),
                      );
                      addfirstNameController.clear();
                      addlastNameController.clear();
                      addDobController.clear();
                      addAddressController.clear();
                      addContactNoController.clear();
                      addEmailController.clear();
                      addEmergencyNameController.clear();
                      addEmergencyNoController.clear();
                      addDepartmentController.clear();
                      addDoctorController.clear();
                    } else {
                      _showMyDialogAddPatient(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(420, 50),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Create Patient',
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

Future<int> addPatientAPI() async {
  var requestBody = json.encode({
    "firstName": addfirstNameController.text,
    "lastName": addlastNameController.text,
    "dateOfBirth": addDobController.text,
    "address": addAddressController.text,
    "phoneNumber": addContactNoController.text,
    "email": addEmailController.text,
    "emergencyContactName": addEmergencyNameController.text,
    "emergencyContactNumber": addEmergencyNoController.text,
    "assignedDoctor": addDoctorController.text,
    "department": addDepartmentController.text,
  });
  print(requestBody);
  final response = await http.post(Uri.parse(baseUrl! + "patients"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
      },
      body: requestBody);
  print(response.body);
  return response.statusCode;
}

Future<void> _showMyDialogAddPatient(BuildContext context) async {
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
