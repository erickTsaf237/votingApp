

import 'package:apprend/dto/UtilisateurDTO.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';


import 'monDrawer.dart';

//ignore_for_file: annotate_overrides, omit_local_variable_types
class CreateAcount extends StatelessWidget {
  const CreateAcount({super.key});

  @override
  Widget build(BuildContext context) {
    return  LogupPage();
  }
}

class LogupPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LogupPage> {
  final _formKey = GlobalKey<FormState>();
  late UtilisateurDTO _utilisateur =  UtilisateurDTO();
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
              appBar: AppBar(
                title: const Text('Create your Account'),
              ),
              drawer: MonDrawer(),
              body: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Last Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Your Last Name';
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value!,
                    ),TextFormField(
                      decoration: InputDecoration(labelText: 'First Name'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Your first Name';
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value!,
                    ),TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Email';
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value!,
                    ),TextFormField(
                      decoration: InputDecoration(labelText: 'Adresse email'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Veuillez entrer une adresse email';
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value!,
                    ),
                    Row(
                    children: [
                      ElevatedButton(onPressed: () async {
                        final selectedDate = await showDatePicker(
                            context: context,
                            initialDate: _utilisateur.dateNaissance ?? DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100)
                        );
                        if(selectedDate != null){
                          setState(() {
                            _utilisateur.dateNaissance = selectedDate;
                          });
                        }
                      }, child: const Text("Select a date")),
                      Text(_utilisateur.dateNaissance.toString()),
                    ],
                    ),
                    Row(
                      children: [
                         CSCPicker(
                          onCountryChanged: (value) => {},
                           onCityChanged: (value) {

                           },
                           onStateChanged: (value) {

                           },
                         ),
                        TextFormField(
                          decoration: const InputDecoration(labelText: 'Phone Number'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Phone Number';
                            }
                            return null;
                          },
                          onSaved: (value) => _email = value!,
                        )
                      ],
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter Your password';
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value!,
                      obscureText: true,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Confirm your Password'),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please confirm your password';
                        }
                        return null;
                      },
                      onSaved: (value) => _password = value!,
                      obscureText: true,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: _createAnAccount,
                          child: Text('Create an Account'),
                        ),
                        ElevatedButton(
                          onPressed: _submit,
                          child: Text('Submit'),
                        ),
                      ],
                    )

                  ],
                ),
              ),
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


  }
}
