import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:intl/intl.dart';

class CashOut extends StatefulWidget {
  const CashOut({Key? key}) : super(key: key);

  @override
  _CashOutState createState() => _CashOutState();
}

class _CashOutState extends State<CashOut> {
  List? _cashins;

  @override
  void initState() {
    super.initState();
    getCashin();
  }

  Future getCashin() async {
    var url =
        Uri.parse('https://yoururl.xyz/church/getCash.php?post=cashout');
    try {
      var response = await http.post(
        url,
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        _cashins = jsonResponse;
        //print(_cashins);
        setState(() {
          getCashin();
        });
      }
    } catch (e) {
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

  List<String> headers = [
    'Quota',
    'Merry-Go-Round',
    'Welfare',
    'Hospitality',
    'Holy Communion',
    'Donations',
    'KAYO',
    'Children Ministry',
    'Mothers Union',
    'KAMA',
    'Stationary',
    'Miscelanious',
    'D.M.A',
    'Mission/Praise & Worship',
    'Church Development',
    'Totals'
  ];
  @override
  Widget build(BuildContext context) {
    int sum1 = 0;
    final List<TableRow> rows1 = [];
    final List<TableRow> rows2 = [];
    final List<TableRow> rows3 = [];
    final List<TableRow> rows4 = [];
    final List<TableRow> rows5 = [];
    final List<TableRow> rows6 = [];
    final List<TableRow> rows7 = [];
    final List<TableRow> rows8 = [];
    final List<TableRow> rows9 = [];
    final List<TableRow> rows10 = [];
    final List<TableRow> rows11 = [];
    final List<TableRow> rows12 = [];
    final List<TableRow> rows13 = [];
    final List<TableRow> rows14 = [];
    final List<TableRow> rows15 = [];

    int sum2 = 0;
    int sum3 = 0;
    int sum4 = 0;
    int sum5 = 0;
    int sum6 = 0;
    int sum7 = 0;
    int sum8 = 0;
    int sum9 = 0;
    int sum10 = 0;
    int sum11 = 0;
    int sum12 = 0;
    int sum13 = 0;
    int sum14 = 0;
    int sum15 = 0;

    if (_cashins != null) {
      for (var data in _cashins!) {
        var cashIn1 = "${data['quota']}";
        var cashIn2 = "${data['merry']}";
        var cashIn3 = "${data['welfare']}";
        var cashIn4 = "${data['hospitality']}";
        var cashIn5 = "${data['holly_comm']}";
        var cashIn6 = "${data['donations']}";
        var cashIn7 = "${data['kayo']}";
        var cashIn8 = "${data['children']}";
        var cashIn9 = "${data['mothers']}";
        var cashIn10 = "${data['kama']}";
        var cashIn11 = "${data['stationary']}";
        var cashIn12 = "${data['misc']}";
        var cashIn13 = "${data['dma']}";
        var cashIn14 = "${data['praise']}";
        var cashIn15 = "${data['church_dev']}";
        //print(cashIn);
        final Map<String, dynamic> newData1 = jsonDecode(cashIn1);
        newData1.forEach((key, value) {
          if (key != 'amount' && key != 'time') {
            final String amount = value['amount'] ?? '';
            final String time = value['time'] ?? '';
            final int amountString =
                int.tryParse(amount.replaceAll(' ', '')) ?? 0;
            sum1 += amountString;
            rows1.add(TableRow(children: [
              // DataCell(Text('Offertory')),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Ksh ${amount}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('${time}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ))
            ]));
          }
        });
        final Map<String, dynamic> newData2 = jsonDecode(cashIn2);
        newData2.forEach((key, value) {
          if (key != 'amount' && key != 'time') {
            final String amount = value['amount'] ?? '';
            final String time = value['time'] ?? '';
            final int amountString =
                int.tryParse(amount.replaceAll(' ', '')) ?? 0;
            sum2 += amountString;
            rows2.add(TableRow(children: [
              // DataCell(Text('Offertory')),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Ksh ${amount}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('${time}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ))
            ]));
          }
        });
        final Map<String, dynamic> newData3 = jsonDecode(cashIn3);
        newData3.forEach((key, value) {
          if (key != 'amount' && key != 'time') {
            final String amount = value['amount'] ?? '';
            final String time = value['time'] ?? '';
            final int amountString =
                int.tryParse(amount.replaceAll(' ', '')) ?? 0;
            sum3 += amountString;
            rows3.add(TableRow(children: [
              // DataCell(Text('Offertory')),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Ksh ${amount}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('${time}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ))
            ]));
          }
        });
        final Map<String, dynamic> newData4 = jsonDecode(cashIn4);
        newData4.forEach((key, value) {
          if (key != 'amount' && key != 'time') {
            final String amount = value['amount'] ?? '';
            final String time = value['time'] ?? '';
            final int amountString =
                int.tryParse(amount.replaceAll(' ', '')) ?? 0;
            sum4 += amountString;
            rows4.add(TableRow(children: [
              // DataCell(Text('Offertory')),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Ksh ${amount}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('${time}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ))
            ]));
          }
        });
        final Map<String, dynamic> newData5 = jsonDecode(cashIn5);
        newData5.forEach((key, value) {
          if (key != 'amount' && key != 'time') {
            final String amount = value['amount'] ?? '';
            final String time = value['time'] ?? '';
            final int amountString =
                int.tryParse(amount.replaceAll(' ', '')) ?? 0;
            sum5 += amountString;
            rows5.add(TableRow(children: [
              // DataCell(Text('Offertory')),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Ksh ${amount}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('${time}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ))
            ]));
          }
        });
        final Map<String, dynamic> newData6 = jsonDecode(cashIn6);
        newData6.forEach((key, value) {
          if (key != 'amount' && key != 'time') {
            final String amount = value['amount'] ?? '';
            final String time = value['time'] ?? '';
            final int amountString =
                int.tryParse(amount.replaceAll(' ', '')) ?? 0;
            sum6 += amountString;
            rows6.add(TableRow(children: [
              // DataCell(Text('Offertory')),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Ksh ${amount}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('${time}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ))
            ]));
          }
        });
        final Map<String, dynamic> newData7 = jsonDecode(cashIn7);
        newData7.forEach((key, value) {
          if (key != 'amount' && key != 'time') {
            final String amount = value['amount'] ?? '';
            final String time = value['time'] ?? '';
            final int amountString =
                int.tryParse(amount.replaceAll(' ', '')) ?? 0;
            sum7 += amountString;
            rows7.add(TableRow(children: [
              // DataCell(Text('Offertory')),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Ksh ${amount}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('${time}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ))
            ]));
          }
        });
        final Map<String, dynamic> newData8 = jsonDecode(cashIn8);
        newData8.forEach((key, value) {
          if (key != 'amount' && key != 'time') {
            final String amount = value['amount'] ?? '';
            final String time = value['time'] ?? '';
            final int amountString =
                int.tryParse(amount.replaceAll(' ', '')) ?? 0;
            sum8 += amountString;
            rows8.add(TableRow(children: [
              // DataCell(Text('Offertory')),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Ksh ${amount}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('${time}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ))
            ]));
          }
        });
        final Map<String, dynamic> newData9 = jsonDecode(cashIn9);
        newData9.forEach((key, value) {
          if (key != 'amount' && key != 'time') {
            final String amount = value['amount'] ?? '';
            final String time = value['time'] ?? '';
            final int amountString =
                int.tryParse(amount.replaceAll(' ', '')) ?? 0;
            sum9 += amountString;
            rows9.add(TableRow(children: [
              // DataCell(Text('Offertory')),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Ksh ${amount}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('${time}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ))
            ]));
          }
        });
        final Map<String, dynamic> newData10 = jsonDecode(cashIn10);
        newData10.forEach((key, value) {
          if (key != 'amount' && key != 'time') {
            final String amount = value['amount'] ?? '';
            final String time = value['time'] ?? '';
            final int amountString =
                int.tryParse(amount.replaceAll(' ', '')) ?? 0;
            sum10 += amountString;
            rows10.add(TableRow(children: [
              // DataCell(Text('Offertory')),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Ksh ${amount}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('${time}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ))
            ]));
          }
        });
        final Map<String, dynamic> newData11 = jsonDecode(cashIn11);
        newData11.forEach((key, value) {
          if (key != 'amount' && key != 'time') {
            final String amount = value['amount'] ?? '';
            final String time = value['time'] ?? '';
            final int amountString =
                int.tryParse(amount.replaceAll(' ', '')) ?? 0;
            sum11 += amountString;
            rows11.add(TableRow(children: [
              // DataCell(Text('Offertory')),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Ksh ${amount}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('${time}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ))
            ]));
          }
        });
        final Map<String, dynamic> newData12 = jsonDecode(cashIn12);
        newData12.forEach((key, value) {
          if (key != 'amount' && key != 'time') {
            final String amount = value['amount'] ?? '';
            final String time = value['time'] ?? '';
            final int amountString =
                int.tryParse(amount.replaceAll(' ', '')) ?? 0;
            sum12 += amountString;
            rows12.add(TableRow(children: [
              // DataCell(Text('Offertory')),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Ksh ${amount}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('${time}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ))
            ]));
          }
        });
        final Map<String, dynamic> newData13 = jsonDecode(cashIn13);
        newData13.forEach((key, value) {
          if (key != 'amount' && key != 'time') {
            final String amount = value['amount'] ?? '';
            final String time = value['time'] ?? '';
            final int amountString =
                int.tryParse(amount.replaceAll(' ', '')) ?? 0;
            sum13 += amountString;
            rows13.add(TableRow(children: [
              // DataCell(Text('Offertory')),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Ksh ${amount}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('${time}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ))
            ]));
          }
        });
        final Map<String, dynamic> newData14 = jsonDecode(cashIn14);
        newData14.forEach((key, value) {
          if (key != 'amount' && key != 'time') {
            final String amount = value['amount'] ?? '';
            final String time = value['time'] ?? '';
            final int amountString =
                int.tryParse(amount.replaceAll(' ', '')) ?? 0;
            sum14 += amountString;
            rows14.add(TableRow(children: [
              // DataCell(Text('Offertory')),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Ksh ${amount}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('${time}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ))
            ]));
          }
        });
        final Map<String, dynamic> newData15 = jsonDecode(cashIn15);
        newData15.forEach((key, value) {
          if (key != 'amount' && key != 'time') {
            final String amount = value['amount'] ?? '';
            final String time = value['time'] ?? '';
            final int amountString =
                int.tryParse(amount.replaceAll(' ', '')) ?? 0;
            sum15 += amountString;
            rows15.add(TableRow(children: [
              // DataCell(Text('Offertory')),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('Ksh ${amount}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text('${time}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ))
            ]));
          }
        });
      }
    }
    int totals = sum1 +
        sum2 +
        sum3 +
        sum4 +
        sum5 +
        sum6 +
        sum7 +
        sum8 +
        sum9 +
        sum10 +
        sum11 +
        sum12 +
        sum13 +
        sum14 +
        sum15;
    List<int> rows = [
      sum1,
      sum2,
      sum3,
      sum4,
      sum5,
      sum6,
      sum7,
      sum8,
      sum9,
      sum10,
      sum11,
      sum12,
      sum13,
      sum14,
      sum15,
      totals
    ];
    return Scaffold(
      appBar: AppBar(actions: [
        Card(
          child: TextButton.icon(
            style: ButtonStyle(
              elevation: MaterialStatePropertyAll(24),
              backgroundColor: MaterialStatePropertyAll(Colors.black),
              foregroundColor: MaterialStatePropertyAll(Colors.white),
            ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                              appBar: AppBar(
                                  title: Text(
                                      'Total amount as at ${DateFormat.yMMMd().format(DateTime.now())}'),
                                  actions: [
                                    Card(
                                      child: TextButton.icon(
                                        style: ButtonStyle(
                                          elevation: MaterialStatePropertyAll(24),
                                          backgroundColor: MaterialStatePropertyAll(Colors.black),
                                          foregroundColor: MaterialStatePropertyAll(Colors.white),
                                        ),
                                          onPressed: () async {
                                            final pdf = pw.Document();
                                      
                                            final ByteData imageData =
                                                await rootBundle.load(
                                                    'assets/images/img3.jpg');
                                            final Uint8List bytes =
                                                imageData.buffer.asUint8List();
                                            final List<pw.TableRow> rowList = [];
                                      
                                            rowList.add(pw.TableRow(
                                              verticalAlignment: pw.TableCellVerticalAlignment.middle,
                                              children: [
                                                pw.Text("Votehead",
                                                    style: pw.TextStyle(
                                                      font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')),
                                                        fontWeight:
                                                            pw.FontWeight.bold,
                                                        height: 1.7)),
                                                pw.Text("Amount",
                                                    style: pw.TextStyle(
                                                      font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')),
                                                        fontWeight:
                                                            pw.FontWeight.bold,
                                                        height:
                                                            1.7)), 
                                              ],
                                            ));
                                            rowList.add(pw.TableRow(
                                              children: [
                                                pw.Padding(child: pw.Text(headers[0], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))), 
                                                  padding: pw.EdgeInsets.all(8.0)),
                                              
                                              pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $sum1', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              )
                                            ]));
                                            
                                            rowList.add(pw.TableRow(children: [
                                              pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text(headers[1], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              ),
                                              pw.Padding(
                                                padding: const pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $sum2', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              )
                                            ]));
                                            rowList.add(pw.TableRow(children: [
                                              pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text(headers[2], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              ),
                                              pw.Padding(
                                                padding: const pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $sum3', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              )
                                            ]));
                                            rowList.add(pw.TableRow(children: [
                                              pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text(headers[3], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              ),
                                              pw.Padding(
                                                padding: const pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $sum4', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              )
                                            ]));
                                            rowList.add(pw.TableRow(children: [
                                              pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text(headers[4], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              ),
                                              pw.Padding(
                                                padding: const pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $sum5', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              )
                                            ]));
                                            rowList.add(pw.TableRow(children: [
                                              pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text(headers[5], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              ),
                                              pw.Padding(
                                                padding: const pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $sum6', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              )
                                            ]));
                                            rowList.add(pw.TableRow(children: [
                                              pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text(headers[6], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              ),
                                              pw.Padding(
                                                padding: const pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $sum7', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              )
                                            ]));
                                            rowList.add(pw.TableRow(children: [
                                              pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text(headers[7], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              ),
                                              pw.Padding(
                                                padding: const pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $sum8', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              )
                                            ]));
                                            rowList.add(pw.TableRow(children: [
                                              pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text(headers[8], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              ),
                                              pw.Padding(
                                                padding: const pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $sum9', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              )
                                            ]));
                                            rowList.add(pw.TableRow(children: [
                                              pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text(headers[9], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              ),
                                              pw.Padding(
                                                padding: const pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $sum10', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              )
                                            ]));
                                            rowList.add(pw.TableRow(children: [
                                              pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text(headers[10], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              ),
                                              pw.Padding(
                                                padding: const pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $sum11', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              )
                                            ]));
                                            rowList.add(pw.TableRow(children: [
                                              pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text(headers[11], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              ),
                                              pw.Padding(
                                                padding: const pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $sum12', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              )
                                            ]));
                                            rowList.add(pw.TableRow(children: [
                                              pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text(headers[12], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              ),
                                              pw.Padding(
                                                padding: const pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $sum13', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              )
                                            ]));
                                            rowList.add(pw.TableRow(children: [
                                             pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text(headers[13], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              ),
                                              pw.Padding(
                                                padding: const pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $sum14', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              )
                                            ]));
                                            rowList.add(pw.TableRow(children: [
                                              pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text(headers[14], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              ),
                                              pw.Padding(
                                                padding: const pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $sum15', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')))),
                                              )
                                            ]));
                                            rowList.add(pw.TableRow(children: [
                                              pw.Padding(
                                                padding: pw.EdgeInsets.all(8.0),
                                                child: pw.Text(headers[15], style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')),
                                                  fontWeight: pw.FontWeight.bold)),
                                              ),
                                              pw.Padding(
                                                padding: const pw.EdgeInsets.all(8.0),
                                                child: pw.Text('Ksh $totals', style: pw.TextStyle(
                                                  font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf')),
                                                  fontWeight: pw.FontWeight.bold)),
                                              )
                                            ]));
                                      
                                            pdf.addPage(pw.Page(
                                              
                                              pageFormat: PdfPageFormat.a4,
                                              theme: pw.ThemeData(
                                                  tableCell: pw.TextStyle(
                                                    lineSpacing: 2.5,
                                                   letterSpacing: 0.8,
                                                   fontSize: 17,
                                                   height: 1.8,
                                                   font: pw.Font.ttf(await rootBundle.load('assets/fonts/Livvic-Regular.ttf'))
                                                  )
                                                ),
                                              build: (context) {
                                              return pw.Column(children: [
                                                pw.Row(
                                                    mainAxisAlignment: pw
                                                        .MainAxisAlignment.center,
                                                    children: [
                                                      pw.SizedBox(
                                                        height: 80.0,
                                                        width: 60.0,
                                                        child: pw.Image(
                                                            pw.MemoryImage(
                                                                bytes)),
                                                      ),
                                                      pw.Column(
                                                          mainAxisAlignment: pw.MainAxisAlignment.start,
                                                          mainAxisSize:pw.MainAxisSize.min,
                                                          children: [
                                                            pw.Text(
                                                                '{Your Organisation Name}',
                                                                style:
                                                                    pw.TextStyle(
                                                                  fontSize: 23,
                                                                  fontWeight: pw
                                                                      .FontWeight
                                                                      .bold,
                                                                ),
                                                                textAlign: pw
                                                                    .TextAlign
                                                                    .center),
                                                            pw.SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            pw.Text(
                                                              '{Your Organisation Address}',
                                                              style: pw.TextStyle(
                                                                  fontSize: 17,
                                                                  color: PdfColors
                                                                      .pinkAccent),
                                                            ),
                                                            pw.SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            pw.Text(
                                                              'P.O BOX , ',
                                                              style: pw.TextStyle(
                                                                  fontSize: 17,
                                                                  color: PdfColors
                                                                      .pinkAccent),
                                                            ),
                                                            pw.SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            pw.Text(
                                                              '{Your city}, ',
                                                              style: pw.TextStyle(
                                                                  fontSize: 17,
                                                                  color: PdfColors
                                                                      .pinkAccent),
                                                            ),
                                                          ]),
                                                    ]),
                                                    pw.SizedBox(
                                                              height: 10.0,
                                                            ),
                                                            pw.Text(
                                                              'EXPENDITURE AS AT ${DateFormat.yMMMd().format(DateTime.now())}',
                                                              style: pw.TextStyle(
                                                                  fontSize: 18,
                                                                  color: PdfColors
                                                                      .black),
                                                            ),
                                                pw.SizedBox(
                                                  height: 20.0,
                                                ),
                                                pw.Table(
                                                  
                                                  border: pw.TableBorder(
                                                      horizontalInside:
                                                          pw.BorderSide(
                                                              width: 0.1)),
                                                  children:
                                                      rowList, // Use the generated rows list
                                                ),
                                              ]);
                                            }));
                                            final output = await getTemporaryDirectory();
                                            final file = File('${output.path}/filetotals.pdf');
                                            await file.writeAsBytes(await pdf.save());
                                            await Printing.layoutPdf(
                                              onLayout: (PdfPageFormat format) async => pdf.save(),
                                            );
                                          },
                                          icon: Icon(Icons.print_sharp),
                                          label: Text('Print',style: TextStyle(fontWeight: FontWeight.bold))),
                                    )
                                  ]),
                              body: Center(
                                child: SingleChildScrollView(
                                  child: DataTable(
                                      border: TableBorder.all(),
                                      columns: [
                                        DataColumn(
                                            label: Text('Votehead',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                        DataColumn(
                                            label: Text('Amount:',
                                                style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                      rows: List<DataRow>.generate(
                                          headers.length,
                                          (index) => DataRow(cells: [
                                                DataCell(Text(headers[index],
                                                    style: TextStyle(
                                                        fontSize: headers[index] == headers.length - 1
                                                            ? 18
                                                            : 16,
                                                        fontWeight: headers[index] == headers.length - 1
                                                            ? FontWeight.bold
                                                            : FontWeight.w300))),
                                                DataCell(Text(
                                                    'Ksh ' + rows[index].toString(),
                                                    style: TextStyle(
                                                        fontSize: headers[index] == headers.length - 1
                                                            ? 18
                                                            : 16,
                                                        fontWeight: headers[index] == headers.length - 1
                                                            ? FontWeight.bold
                                                            : FontWeight.w300)))
                                              ]))),
                                ),
                              ),
                            )));
              },
              icon: Icon(Icons.monetization_on_sharp),
              label: Text('Sub-totals',style: TextStyle(fontWeight: FontWeight.bold))),
        ),
      ]),
      body: _cashins == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Text('No data found'), CircularProgressIndicator()],
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Table(border: TableBorder.all(), children: [
                  TableRow(children: [
                    Text('Votehead',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Amount',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                        Text('Date',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Quota',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                    ),
                    Table(border: TableBorder.all(), children: rows1),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Merry-go-round',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                    ),
                    Table(border: TableBorder.all(), children: rows2),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Welfare',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                    ),
                    Table(border: TableBorder.all(), children: rows3),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Hospitality',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                    ),
                    Table(border: TableBorder.all(), children: rows4),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Holly Communion',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                    ),
                    Table(border: TableBorder.all(), children: rows5),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('donations',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                    ),
                    Table(border: TableBorder.all(), children: rows6),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('KAYO',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                    ),
                    Table(border: TableBorder.all(), children: rows7),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Children',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                    ),
                    Table(border: TableBorder.all(), children: rows8),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Mothers Union',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                    ),
                    Table(border: TableBorder.all(), children: rows9),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('KAMA',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                    ),
                    Table(border: TableBorder.all(), children: rows10),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Stationary',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                    ),
                    Table(border: TableBorder.all(), children: rows11),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Miscelanious',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                    ),
                    Table(border: TableBorder.all(), children: rows12),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('DMA',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                    ),
                    Table(border: TableBorder.all(), children: rows13),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Mission/Praise & Worship',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                    ),
                    Table(border: TableBorder.all(), children: rows14),
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Church Development',
                          style: TextStyle( fontWeight: FontWeight.bold)),
                    ),
                    Table(border: TableBorder.all(), children: rows15),
                  ]),
                ]),
              ),
            ),
    );
  }
}
