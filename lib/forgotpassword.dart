import 'package:flutter/material.dart';

class ForgotPassord extends StatefulWidget {
  ForgotPassord({Key key}) : super(key: key);

  @override
  _ForgotPassordState createState() => _ForgotPassordState();
}

class _ForgotPassordState extends State<ForgotPassord> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        backgroundColor: Color(0xff02528A),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                // Container(
                //   padding: const EdgeInsets.only(top: 20),
                //   height: width / 4.7,
                //   color: Color(0xff02528A),
                //   margin: EdgeInsets.only(
                //     bottom: 35,
                //   ),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //       Text(
                //         "TCR",
                //         style: TextStyle(
                //             color: Colors.white,
                //             fontSize: width / 16,
                //             fontWeight: FontWeight.w500),
                //       ),
                //       Text(
                //         "WA",
                //         style: TextStyle(
                //             color: Colors.blue[300],
                //             fontSize: width / 16,
                //             fontWeight: FontWeight.w500),
                //       )
                //     ],
                //   ),
                // ),
                Container(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 12,
                      right: MediaQuery.of(context).size.width / 12,
                      top: 30),
                  child: TextField(
                    obscureText: false,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    onChanged: (String email) {},
                    decoration: InputDecoration(
                      counterText: "",
                        border: OutlineInputBorder(),
                        labelText: 'Mobile number',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 18,
                      //horizontal: MediaQuery.of(context).size.width / 3
                      right: width/12
                      ),
                  height: MediaQuery.of(context).size.width / 10,
                  width: width/4,
                  color: Colors.blue[400],
                  child: Center(
                    child: Text(
                      "Get Otp",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width / 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
