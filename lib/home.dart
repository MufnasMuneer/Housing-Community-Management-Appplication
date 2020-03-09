// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './forgotpassword.dart';
// import './home_page_screen.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

enum FormType {
  login, 
  register
}

class _HomeState extends State<Home> {

  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave(){
    final form = formKey.currentState;
    if(form.validate()){
      form.save();
      print('form is valid, Email: $_email, Password: $_password');
      return true;
    }else{
      print('form is invalid');
      return false;
    }
  }

  void validateAndSubmit() async{
    if (validateAndSave()){
      try {
        if(_formType == FormType.login){
          FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
          print('Logged In!! ${user.uid}');

          // Navigator.push(
          //   context, 
          //   MaterialPageRoute(builder: (context) => HomePageScreen()),
          // );
        }
      }
        catch (e) {
          print('Error $e');
        }
      }
    }
  
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ListView(
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(top: 80),
              height: MediaQuery.of(context).size.width / 2.5,
              child: Image.asset(
                "assets/images/tcrwa_logo.png",
              )),
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "TCR",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: width / 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "WA",
                  style: TextStyle(
                      color: Colors.blue[300],
                      fontSize: width / 16,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          Form(
            key: formKey,
            child: Column(children: <Widget>[
            Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 12,
                right: MediaQuery.of(context).size.width / 12,
                top: 6),
            child: TextFormField(
              obscureText: false,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.text,
              validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
              onSaved: (value) => _email = value,
              onChanged: (String email) {},
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'username',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 12,
                right: MediaQuery.of(context).size.width / 12,
                top: 16,
                bottom: 20),
            child: TextFormField(
              obscureText: true,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.text,
              onChanged: (String email) {},
              validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
              onSaved: (value) => _password = value,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'password',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  )),
            ),
          ),
          Center(

              child:Container(
                width:MediaQuery.of(context).size.width - MediaQuery.of(context).size.width / 6,
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 12),
            height: MediaQuery.of(context).size.width / 7,
            color: Colors.blue,
            child: RaisedButton(
              child: Text(
                "Login",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 18),
              ),
              onPressed: validateAndSubmit,
              color: Colors.blue,

              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ForgotPassord(),
                    ),
                  );
                },
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width / 25),
                ),
              ),
            ),
          ),
          Center(child: Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: width / 4),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Don't have account?",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width / 25),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      child: Text(
                        "Signup",
                        style: TextStyle(
                            color: Colors.blue[400],
                            fontSize: MediaQuery.of(context).size.width / 25),
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
