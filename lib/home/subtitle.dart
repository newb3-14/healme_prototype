import 'package:flutter/material.dart';

class Subtitle extends StatelessWidget {
  final String text; 
  final String subtext;
  final String route;

  Subtitle(this.text, this.subtext, this.route);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            child: Stack(
              children: [
                Text(
                  text,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
          Spacer(),
          TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(route);
            },
            child: Text(subtext),
          ),
        ],
      ),
    );
  }
}
