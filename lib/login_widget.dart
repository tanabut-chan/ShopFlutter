import 'package:demoshopapp/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'validations/validation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:demoshopapp/main.dart';

class LoginWidget extends StatefulWidget {
  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          //color: Colors.red
          image: DecorationImage(
            image: AssetImage("assets/images/login_bg.jpg"),
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
              const SizedBox(height: 100),
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
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        //labelText: 'Email',
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
                      controller: _password,
                      validator: Validators.compose([
                        Validators.min(
                            6, 'Password must be at least 6 characters'),
                        Validators.required('Password must not empty'),
                      ]),
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        // labelText: 'Password',
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  const SizedBox(height: 100),
                  Spacer(),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0, 8.0, 8.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.grey))),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey.shade200.withOpacity(0.5)),
                          ),
                          onPressed: () {
                            signIn();
                            // if (_formKey.currentState!.validate()) {
                            //   ScaffoldMessenger.of(context).showSnackBar(
                            //     SnackBar(
                            //         content:
                            //             Text('your email is : ${_email.text}')),
                            //   );
                            // }
                          },
                          child: const Text(
                            'Login',
                            style: TextStyle(color: Colors.black),
                          ))),
                  Padding(
                      padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 8.0),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.grey))),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.grey.shade200.withOpacity(0.5)),
                            // foregroundColor:
                            //     MaterialStateProperty.all<Color>(Colors.blue),
                            // overlayColor:
                            //     MaterialStateProperty.resolveWith<Color?>(
                            //   (Set<MaterialState> states) {
                            //     if (states.contains(MaterialState.hovered))
                            //       return Colors.blue.withOpacity(0.04);
                            //     if (states.contains(MaterialState.focused) ||
                            //         states.contains(MaterialState.pressed))
                            //       return Colors.blue.withOpacity(0.12);
                            //     return null; // Defer to the widget's default.
                            //   },
                            // ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Registerpage()),
                            );
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(color: Colors.black),
                          ))),
                  Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _email.text.trim(),
        password: _password.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
