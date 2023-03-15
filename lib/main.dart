import 'package:demoshopapp/register.dart';
import 'package:flutter/material.dart';
import 'validations/validation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
                      validator: Validators.compose([
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
                            'Login',
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Registerpage()),
                            );
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
