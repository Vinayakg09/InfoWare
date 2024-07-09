import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:infoware_assign/view/home.dart';

class SurveyForm extends StatefulWidget {
  const SurveyForm({super.key});

  @override
  _SurveyFormState createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _gender = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _city = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                        hintText: "Enter Name",
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Name";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                        hintText: "Enter email",
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return "Please Enter Valid Email";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: _phone,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: "Enter Phone No. without country code",
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^\d{10}$').hasMatch(value)) {
                        return "Please Enter Valid Number";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: _gender,
                    decoration: InputDecoration(
                        hintText: "Enter Your Gender",
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Valid Gender";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: _country,
                    decoration: InputDecoration(
                        hintText: "Enter Your Country",
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your Country";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: _state,
                    decoration: InputDecoration(
                        hintText: "Enter Your State",
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your State";
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: TextFormField(
                    controller: _city,
                    decoration: InputDecoration(
                        hintText: "Enter Your City",
                        filled: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Your City";
                      }
                      return null;
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) => Home()), (route) => false);
                    } else {
                      print("Please fill in all the fields");
                    }
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
