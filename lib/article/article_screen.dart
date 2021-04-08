import 'package:flutter/material.dart';
import 'package:prototype/shared/appbar.dart';
import 'package:prototype/shared/constants.dart';
import 'package:prototype/shared/header.dart';

class ArticleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar,
      body: Column(
        children: [
          Header(),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: size.height * 0.6,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ]),
                      ),
                      Positioned(
                        top: 10,
                        bottom: 10,
                        right: 10,
                        left: 10,
                        child: Column(
                          children: [
                            Container(
                              height: size.height * 0.4,
                              width: size.width,
                              decoration: BoxDecoration(
                                color: Colors.green[700],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Lorem Ipsum",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text("#tags, #tags, #tags"),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: ElevatedButton(onPressed: (){}, child: Container(
                                child: Text("Read more", style: TextStyle(color: Colors.white),),
                                decoration: BoxDecoration(color: kPrimaryColor),
                              )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}
