import 'package:flutter/material.dart';

import '../../costants.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;
  bool isDropDownOpened = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(2),
      child: _isSigningIn
          ? CircularProgressIndicator(
              //valueColor: AlwaysStoppedAnimation<Color>(kMainColorLight),
            )
          : FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              color: theme.primaryColor,
              onPressed: () async {
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/images/google-logo.png'),
                      height: 35.0,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text('Google')
                  ],
                ),
              ),
            ),
    );
  }
}
