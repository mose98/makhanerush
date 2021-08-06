import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lottie/lottie.dart';
import 'package:makhanerush/provider/authentication.dart';
import 'package:makhanerush/widgets/buttons/google_sign_in_button.dart';
import 'package:makhanerush/widgets/buttons/theme_button.dart';
import 'package:makhanerush/widgets/login_form.dart';
import 'package:makhanerush/widgets/signup_form.dart';

final googleSignIn = GoogleSignIn();

class CustomAppbarShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  bool isAuth = false;
  AuthType authType = AuthType.LOGIN;
  AnimationController _controller;
  double _scale;

  login(){
    googleSignIn.signIn();
  }

  @override
  void initState() {
    // TODO: implement initState
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 100,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });

    googleSignIn.onCurrentUserChanged.listen((account){
      if(account != null){
        print('User signed in! : $account');
        setState(() {
          isAuth = true;
        });
      }
      else{
        setState(() {
          isAuth = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }

  Widget buildAuthScreen() {
    return Text('Authenticated');
  }

  Widget buildUnAuthScreen() {
    var theme = Theme.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: theme.scaffoldBackgroundColor,
        shadowColor: theme.scaffoldBackgroundColor,
        actions: [
          ChangeThemeButtonWidget(),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.70,
                decoration: BoxDecoration(
                  color: theme.accentColor.withOpacity(0.1),
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: DefaultTextStyle(
                    style: TextStyle(fontSize: 40),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'MakhaneRush',
                          textStyle: TextStyle(fontSize: 40, color: theme.textTheme.bodyText1.color, fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),
                          colors: [theme.textTheme.bodyText1.color, theme.primaryColorLight],
                          speed: Duration(milliseconds: 200),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: DefaultTextStyle(
                    style: TextStyle(fontSize: 40),
                    child: AnimatedTextKit(
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          'Think the impossible',
                          textStyle: TextStyle(color: theme.textTheme.bodyText1.color, fontWeight: FontWeight.w600, fontFamily: 'Montserrat', fontSize: 13),
                          textAlign: TextAlign.center,
                          speed: Duration(milliseconds: 100),
                        ),
                        TypewriterAnimatedText(
                          'There\'s no limit',
                          textStyle: TextStyle(color: theme.textTheme.bodyText1.color, fontWeight: FontWeight.w600, fontFamily: 'Montserrat', fontSize: 13),
                          textAlign: TextAlign.center,
                          speed: Duration(milliseconds: 100),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            authType == AuthType.LOGIN
                ? Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      child: LogInFormField(function: () {
                        setState(() {
                          authType = AuthType.SIGNUP;
                        });
                      }),
                    ),
                  )
                : Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: double.infinity,
                      child: SignUpFormField(
                        function: () {
                          setState(() {
                            authType = AuthType.LOGIN;
                          });
                        },
                      ),
                    ),
                  ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "oppure accedi con",
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Listener(
                    onPointerDown: (PointerDownEvent event) {
                      _controller.forward();
                    },
                    onPointerUp: (PointerUpEvent event) {
                      _controller.reverse();
                      Authentication.signInWithGoogle(context: context, googleSignIn: googleSignIn);
                    },
                    child: Transform.scale(
                      scale: _scale,
                      child: GoogleSignInButton(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum AuthType {
  LOGIN,
  SIGNUP,
  PHONE,
}
