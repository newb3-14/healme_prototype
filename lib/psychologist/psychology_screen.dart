import 'package:flutter/material.dart';

import 'package:prototype/shared/appbar.dart';
import 'package:prototype/shared/header.dart';

class PsyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: Column(
        children: [
          Header(),
          Expanded(child: ListView.builder(itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 100,
                decoration: BoxDecoration(color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name here"),
                          Text("Last message"),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          }))
        ],
      ),
    );
  }
}
