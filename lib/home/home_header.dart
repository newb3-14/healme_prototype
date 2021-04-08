import 'package:flutter/material.dart';
import 'package:prototype/shared/constants.dart';

import 'home_profile.dart';

//the green header
class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      //taking 40% height of phone
      height: size.height * 0.4,
      
      child: Stack(
        children: [
          Container(
            height: size.height * 0.3 - 20,
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
          ),
          Positioned(
            child: Container(
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                )),
            top: 160,
          ),
          Positioned(
            child: HomeProfile(),
            top: 20,
            left: 30,
            right: 30,
          ),
        ],
      ),
    );
  }
}
