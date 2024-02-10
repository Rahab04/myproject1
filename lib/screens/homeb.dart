import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:mycashbook/screens/functions.dart';

class NewWidget extends StatefulWidget {
  const NewWidget({
    super.key,
  });

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController quota = TextEditingController();
  TextEditingController merry = TextEditingController();
  TextEditingController welfare = TextEditingController();
  TextEditingController hospitality = TextEditingController();
  TextEditingController holly = TextEditingController();
  TextEditingController misc = TextEditingController();
  TextEditingController kayo = TextEditingController();
  TextEditingController children = TextEditingController();
  TextEditingController donations = TextEditingController();
  TextEditingController dma = TextEditingController();
  TextEditingController kama = TextEditingController();
  TextEditingController mothers = TextEditingController();
  TextEditingController praise = TextEditingController();
  TextEditingController churchDev = TextEditingController();
  TextEditingController stationary = TextEditingController();

  String _quota = '';
  String _merry = '';
  String _welfare = '';
  String _hospitality = '';
  String _holly = '';
  String _misc = '';
  String _kayo = '';
  String _children = '';
  String _donations = '';
  String _dma = '';
  String _kama = '';
  String _mothers = '';
  String _praise = '';
  String _churchDev = '';
  String _stationary = '';

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        key: _formKey,
        child: ExpansionTile(
          title: Text('CASH OUT',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
          subtitle: Text('Tap to open Entries',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          children: [
            Card(
              elevation: 24,
              surfaceTintColor: Colors.white,
              child: ListTile(
                contentPadding: EdgeInsets.all(5),
                title: Text(
                  'QUOTA:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: SizedBox(
                  width: 180,
                  height: 40,
                  child: TextFormField(
                    controller: quota,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field is empty';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _quota = newValue!;
                    },
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          setAmount(context, quota.text.trim(), 'quota');
                          quota.clear();
                        },
                        child: Card(
                          elevation: 16,  color: Colors.black,
                          child: Icon(Icons.file_upload_outlined, color: Colors.white,)),),
                      
                      prefixText: 'Ksh: ',
                      labelText: 'Amount',
                      labelStyle: TextStyle(
                        fontSize: 18,
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
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
                title: Text('MERRY-GO-ROUND',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                trailing: SizedBox(
                  width: 180,
                  height: 40,
                  child: TextFormField(
                    controller: merry,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field is empty';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _merry = newValue!;
                    },
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          setAmount(context, merry.text.trim(), 'merry');
                          merry.clear();
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
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
                title: Text('WELFARE',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                trailing: SizedBox(
                  width: 180,
                  height: 40,
                  child: TextFormField(
                    controller: welfare,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field is empty';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _welfare = newValue!;
                    },
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          setAmount(context, welfare.text.trim(), 'welfare');
                          welfare.clear();
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
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
                title: Text('HOSPITALITY:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                trailing: SizedBox(
                  width: 180,
                  height: 40,
                  child: TextFormField(
                    controller: hospitality,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field is empty';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _hospitality = newValue!;
                    },
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          setAmount(context, hospitality.text.trim(), 'hospitality');
                          hospitality.clear();
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
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
                title: Text('HOLY COMMUNION:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                trailing: SizedBox(
                  width: 180,
                  height: 40,
                  child: TextFormField(
                    controller: holly,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field is empty';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _holly = newValue!;
                    },
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          setAmount(context, holly.text.trim(), 'holly');
                          holly.clear();
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
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
                title: Text('DONATIONS:',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                          setAmount(context, donations.text.trim(), 'donations');
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
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
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
                          setAmount(context, kayo.text.trim(), 'kayo');
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                          setAmount(context, children.text.trim(), 'children');
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                          setAmount(context, mothers.text.trim(), 'mothers');
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                          setAmount(context, kama.text.trim(), 'kama');
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
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
                  'STATIONARY:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: SizedBox(
                  width: 180,
                  height: 40,
                  child: TextFormField(
                    controller: stationary,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field is empty';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _stationary = newValue!;
                    },
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () async {
                        setAmount(context, stationary.text.trim(), 'stationary');
                         stationary.clear();  
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
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
                  'MISCELANIOUS:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: SizedBox(
                  width: 180,
                  height: 40,
                  child: TextFormField(
                    controller: misc,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field is empty';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _misc = newValue!;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          setAmount(context, misc.text.trim(), 'misc');
                          misc.clear();
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
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
                  'D.M.A:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: SizedBox(
                  width: 180,
                  height: 40,
                  child: TextFormField(
                    controller: dma,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field is empty';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _dma = newValue!;
                    },
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          setAmount(context, dma.text.trim(), 'dma');
                          dma.clear();
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
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
                  'PRAISE AND WORSHIP:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: SizedBox(
                  width: 180,
                  height: 40,
                  child: TextFormField(
                    controller: praise,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field is empty';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _praise = newValue!;
                    },
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          setAmount(context, praise.text.trim(), 'praise');
                          praise.clear();
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
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
                  'CHURCH DEV.:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                trailing: SizedBox(
                  width: 180,
                  height: 40,
                  child: TextFormField(
                    controller: churchDev,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'The field is empty';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      _churchDev = newValue!;
                    },
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          setAmount(context, churchDev.text.trim(), 'churchDev');
                          churchDev.clear();
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
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0),
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
    );
  }
}
