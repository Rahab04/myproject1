import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mycashbook/screens/cashIn.dart';
import 'package:mycashbook/screens/functions.dart';

import 'cashOut.dart';
import 'homeb.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  String _offertory = '';
  String _tithe = '';
  String _thanks = '';
  String _harvest = '';
  String _handshake = '';
  String _churching = '';
  String _kayo = '';
  String _children = '';
  String _donations = '';
  String _harambee = '';
  String _kama = '';
  String _mothers = '';
  String _education = '';
  String _others = '';
  String _openning = '';

  TextEditingController offertory = TextEditingController();
  TextEditingController tithe = TextEditingController();
  TextEditingController thanks = TextEditingController();
  TextEditingController harvest = TextEditingController();
  TextEditingController handshake = TextEditingController();
  TextEditingController churching = TextEditingController();
  TextEditingController kayo = TextEditingController();
  TextEditingController children = TextEditingController();
  TextEditingController donations = TextEditingController();
  TextEditingController harambee = TextEditingController();
  TextEditingController kama = TextEditingController();
  TextEditingController mothers = TextEditingController();
  TextEditingController education = TextEditingController();
  TextEditingController others = TextEditingController();
  TextEditingController openning = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome '),
        actions: [
          Card(
            child: TextButton.icon(
                style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(24),
                  backgroundColor: MaterialStatePropertyAll(Colors.black),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CashIn()));
                },
                icon: Icon(Icons.monetization_on_sharp),
                label: Text('Cash In',style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          Card(
            child: TextButton.icon(
              style: ButtonStyle(
                elevation: MaterialStatePropertyAll(24),
                backgroundColor: MaterialStatePropertyAll(Colors.black),
                foregroundColor: MaterialStatePropertyAll(Colors.white),
              ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CashOut()));
                },
                icon: Icon(Icons.monetization_on_sharp),
                label: Text('Cash Out',style: TextStyle(fontWeight: FontWeight.bold))),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Form(
                key: _formKey,
                child: ExpansionTile(
                  title: Text('CASH IN',
                      style:
                          TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
                  subtitle: Text('Tap to open Entries',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  children: [
                    Card(
                      elevation: 24,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Text(
                          'OPENNING BALANCE:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: SizedBox(
                          width: 180,
                          height: 40,
                          child: TextFormField(
                            controller: openning,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _openning = value!;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    setCashIn(context, openning.text, 'openning');
                                  openning.clear();
                                  },
                                  child: Card(
                                    elevation: 16,  color: Colors.black,
                                    child: Icon(Icons.file_upload_outlined, color: Colors.white,)),
                                  ),
                              prefixText: 'Ksh: ',
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 24,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Text(
                          'OFFERTORY:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: SizedBox(
                          width: 180,
                          height: 40,
                          child: TextFormField(
                            controller: offertory,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _offertory = newValue!;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    setCashIn(context, offertory.text, 'offertory');
                                  offertory.clear();
                                  },
                                  child: Card(
                                    elevation: 16,  color: Colors.black,
                                    child: Icon(Icons.file_upload_outlined, color: Colors.white,)),
                                  ),
                              prefixText: 'Ksh: ',
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 24,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Text('TITHE',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        trailing: SizedBox(
                          width: 180,
                          height: 40,
                          child: TextFormField(
                            controller: tithe,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _tithe = newValue!;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    setCashIn(context, tithe.text, 'tithe');
                                  tithe.clear();
                                  },
                                  child: Card(
                                    elevation: 16,  color: Colors.black,
                                    child: Icon(Icons.file_upload_outlined, color: Colors.white,)),
                                  ),
                              prefixText: 'Ksh: ',
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 24,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Text('THANKS GIVING',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        trailing: SizedBox(
                          width: 180,
                          height: 40,
                          child: TextFormField(
                            controller: thanks,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _thanks = newValue!;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    setCashIn(context, thanks.text, 'thanks');
                                  thanks.clear();
                                  },
                                  child: Card(
                                    elevation: 16,  color: Colors.black,
                                    child: Icon(Icons.file_upload_outlined, color: Colors.white,)),
                                  ),
                              prefixText: 'Ksh: ',
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 24,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Text('HARVEST:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        trailing: SizedBox(
                          width: 180,
                          height: 40,
                          child: TextFormField(
                            controller: harvest,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _harvest = newValue!;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    setCashIn(context, harvest.text, 'harvest');
                                  harvest.clear();
                                  },
                                  child: Card(
                                    elevation: 16,  color: Colors.black,
                                    child: Icon(Icons.file_upload_outlined, color: Colors.white,)),
                                  ),
                              prefixText: 'Ksh: ',
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 24,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Text('HANDSHAKE:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        trailing: SizedBox(
                          width: 180,
                          height: 40,
                          child: TextFormField(
                            controller: handshake,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _handshake = newValue!;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    setCashIn(context, handshake.text, 'handshake');
                                  handshake.clear();
                                  },
                                  child: Card(
                                    elevation: 16,  color: Colors.black,
                                    child: Icon(Icons.file_upload_outlined, color: Colors.white,)),
                                  ),
                              prefixText: 'Ksh: ',
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 24,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Text('CHURCHING',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        trailing: SizedBox(
                          width: 180,
                          height: 40,
                          child: TextFormField(
                            controller: churching,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _churching = newValue!;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    setCashIn(context, churching.text, 'churching');
                                  churching.clear();
                                  },
                                  child: Card(
                                    elevation: 16,  color: Colors.black,
                                    child: Icon(Icons.file_upload_outlined, color: Colors.white,)),
                                  ),
                              prefixText: 'Ksh: ',
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 24,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Text('KAYO:',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        trailing: SizedBox(
                          width: 180,
                          height: 40,
                          child: TextFormField(
                            controller: kayo,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _kayo = newValue!;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    setCashIn(context, kayo.text, 'kayo');
                                  kayo.clear();
                                  },
                                  child: Card(
                                    elevation: 16,  color: Colors.black,
                                    child: Icon(Icons.file_upload_outlined, color: Colors.white,)),
                                  ),
                              prefixText: 'Ksh: ',
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 24,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Text(
                          'CHILDREN MINISTRY:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: SizedBox(
                          width: 180,
                          height: 40,
                          child: TextFormField(
                            controller: children,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _children = newValue!;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    setCashIn(context, children.text, 'children');
                                  children.clear();
                                  },
                                  child: Card(
                                    elevation: 16,  color: Colors.black,
                                    child: Icon(Icons.file_upload_outlined, color: Colors.white,)),
                                  ),
                              prefixText: 'Ksh: ',
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 24,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Text(
                          'MOTHERS UNION:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: SizedBox(
                          width: 180,
                          height: 40,
                          child: TextFormField(
                            controller: mothers,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _mothers = newValue!;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    setCashIn(context, mothers.text, 'mothers');
                                  mothers.clear();
                                  },
                                  child: Card(
                                    elevation: 16,  color: Colors.black,
                                    child: Icon(Icons.file_upload_outlined, color: Colors.white,)),
                                  ),
                              prefixText: 'Ksh: ',
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 24,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Text(
                          'KAMA:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: SizedBox(
                          width: 180,
                          height: 40,
                          child: TextFormField(
                            controller: kama,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _kama = newValue!;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    setCashIn(context, kama.text, 'kama');
                                  kama.clear();
                                  },
                                  child: Card(
                                    elevation: 16,  color: Colors.black,
                                    child: Icon(Icons.file_upload_outlined, color: Colors.white,)),
                                  ),
                              prefixText: 'Ksh: ',
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 24,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Text(
                          'DONATIONS:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: SizedBox(
                          width: 180,
                          height: 40,
                          child: TextFormField(
                            controller: donations,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _donations = newValue!;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    setCashIn(context, donations.text, 'donations');
                                  donations.clear();
                                  },
                                  child: Card(
                                    elevation: 16,  color: Colors.black,
                                    child: Icon(Icons.file_upload_outlined, color: Colors.white,)),
                                  ),
                              prefixText: 'Ksh: ',
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 24,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Text(
                          'HARAMBEE:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: SizedBox(
                          width: 180,
                          height: 40,
                          child: TextFormField(
                            controller: harambee,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _harambee = newValue!;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    setCashIn(context, harambee.text, 'harambee');
                                    harambee.clear();
                                  },
                                  child: Card(
                                    elevation: 16,  color: Colors.black,
                                    child: Icon(Icons.file_upload_outlined, color: Colors.white,)),
                                  ),
                              prefixText: 'Ksh: ',
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 24,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Text(
                          'EDUCATION:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: SizedBox(
                          width: 180,
                          height: 40,
                          child: TextFormField(
                            controller: education,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _education = newValue!;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    setCashIn(context, education.text, 'education');
                                  education.clear();
                                  },
                                  child: Card(
                                    elevation: 16,  color: Colors.black,
                                    child: Icon(Icons.file_upload_outlined, color: Colors.white,)),
                                  ),
                              prefixText: 'Ksh: ',
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 24,
                      surfaceTintColor: Colors.white,
                      child: ListTile(
                        contentPadding: EdgeInsets.all(5),
                        title: Text(
                          'OTHERS:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: SizedBox(
                          width: 180,
                          height: 40,
                          child: TextFormField(
                            controller: others,
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'The field is empty';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _others = newValue!;
                            },
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                  onTap: () async {
                                    setCashIn(context, others.text, 'others');
                                  others.clear();
                                  },
                                  child: Card(
                                    elevation: 16,  color: Colors.black,
                                    child: Icon(Icons.file_upload_outlined, color: Colors.white,)),
                                  ),
                              prefixText: 'Ksh: ',
                              labelText: 'Amount',
                              labelStyle: TextStyle(
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2.0, horizontal: 8.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            NewWidget()
          ],
        ),
      ),
    );
  }
}
