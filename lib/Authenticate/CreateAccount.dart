import 'package:chat_app/Authenticate/Methods.dart';
import 'package:chat_app/Screens/dashboard_screen.dart';
import 'package:flutter/material.dart';

import '../Screens/HomeScreen.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final List<String> genderItems = [
    'Community',
    'Panchayat/NGOs',
    'District',
    'State'
  ];

  String selectedValue = 'Community';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 10,
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Container(
                    width: size.width / 1.1,
                    child: Text(
                      "Welcome",
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 1.1,
                    child: Text(
                      "Create Account to Continue!",
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: field(size, "Name", Icons.account_box, _name),
                    ),
                  ),
                  Container(
                    width: size.width,
                    alignment: Alignment.center,
                    child: field(size, "email", Icons.account_box, _email),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 18.0),
                    child: Container(
                      width: size.width,
                      alignment: Alignment.center,
                      child: field(size, "password", Icons.lock, _password),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: DropdownButtonFormField(
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          //<-- SEE HERE
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 246, 243, 243),
                              width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                          //<-- SEE HERE
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 118, 118, 118),
                              width: 2),
                        ),
                        //filled: true,
                      ),
                      isExpanded: true,
                      hint: const Text(
                        'Select Your Identity',
                        style: TextStyle(fontSize: 14),
                      ),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.black45,
                      ),
                      iconSize: 30,
                      //buttonHeight: 60,
                      //buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                      //dropdownDecoration: BoxDecoration(
                      //borderRadius: BorderRadius.circular(15),
                      //),

                      items: genderItems
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        if (value == null) {
                          return 'Please select Identity.';
                        }
                      },
                      onChanged: (String? Value) {
                        setState(() {
                          selectedValue = Value!;
                        });
                      },
                      onSaved: (value) {
                        selectedValue = value.toString();
                      },
                    ),
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  customButton(size),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (_name.text.isNotEmpty &&
            _email.text.isNotEmpty &&
            _password.text.isNotEmpty &&
            selectedValue.isNotEmpty) {
          setState(() {
            isLoading = true;
          });

          createAccount(_name.text, _email.text, _password.text, selectedValue)
              .then((user) {
            if (user != null) {
              setState(() {
                isLoading = false;
              });
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => DashboardScreen()));
              print("Account Created Sucessfull");
            } else {
              print("Login Failed");
              setState(() {
                isLoading = false;
              });
            }
          });
        } else {
          print("Please enter Fields");
        }
      },
      child: Container(
          height: size.height / 14,
          width: size.width / 1.2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.blue,
          ),
          alignment: Alignment.center,
          child: Text(
            "Create Account",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )),
    );
  }

  Widget field(
      Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.1,
      child: TextField(
        controller: cont,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
