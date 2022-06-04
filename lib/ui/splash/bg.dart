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
          ImgHeaderSplash(),
          Expanded(
            child: Container(),
          ),
          ImgFooterSplash(),
        ],
      ),
    );
  }
}

// image header splash
class ImgHeaderSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.topRight,
          child: Container(
            child: Image.asset(
              'assets/header-splash.png',
            ),
          ),
        )
      ],
    );
  }
}

// image footer splash
class ImgFooterSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            child: Image.asset(
              'assets/footer-splash.png',
            ),
          ),
        )
      ],
    );
  }
}
