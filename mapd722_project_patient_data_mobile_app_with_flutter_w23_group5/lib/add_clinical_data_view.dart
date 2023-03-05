import 'package:flutter/material.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/list_tests_view.dart';

class AddClinicalDataView extends StatelessWidget {
  const AddClinicalDataView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Text('Add Clinical Data'),
        centerTitle: true,
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
                      'New Test',
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
                      'Enter details to create new Clinical Data/Test',
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
                  decoration: InputDecoration(
                    labelText: 'Test Date (dd/mm/yyyy)',
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
                  decoration: InputDecoration(
                    labelText: 'Blood Pressure - mmhg',
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
                  decoration: InputDecoration(
                    labelText: 'Respiratory Rate - /min',
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
                  decoration: InputDecoration(
                    labelText: 'Blood Oxygen Level (%)',
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
                  decoration: InputDecoration(
                    labelText: 'Heart-Beat Rate - /min',
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
                  decoration: InputDecoration(
                    labelText: 'Nurse Name',
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

                //! Save New Clinical Data
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const ListTestsView();
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(420, 50),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    'Save Data',
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
