import 'package:DemoFlutter/home.dart';
import 'package:DemoFlutter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: MyLoginForm(),
    );
  }
}



class MyLoginForm extends StatefulWidget {
  @override
  _MyLoginFormState createState() => _MyLoginFormState();
}

class _MyLoginFormState extends State<MyLoginForm> {
  bool _showPass = false;
  bool _userNameError = false;
  bool _passError = false;

  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                child: Container(
                    // logo
                    width: 70,
                    height: 70,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.yellowAccent),
                    child: FlutterLogo()),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: Text(
                  "Hello welcome back",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  style: TextStyle(fontSize: 18, color: Colors.black),
                  controller: _userController,
                  decoration: InputDecoration(
                      errorText:
                          _userNameError ? "Tên đăng nhập không hợp lệ" : null,
                      labelText: "USERNAME",
                      labelStyle: TextStyle(color: Colors.blue, fontSize: 20)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[
                      TextField(
                        controller: _passController,
                        obscureText: !_showPass,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                            errorText:
                                _passError ? "Mật khẩu không hợp lệ" : null,
                            labelText: "PASSWORD",
                            labelStyle:
                                TextStyle(color: Colors.blue, fontSize: 20)),
                      ),
                      GestureDetector(
                        onTap: onToggleShowpass,
                        child: Text(
                          _showPass ? "HIDE" : "SHOW",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
                      color: Colors.blue,
                      onPressed: onSigninClicked,
                      child: Text(
                        "SIGN IN",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              Container(
                height: 130,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "NEW USER? SIGN UP",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    Text(
                      "FORGOT PASSWORD?",
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }

  void onSigninClicked() {
    setState(() {
      if (_userController.text.length < 6 ||
          !_userController.text.contains("@")) {
        _userNameError = true;
      } else {
        _userNameError = false;
      }

      if (_passController.text.length < 6) {
        _passError = true;
      } else {
        _passError = false;
      }

      if(!_userNameError && !_passError){
        Navigator.push(context, MaterialPageRoute(builder: gotoHome));
      }
    });
  }


  Widget gotoHome(BuildContext context){
    return MyHomePage();
  }
  void onToggleShowpass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
