import 'package:flutter/material.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/main.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/patient_details_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_description_page.dart';

class TestHomePage extends StatefulWidget {
  const TestHomePage({super.key});

  @override
  State<TestHomePage> createState() => _TestHomePageState();
}

class _TestHomePageState extends State<TestHomePage> {

  Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Text('Patients List Test'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                if (backgroundColor == Colors.white) 
                {
                  backgroundColor = Colors.blue;
                } else {
                  backgroundColor = Colors.white;
                }
              });
            },
            icon: const Icon(
              Icons.color_lens,
            ),
          ),
        ],
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
                onTap: () {},
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 5.0,
              ),
              child: Wrap(
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 233, 148, 139),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(80, 30),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      'Patient List',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 233, 148, 139),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(80, 30),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      'Add Patient',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 233, 148, 139),
                      foregroundColor: Colors.white,
                      minimumSize: const Size(80, 30),
                      shape: const StadiumBorder(),
                    ),
                    child: const Text(
                      'Critical Patients',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //! First Container
            GestureDetector(
              onTap: () {
                print('You Have clicked on Max Payne');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const TestDescritionPage(
                        title: 'Max Payne',
                        imagePath: 'images/slot_cherry_image.jpg',
                      );
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
                  children: [
                    Image.asset('images/slot_cherry_image.jpg'),
                    const ListTile(
                      title: Text('Max Payne'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
            //! Second Container
            GestureDetector(
              onTap: () {
                print('You Have clicked on Mona Sax');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const TestDescritionPage(
                        title: 'Mona Sax',
                        imagePath: 'images/slot_7_image.jpg',
                      );
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
                  children: [
                    Image.asset('images/slot_7_image.jpg'),
                    const ListTile(
                      title: Text('Mona Sax'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
            //! Third Container
            GestureDetector(
              onTap: () {
                print('You Have clicked on Alfred Woden');
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const TestDescritionPage(
                        title: 'Alfred Woden',
                        imagePath: 'images/slot_lemon_image.jpg',
                      );
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
                  children: [
                    Image.asset('images/slot_lemon_image.jpg'),
                    const ListTile(
                      title: Text('Alfred Woden'),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
