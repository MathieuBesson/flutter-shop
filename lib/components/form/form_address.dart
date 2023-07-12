import 'package:flutter/material.dart';

class FormAdress extends StatelessWidget {
  final String address;
  final String postalCode;
  final String city;

  FormAdress({
    required this.address,
    required this.postalCode,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            initialValue: address,
            keyboardType: TextInputType.streetAddress,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Adresse',
                hintText: '42 rue des escargots'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrez votre adresse';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: postalCode,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Code postal',
                hintText: '42420'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrez votre code postal';
              }
              return null;
            },
          ),
          TextFormField(
            initialValue: city,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Ville',
                hintText: 'Lorette'),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Entrez votre ville';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
