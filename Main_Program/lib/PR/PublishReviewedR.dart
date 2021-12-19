import 'package:flutter/material.dart';
import 'package:main_program/PR/Research.dart';
class PublishReviewedR extends StatelessWidget {
  static String id='PuclishReviewedR';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        //stream: //retreivefuncion
        //,
          builder: (context, snapshot) {
              List<Research> _article = [];
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                    childAspectRatio: .8,
                  ),
                  itemBuilder:
                      (context, index) =>Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                      child:GestureDetector(
                        onTapUp: (details)
                        {

                          showMenu(
                              context: context,
                              position: RelativeRect.fromLTRB(100, 100, 100, 100),
                              items:[
                                PopupMenuItem(
                                    child: Text('publish')
                                ),
                              ]);
                        },
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(child:
                            Text('article $index')
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
                                            //_article[index]
                                            'ID $index',style: TextStyle(fontWeight: FontWeight.bold),),
                                          Text(
                                              //'\$ ${_article[index].rState}'
                                            'reviewed')
                                        ],
                                      ),
                                    )
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                  itemCount: 5//_research.length,
              );
            }





      ),
    );
  }}
