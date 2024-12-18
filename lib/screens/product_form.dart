import 'dart:convert';

import 'package:abibas_shoes/screens/menu.dart';
import 'package:flutter/material.dart';
// Impor drawer widget
import 'package:abibas_shoes/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
	int _price = 0;
	String _description = "";
  String _type = "";
  String _materials = "";
  bool _isFormSubmitted = false; // Flag to track form submission

  // Define available choices for type and materials
  final List<String> _types = ['Sneakers', 'Running Shoes', 'Slip On', 'Loafers', 'Boots'];
  final List<String> _materialsList = ['Leather', 'Knit', 'Canvas', 'Suede', 'Rubber', 'Foam'];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Item Kamu Hari ini',
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(), //adding drawer

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Name",
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _name = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Nama tidak boleh kosong!";
                  }
                  if (!RegExp(r'^[a-zA-Z0-9\s]+$').hasMatch(value)) {
                    return "Hanya huruf dan angka yang diperbolehkan";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Price",
                  labelText: "Price",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _price = int.tryParse(value!) ?? 0;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Price tidak boleh kosong!";
                  }
                  final parsedValue = int.tryParse(value);
                  if (parsedValue == null) {
                    return "Price harus berupa angka!";
                  }
                  if (parsedValue <= 0) {
                    return "Price harus lebih besar dari 0!";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: "Description",
                  labelText: "Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    _description = value!;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Description tidak boleh kosong!";
                  }
                  return null;
                },
              ),
            ),
            // Type (Radio Buttons)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Type', style: Theme.of(context).textTheme.displayMedium),
                  Column(
                    children: _types.map((type) {
                      return RadioListTile<String>(
                        title: Text(type),
                        value: type,
                        groupValue: _type,
                        onChanged: (String? value) {
                          setState(() {
                            _type = value!;
                          });
                        },
                      );
                    }).toList(),
                    // Validator for checking if any radio button is selected
                  ),
                  // Display error message if no type is selected
                  if (_isFormSubmitted && _type.isEmpty)
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Please select a type",
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                ],
              ),
            ),

            // Materials (Radio Buttons)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Materials', style: Theme.of(context).textTheme.displayMedium),
                  Column(
                    children: _materialsList.map((material) {
                      return RadioListTile<String>(
                        title: Text(material),
                        value: material,
                        groupValue: _materials,
                        onChanged: (String? value) {
                          setState(() {
                            _materials = value!;
                          });
                        },
                      );
                    }).toList(),
                  ),
                  if(_isFormSubmitted && _materials.isEmpty)
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Text(
                        "Please select a type",
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                  ),
                  onPressed: () async {
                    setState(() {
                      _isFormSubmitted = true; // Mark form as submitted
                    });

                    if (_formKey.currentState!.validate()  && _type.isNotEmpty && _materials.isNotEmpty) {
                      final response = await request.postJson(
                        "http://localhost:8000/create-flutter/",
                        jsonEncode(<String, String>{
                            'name': _name,
                            'price': _price.toString(),
                            'description': _description,
                            'type': _type,
                            'materials': _materials,
                        
                        }),
                      );
                      if (context.mounted) {
                        if (response['status'] == 'success') {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                            content: Text("Produk baru berhasil disimpan!"),
                            ));
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => MyHomePage()),
                            );
                        } else {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                content:
                                    Text("Terdapat kesalahan, silakan coba lagi."),
                            ));
                        }
                    }
                }
                     
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  
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