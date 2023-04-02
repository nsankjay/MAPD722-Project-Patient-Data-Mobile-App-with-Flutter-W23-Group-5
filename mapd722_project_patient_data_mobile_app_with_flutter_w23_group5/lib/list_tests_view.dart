import 'package:flutter/material.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/add_clinical_data_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/clinical_test_data_view.dart';

class ListTestsView extends StatelessWidget {
  const ListTestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Text('Patient Tests List'),
        centerTitle: true,
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
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return const ClinicalTestDataView();
                //     },
                //   ),
                // );
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
                      title: Text('Test on 04/03/2023'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (BuildContext context) {
                //       return const ClinicalTestDataView();
                //     },
                //   ),
                // );
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
                      title: Text('Test on 05/03/2023'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const AddClinicalDataView();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 233, 148, 139),
                foregroundColor: Colors.white,
                minimumSize: const Size(410, 50),
                shape: const StadiumBorder(),
              ),
              child: const Text(
                '+ Test',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}