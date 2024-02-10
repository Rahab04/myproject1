import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

Future<void> setCashIn(BuildContext context, String amount, String voteHead) async {
  showDialog(context: context,  builder: (BuildContext ctx) => 
  Center(child: CircularProgressIndicator.adaptive()));
  try {
  var url = Uri.parse('https://yoururl.xyz/church/api.php?post=${voteHead}');
  if (amount.trim().isEmpty) {
      Navigator.pop(context);
      showDialog(
        context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            content: Text('Sorry! You cannot submit an empty field! Make sure the field is not empty before you submit',
                style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
            actions: [
              TextButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)))
            ],
          );
        },
      );
    } else {
      showDialog(context: context, builder: (BuildContext){
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceBetween,
          title: OutlinedButton.icon(
            style: ButtonStyle(),
            onPressed: null,
            icon: Icon(
              Icons.notification_important_outlined, color: Colors.black, size: 30,
            ),
            label: Text('Alert!', style: TextStyle(color: Colors.black, fontSize: 25,
              ),
            ),
          ),
          content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You are about to update payment of Ksh ${amount} for entry ${voteHead}. ',
              style: TextStyle(fontSize: 20),
            ),
            Text('Please confirm the details before submitting', style: TextStyle(fontSize: 20)),
            Text('Note that this process is not be reversible or editable.', style: TextStyle(fontSize: 20)),
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.edit, color: Colors.pink),
                SizedBox(
                  width: 10.0,
                ),
                Text( 'Edit', style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
          OutlinedButton(
          onPressed: () async {
            var response = await http.post(url, body: {
            '${voteHead}': amount.trim(),
            'time': DateFormat.yMMMd().format(DateTime.now())
          });
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        if (body['success']) {
          var snackBar = SnackBar(
            backgroundColor: Colors.green,
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check, color: Colors.white,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(body['message'], style: TextStyle(fontSize: 18, color: Colors.white,
                    )),
              ],
            ),
            duration: Duration(seconds: 2),
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            // action: SnackBarAction(label: 'OK', onPressed: () {}),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pop(context);
          Navigator.pop(context);
          amount = '';
        } else {
          var snackBar = SnackBar(
            backgroundColor: Colors.pink,
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.cancel_outlined,
                    size: 25, color: Colors.white),
                SizedBox(
                  width: 10.0,
                ),
                Text(body['message'],
                    style: TextStyle(fontSize: 18)),
              ],
            ),
            //Text(data['message'], style: TextStyle(color: Colors.green)),
            duration: Duration(seconds: 4),
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            // action: SnackBarAction(label: 'OK', onPressed: () {}),
          );
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBar);
        }
      }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check, color: Colors.pink),
              SizedBox(
                width: 10.0,
              ),
              Text('Confirm', style: TextStyle(color: Colors.blue)),
            ],
          ),
        ),
        ],
        );
      });
    }
} on Exception catch (e) {
   print(e);
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
                    await setAmount( context,  amount,  voteHead);
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

Future<void> setAmount(BuildContext context, String amount, String voteHead) async {
  showDialog(context: context,  builder: (BuildContext ctx) => 
  Center(child: CircularProgressIndicator.adaptive()));
  try {
  var url = Uri.parse('https://yoururl.xyz/church/api2.php?post=${voteHead}');
  if (amount.trim().isEmpty) {
      Navigator.pop(context);
      showDialog(
        context: context, builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Alert!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            content: Text('Sorry! You cannot submit an empty field! Make sure the field is not empty before you submit',
                style: TextStyle( fontSize: 18, fontWeight: FontWeight.bold)),
            actions: [
              TextButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)))
            ],
          );
        },
      );
    } else {
      showDialog(context: context, builder: (BuildContext){
        return AlertDialog(
          actionsAlignment: MainAxisAlignment.spaceBetween,
          title: OutlinedButton.icon(
            style: ButtonStyle(),
            onPressed: null,
            icon: Icon(
              Icons.notification_important_outlined, color: Colors.black, size: 30,
            ),
            label: Text('Alert!', style: TextStyle(color: Colors.black, fontSize: 25,
              ),
            ),
          ),
          content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'You are about to update payment of Ksh ${amount} for entry ${voteHead}. ',
              style: TextStyle(fontSize: 20),
            ),
            Text('Please confirm the details before submitting', style: TextStyle(fontSize: 20)),
            Text('Note that this process is not be reversible or editable.', style: TextStyle(fontSize: 20)),
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.edit, color: Colors.pink),
                SizedBox(
                  width: 10.0,
                ),
                Text( 'Edit', style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
          OutlinedButton(
          onPressed: () async {
            var response = await http.post(url, body: {
            'voteHead': amount.trim(),
            'time': DateFormat.yMMMd().format(DateTime.now())
          });
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        if (body['success']) {
          var snackBar = SnackBar(
            backgroundColor: Colors.green,
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check, color: Colors.white,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(body['message'], style: TextStyle(fontSize: 18, color: Colors.white,
                    )),
              ],
            ),
            duration: Duration(seconds: 2),
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            // action: SnackBarAction(label: 'OK', onPressed: () {}),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          Navigator.pop(context);
          Navigator.pop(context);
          amount = '';
        } else {
          var snackBar = SnackBar(
            backgroundColor: Colors.pink,
            content: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.cancel_outlined,
                    size: 25, color: Colors.white),
                SizedBox(
                  width: 10.0,
                ),
                Text(body['message'],
                    style: TextStyle(fontSize: 18)),
              ],
            ),
            //Text(data['message'], style: TextStyle(color: Colors.green)),
            duration: Duration(seconds: 4),
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            // action: SnackBarAction(label: 'OK', onPressed: () {}),
          );
          ScaffoldMessenger.of(context)
              .showSnackBar(snackBar);
        }
      }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check, color: Colors.pink),
              SizedBox(
                width: 10.0,
              ),
              Text('Confirm', style: TextStyle(color: Colors.blue)),
            ],
          ),
        ),
        ],
        );
      });
    }
} on Exception catch (e) {
   print(e);
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
                    await setAmount( context,  amount,  voteHead);
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