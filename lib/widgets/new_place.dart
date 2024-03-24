import 'package:flutter/material.dart';

import 'package:favorite_places/models/place.dart';

class NewPlace extends StatefulWidget {
  const NewPlace({super.key});

  @override
  State<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends State<NewPlace> {
  var _enteredName = "";

  final _formKey = GlobalKey<FormState>();

  void _addPlace() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.of(context).pop<Place>(
        Place(name: _enteredName),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah alamat baru")),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.place),
                  label: Text("Nama"),
                ),
                style: const TextStyle(color: Colors.white),
                initialValue: _enteredName,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Nama alamat tidak boleh kosong";
                  }
                  return null;
                },
                onSaved: (newValue) {
                  _enteredName = newValue!;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: _addPlace,
                label: const Text("Tambah Alamat"),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
