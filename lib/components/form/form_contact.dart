import 'package:flutter/material.dart';

class FormContact extends StatelessWidget {
  final String phone;
  final String email;

  FormContact({
    required this.phone,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            initialValue: phone,
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Téléphone',
                hintText: '+33102030405'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrez votre numéro de télephone';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: email,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Email',
                hintText: 'john.doe@nonymous.com'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrez votre email';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
