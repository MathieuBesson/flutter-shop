import 'package:flutter/material.dart';

class FormName extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String username;

  FormName({
    required this.firstName,
    required this.lastName,
    required this.username,
  });

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            initialValue: lastName,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Nom',
                hintText: 'John'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrez votre nom';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: firstName,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Prénom',
                hintText: 'Doe'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrez votre prénom';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: username,
            keyboardType: TextInputType.name,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Pseudo',
                hintText: 'Jodo'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrez votre pseudo';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
