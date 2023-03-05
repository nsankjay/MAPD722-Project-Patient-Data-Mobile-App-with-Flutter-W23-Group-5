import 'package:flutter/material.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/add_patient_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/list_patients_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/main.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/patient_details_view.dart';

class ListCriticalPatientsView extends StatelessWidget {
  const ListCriticalPatientsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text ('Critical Patients List'),
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
                        return const ListPatientsView();
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
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              // child: Wrap(
              //   spacing: 10,
              //   children: const [

              //   ],
              // ),
            ),
           
            GestureDetector(
              onTap: () {
                print('You Have clicked on Mona Sax');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const PatientDetailsView();
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                //color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: const [
                    ListTile(
                      title: Text('Mona Sax'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                print('You Have clicked on Alfred Woden');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const PatientDetailsView();
                    },
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                //color: Colors.white,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: const [
                    ListTile(
                      title: Text('Alfred Woden'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            
          ],
        ),
      ),
    );
  }
}