import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/list_patients_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/patient_details_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/register_user_view.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_home_page.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/test_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeCare App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   title: const Text('Welcome'),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome',
                style: TextStyle(
                  color: Color.fromARGB(255, 233, 148, 139),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'WeCare Healthcare',
                style: TextStyle(
                  color: Color.fromARGB(255, 85, 202, 241),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              // Image.network(
              //     'https://png.pngtree.com/template/20190926/ourmid/pngtree-medical-pharmacy-heart-healthcare-logo-vector-graphic-design-image_309769.jpg'),
              Image.asset(
                'images/healthcarelogo.webp',
                // height: 250,
                // width: 250,
              ),
              Row(
                children: const [
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'User Name',
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
                  labelText: 'Password',
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

              //! Login Button
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const ListPatientsView();
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
                  'Login',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),

               const SizedBox(
                height: 10,
              ),

              //! Register Button
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const RegisterUserView();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 233, 148, 139),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(420, 50),
                  shape: const StadiumBorder(),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
