import 'package:DemoFlutter/src/blocs/login_bloc.dart';
import 'package:DemoFlutter/src/resources/home_page.dart';
import 'package:flutter/material.dart';



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: LoginPage(),
    );
  }
}



class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPass = false;


  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();


  LoginBloc bloc= new LoginBloc();


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

                child: StreamBuilder(
                  stream: bloc.userStream,
                  builder: (context, snapshot) =>  TextField(
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    controller: _userController,
                    decoration: InputDecoration(
                        errorText: snapshot.hasError ? snapshot.error: null,
                        labelText: "USERNAME",
                        labelStyle: TextStyle(color: Colors.blue, fontSize: 20)),
                  ),
                )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: <Widget>[

                      StreamBuilder(
                        stream: bloc.passStream,
                        builder: (context, snapshot) => TextField(
                        controller: _passController,
                        obscureText: !_showPass,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                        decoration: InputDecoration(
                            errorText:snapshot.hasError? snapshot.error: null,
                            labelText: "PASSWORD",
                            labelStyle:
                            TextStyle(color: Colors.blue, fontSize: 20)),
                      ),),

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

    if(bloc.isValidInfo(_userController.text, _passController.text)){
      Navigator.push(context, MaterialPageRoute(builder: gotoHome));
    }


  }


  Widget gotoHome(BuildContext context){
    return HomePage();
  }
  void onToggleShowpass() {
    setState(() {
      _showPass = !_showPass;
    });
  }
}
