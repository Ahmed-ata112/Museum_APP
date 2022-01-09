import 'package:flutter/material.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:main_program/Accountant/Souvenir.dart';
import 'package:main_program/Accountant/InsertNewEmployee.dart';
import'package:main_program/Accountant/GivePromotion.dart';
import'package:main_program/controller.dart';
Widget Souvenirs_Card() {return GFCard();}
class SouvenirSale extends StatefulWidget {
  final List<Souvenir> S;
  Souvenir m= new Souvenir('sName', 1, 1, 1);

  SouvenirSale({Key? key,required this.S}):super(key:key);
  @override
  SouvenirSaleState createState() => SouvenirSaleState(S);
}

class SouvenirSaleState extends State<SouvenirSale> {
  List<Souvenir> S;
  SouvenirSaleState(this.S);
  @override
  List<String> labels=['Souvenir ID ','quantity'];
  void initState() {
    super.initState();
    Controller.getSouvenirSale_visitor().then((ReturnedList) {
      setState(() {
        for (var row in ReturnedList) {
         Souvenir e= Souvenir('sName', 1, row[0], row[1]);
         print (e);
          S.add(e);
        }
        setState(() {});
      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Souvenir Sale by visitors"),
      ),
    body: SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: SingleChildScrollView(
    scrollDirection: Axis.vertical,
    child: DataTable(columns: [
    for (var v in labels) DataColumn(label: Text(v))
    ], rows: [
    for (var row in S)
    DataRow(cells: [
     DataCell(Text(row.sID.toString())),
      DataCell(Text(row.squantity.toString())),
    ]),
    ]),
    ),
    ),);
          }
  }
