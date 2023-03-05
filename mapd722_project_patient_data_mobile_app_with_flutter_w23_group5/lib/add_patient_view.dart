import 'package:flutter/material.dart';

class AddPatientView extends StatelessWidget {
  const AddPatientView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (
        title: const Text ('Add New Patient'),
        centerTitle: true,
      ),
    );
  }
}