import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'homePage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController passWord = TextEditingController();
  String user_name = '';
  String pass_word = '';

  bool isVisible = false;

  Future login() async {
    showDialog(
        context: context,
        builder: (BuildContext ctx) =>
            Center(child: CircularProgressIndicator.adaptive()));
    try {
      var url = Uri.parse('https://yoururl.xyz/home/login.php');
      var response = await http.post(url, body: {
        'username': userName.text.trim(),
        'password': passWord.text.trim()
      }).timeout(Duration(seconds: 5));
      var data = json.decode(response.body);
      if (data == 'success') {
        Navigator.pop(context);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
        userName.clear();
        passWord.clear();
      } else if (data == 'error') {
        Navigator.pop(context);
        setState(() {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  'Login Error!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                content: Text(
                    'Invalid Username or password. Please check and try again!',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                actions: [
                  TextButton(
                      onPressed: () { Navigator.pop(context);
                      },
                      child: Text('OK', style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold, color: Colors.blue))),
                ],
              );
            },
          );
        });
      } 
    } 
    
    on http.ClientException catch(e){
      print('network timeout');
      Navigator.pop(context);
      showDialog(
        context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert! {connection problem}', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            content: Text('Sorry! There was an error submitting your request. please try again later. make sure you are connected to stable internet connection',
                style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white))),
                TextButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  onPressed: () async {
                    Navigator.pop(context);
                    //await login();
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => HomePage()));
                    userName.clear();
                    passWord.clear();

                  },
                  child: Text('RETRY', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)))
                  ],
              ),
                  
            ],
          );
        },
      );
    }on Exception catch (e) {
      debugPrint(e.toString());
      showDialog(
        context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text(e.toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            content: Text('Sorry! There was an error submitting your request. please try using a valid url pointing to the correct api',
                style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('OK', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white))),
                TextButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  onPressed: () async {
                    Navigator.pop(context);
                    //await login();
                    Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (context) => HomePage()));
                    userName.clear();
                    passWord.clear();

                  },
                  child: Text('RETRY', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)))
                  ],
              ),
                  
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
    isVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width * 0.65;
    return Scaffold(
      
      appBar: AppBar(
        toolbarHeight: 20,
      ),
      body: Center(
        child: Card(
          elevation: 24,
          surfaceTintColor: Colors.white,
          borderOnForeground: false,
          shadowColor: Colors.blue[900],
          child: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Welcome',
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
                    width: width,
                    child: Image.asset('assets/images/acklogo.jpg'),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Enter Login Details',
                        style:
                            TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width,
                    child: TextFormField(
                      controller: userName,
                      validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field must not be blank.';
                      } 
                      return null;
                    },
                    onSaved: (newValue) {
                      user_name = newValue!;
                    },
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                          labelText: 'Username',
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                          contentPadding: EdgeInsets.all(2.0),
                          prefixIcon: Icon(Icons.person_outline_outlined),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: width,
                    child: TextFormField(
                      controller: passWord,
                      obscureText: isVisible,
                      maxLength: 8,
                      validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field must not be blank.';
                      } else if (value.length < 8) {
                        return 'Passwords must be atleast 8 characters long.';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      pass_word = newValue!;
                    },
                      style: TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(2.0),
                          labelText: 'password',
                          
                          labelStyle: TextStyle(
                            fontSize: 20,
                          ),
                          prefixIcon: Icon(Icons.security_outlined),
                          suffix: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: Icon(isVisible
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    width: width,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlinedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              login();
                            }
                          },
                          icon: Icon(Icons.send_outlined),
                          label: Text('Login'),
                          style: ButtonStyle(
                              iconSize: MaterialStatePropertyAll(35),
                              textStyle: MaterialStatePropertyAll(
                                  TextStyle(fontSize: 20)),
                              elevation: MaterialStatePropertyAll(12)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
