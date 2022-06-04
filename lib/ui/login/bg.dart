import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/style_constant.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: Column(
        children: <Widget>[
          ImgHeaderLogin(),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}

// image header login
class ImgHeaderLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topLeft,
          child: Container(
            child: Image.asset(
              'assets/header-login.png',
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.08,
          right: size.width * 0.39,
          child: Image.asset("assets/logo.png", width: size.width * 0.25),
        ),
      ],
    );
  }
}
