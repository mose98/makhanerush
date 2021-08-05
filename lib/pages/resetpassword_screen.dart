import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../costants.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController mailController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).devicePixelRatio * 50,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                        height: MediaQuery.of(context).devicePixelRatio * 185,
                        width: MediaQuery.of(context).devicePixelRatio * 210,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    "Inserisci la mai collegata all'utente:",
                                    //style: kBodyLabelStyle,
                                  ),
                                ),
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    //MAIL
                                    Container(
                                      decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(14), boxShadow: [
                                        BoxShadow(
                                          //color: kShadowColor,
                                          offset: Offset(0, 12),
                                          blurRadius: 16,
                                        )
                                      ]),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 16),
                                        child: TextFormField(
                                          obscureText: false,
                                          enableSuggestions: true,
                                          autocorrect: true,
                                          keyboardType: TextInputType.emailAddress,
                                          controller: mailController,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              ShowToastError(message: "Indirizzo mail obbligatorio");
                                            }
                                          },
                                          textAlignVertical: TextAlignVertical.center,
                                          enabled: true,
                                          //cursorColor: kPrimaryLabelColor,
                                          decoration: InputDecoration(
                                            icon: Icon(
                                              Icons.alternate_email,
                                              //color: kBackgroundColor,
                                            ),
                                            border: InputBorder.none,
                                            hintText: "Indirizzo mail",
                                            //hintStyle: kBodyLabelStyle.copyWith(color: kBackgroundColor),
                                          ),
                                          //style: kBodyLabelStyle.copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                                      child: Container(
                                        decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(30), boxShadow: [
                                          BoxShadow(
                                            //color: kShadowColor,
                                            offset: Offset(0, 12),
                                            blurRadius: 16,
                                          )
                                        ]),
                                        child: FlatButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(40),
                                          ),
                                          //color: kBlueMainColor,
                                          onPressed: () async {},
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                            child: Text(
                                              "Invia richiesta",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
