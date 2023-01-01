import 'package:apprend/pages/CreateAccount.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:csc_picker/model/select_status_model.dart';
import 'package:flutter/material.dart';

import 'monDrawer.dart';

class Connexion extends StatelessWidget {
  const Connexion({super.key});

  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
                title: Text('Login'),
              ),
              drawer: MonDrawer(),
              body: CSCPicker(
                  onStateChanged: (value) {

                  },
                onCityChanged: (value) {

                },
                onCountryChanged: (value) {

                },
                layout: Layout.vertical,
              )
            );
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // ici, vous pouvez envoyer les données de connexion à votre serveur
      // et gérer la réponse (réussie ou non) en conséquence
    }
  }

  void _createAnAccount() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
            const CreateAcount()));
  }
}
