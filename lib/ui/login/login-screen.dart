import 'package:flutter/material.dart';
import 'package:flutter_challenge/constants/style_constant.dart';
import 'package:flutter_challenge/constants/text.dart';
import 'package:flutter_challenge/ui/login/bg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  bool _isVisible = true;
  bool _val_user_id = false;
  bool _val_pass = false;
  bool _alertCheck = false;
  TextEditingController _user_id = TextEditingController();
  TextEditingController _pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Background(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  SetText.login,
                  style: ttlStyle,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: size.height * 0.003),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  SetText.subLogin,
                  style: subttlStyle,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  SetText.user,
                  textAlign: TextAlign.left,
                  style: pleacehStyle,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: _user_id,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: SetText.user,
                    errorText: _val_user_id
                        ? SetText.user + '' + SetText.nextval
                        : null,
                    hintStyle: valStyle,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: borderStyle,
                    ),
                  ),
                  style: tfStyle,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  SetText.pass,
                  textAlign: TextAlign.left,
                  style: pleacehStyle,
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  controller: _pass,
                  decoration: InputDecoration(
                    hintText: SetText.pass,
                    errorText:
                        _val_pass ? SetText.pass + '' + SetText.nextval : null,
                    hintStyle: valStyle,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: borderStyle,
                    ),
                    suffixIcon: GestureDetector(
                      onTap: _toggle,
                      child: Icon(
                        _isVisible ? Icons.visibility_off : Icons.visibility,
                        size: size.width * 0.06,
                        color: defaultColor,
                      ),
                    ),
                  ),
                  obscureText: _obscureText,
                  style: tfStyle,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: RaisedButton(
                  onPressed: _login,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(80.0)),
                  textColor: whiteColor,
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    alignment: Alignment.center,
                    height: size.height * 0.062,
                    width: size.width * 0.4,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: new LinearGradient(
                            colors: [defaultColor, defaultColor])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      SetText.login.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: size.height * 0.02,
            right: size.width * 0.22,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  SetText.infosingup,
                  style: infosingupStyle,
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(SetText.gosingup),
                        action: SnackBarAction(
                            label: SetText.oke, onPressed: () {}),
                      ),
                    );
                  },
                  child: Text(
                    SetText.singup,
                    style: singupStyle,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
      _isVisible = !_isVisible;
    });
  }

  void _login() async {
    setState(() {
      _user_id.text.isEmpty ? _val_user_id = true : _val_user_id = false;
      _pass.text.isEmpty ? _val_pass = true : _val_pass = false;
    });
    if (_user_id.text.isNotEmpty && _pass.text.isNotEmpty) {
      _alert(_alertCheck = true);
    } else {
      _alert(_alertCheck = false);
    }
  }

  void _alert(alertCheck) async {
    Size size = MediaQuery.of(context).size;
    Alert(
        context: context,
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                alertCheck ? SetText.a_ttlsuccess : SetText.a_ttlfield,
                textAlign: TextAlign.left,
                style: alertttlStyle,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              alertCheck ? SetText.a_descsuccess : SetText.a_descfield,
              textAlign: TextAlign.left,
              style: alerttextdescStyle,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            width: size.width * 0.28,
            child: Text(
              SetText.oke,
              style: alerttextStyle,
            ),
            onPressed: () => {
              Navigator.pop(context),
            },
            gradient: new LinearGradient(colors: [defaultColor, defaultColor]),
          )
        ]).show();
  }
}
