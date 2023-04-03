import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:mapd722_project_patient_data_mobile_app_with_flutter_w23_group5/main.dart';

import 'constants.dart';

final TextEditingController firstNameController = TextEditingController();
final TextEditingController lastNameController = TextEditingController();
final TextEditingController eMailController = TextEditingController();
final TextEditingController userNameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class RegisterUserView extends StatelessWidget {
  const RegisterUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: const Text('Sign Up Form'),
        centerTitle: true,
      ),
      body: Center(
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
                    'Registration',
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 45,
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
                    'Enter your details to create a login',
                    style: TextStyle(
                      color: Colors.black26,
                      fontSize: 20,
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
                key: const Key("firstNameField"),
                controller: firstNameController,
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
                key: const Key("lastNameField"),
                controller: lastNameController,
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
                key: const Key("emailField"),
                controller: eMailController,
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
                key: const Key("userNameField"),
                controller: userNameController,
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
                key: const Key("passwordField"),
                controller: passwordController,
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

              //! Register Button
              ElevatedButton(
                onPressed: () async {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (BuildContext context) {
                  //       return const LoginPage();
                  //     },
                  //   ),
                  // );
                  int responseCode = await registerAPI();
                  if (responseCode == 200) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const LoginPage();
                        },
                      ),
                    );
                    firstNameController.clear();
                    lastNameController.clear();
                    eMailController.clear();
                    userNameController.clear();
                    passwordController.clear();
                  } else {
                    _showMyDialog(context);
                  }
                },
                key: const Key("registerUserBtn"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
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

Future<int> registerAPI() async {
  var requestBody = json.encode({
    "firstName": firstNameController.text,
    "lastName": lastNameController.text,
    "email": eMailController.text,
    "username": userNameController.text,
    "password": passwordController.text,
  });
  print(requestBody);
  final response = await http.post(Uri.parse(baseUrl! + "api/register"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
      },
      body: requestBody);
  print(response.body);
  return response.statusCode;
}

Future<void> _showMyDialog(BuildContext context) async {
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
