import 'package:flutter/material.dart';
import 'validations/validation.dart';

class Registerpage extends StatefulWidget {
  const Registerpage({super.key});

  @override
  State<Registerpage> createState() => _Registerpage();
}

class _Registerpage extends State<Registerpage> with Validators {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password1 = TextEditingController();
  final _password2 = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password1.dispose();
    _password2.dispose();
    super.dispose();
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          //color: Colors.red
          image: DecorationImage(
            image: AssetImage("assets/images/login_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 80),
              Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 0, 30.0, 0),
                      child: Container(
                        width: double.infinity,
                        //color: Colors.orange,
                        child: const Text(
                          "Logo",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 50), // has impact
                        ),
                      )),
                ],
              ),
              const SizedBox(height: 70),
              Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 10.0),
                      child: Container(
                        width: double.infinity,
                        //color: Colors.orange,
                        child: const Text(
                          "Email",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
                    child: TextFormField(
                      controller: _email,
                      validator: Validators.compose([
                        Validators.required('Email must not empty'),
                        Validators.email('Please enter a valid email'),
                      ]),
                      // validator: (value) {
                      //   Validators.email('Please enter a valid email');
                      //   if (value == null || value.isEmpty) {
                      //     return 'Please enter Email';
                      //   }
                      //   return null;
                      // },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // labelText: 'Email',
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 10.0),
                      child: Container(
                        width: double.infinity,
                        //color: Colors.orange,
                        child: const Text(
                          "Password",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
                    child: TextFormField(
                      controller: _password1,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // labelText: 'Password',
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 8.0, 30.0, 10.0),
                      child: Container(
                        width: double.infinity,
                        //color: Colors.orange,
                        child: const Text(
                          "Recheck-Password",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 18),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 8.0),
                    child: TextFormField(
                      obscureText: true,
                      controller: _password2,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter password';
                        }
                        if (_password1.text != _password2.text) {
                          return 'Please check your password ${_password1.text}:${_password2.text}';
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // labelText: 'Recheck-Password',
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  const SizedBox(height: 100),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(100.0, 0, 8.0, 8.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return Colors.blue.withOpacity(0.04);
                                }
                                if (states.contains(MaterialState.focused) ||
                                    states.contains(MaterialState.pressed)) {
                                  return Colors.blue.withOpacity(0.12);
                                }
                                return null; // Defer to the widget's default.
                              },
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Back',
                            style: TextStyle(color: Colors.white),
                          ))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 100.0, 8.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color?>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.hovered))
                                  return Colors.blue.withOpacity(0.04);
                                if (states.contains(MaterialState.focused) ||
                                    states.contains(MaterialState.pressed))
                                  return Colors.blue.withOpacity(0.12);
                                return null; // Defer to the widget's default.
                              },
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              //หากผ่าน
                              // แสดงข้อความจำลอง ใน snackbar
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('your email is : ${_email.text}')),
                              );
                            }
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.white),
                          )))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
