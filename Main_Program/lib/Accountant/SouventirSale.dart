import 'package:flutter/material.dart';
import 'package:main_program/Accountant/Souvenir.dart';
class SouvenirSale extends StatelessWidget {
  static String id='SouventirSale';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        //stream: //retreivefuncion
        //,
        builder: (context, snapshot) {

            List<Souvenir> _souvenir = [];
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              childAspectRatio: .8,
              ),
              itemBuilder:
                  (context, index) =>Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(child:
                        Text('souvenir $index')
                        ),
                        Positioned(
                          bottom: 0,
                          child: Opacity(
                            opacity: .6,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              color: Colors.white,
                              child:Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      //_souvenir[index].sName
                                      'souvenir $index',style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text('\$ ${
                                        //_souvenir[index].sPrice
                                    'souvenir $index'}')
                                  ],
                                ),
                              )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              itemCount: 5//_souvenir.length,
            );

          }



      ),
    );
  }}
