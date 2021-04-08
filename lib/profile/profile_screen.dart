import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prototype/shared/appbar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[700],
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), onPressed:() async{FirebaseAuth.instance.signOut();})
        ],
        title: Text(
          "Heal Me",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.4,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Positioned(
                  top: size.height * 0.02,
                  right: size.aspectRatio,
                  left: size.aspectRatio,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 50,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Your Name",
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        "Your Email",
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Balance", style: TextStyle(color: Colors.white),),
                                Text("Rp. 1.000.000,-", style: TextStyle(color: Colors.white, fontSize: 20),)
                              ],
                            ),
                            Container(
                              height: 30,
                              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.white),
                              child: TextButton(child: Text("Top Up", style: TextStyle(fontSize: 12),), onPressed: (){},),
                            )
                          ],
                        ),

                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
