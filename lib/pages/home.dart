import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:makhanerush/widgets/buttons/google_sign_in_button.dart';
import 'package:makhanerush/widgets/buttons/theme_button.dart';

import '../costants.dart';

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

class _HomeState extends State<Home> {
  bool isAuth = false;

  @override
  Widget build(BuildContext context) {
    return isAuth ? buildAuthScreen() : buildUnAuthScreen();
  }

  Widget buildAuthScreen() {
    return Text('Authenticated');
  }

  Widget buildUnAuthScreen() {
    var theme = Theme.of(context);
    return Scaffold(
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
            // Align(
            //   alignment: Alignment.topCenter,
            //   child: ClipPath(
            //     clipper: CustomAppbarShape(),
            //     // this is my own class which extendsCustomClipper
            //     child: Container(
            //       color: theme.primaryColor,
            //       height: MediaQuery.of(context).devicePixelRatio * 150,
            //       child: MediaQuery.of(context).platformBrightness == Brightness.dark ? Lottie.asset('assets/lotties/appbardarkmode.json', width: double.infinity, fit: BoxFit.cover) : Lottie.asset('assets/lotties/appbarlightmode.json', width: double.infinity, fit: BoxFit.cover),
            //     ),
            //   ),
            // ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Lottie.asset('assets/lotties/investiment.json', width: double.infinity, fit: BoxFit.cover),
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
                    child: ColorizeAnimatedTextKit(
                      colors: [
                        theme.textTheme.bodyText1.color,
                        theme.primaryColorLight
                      ],
                      speed: Duration(milliseconds: 200),
                      textAlign: TextAlign.center,
                      repeatForever: true,
                      textStyle: TextStyle(fontSize: 40, color: theme.textTheme.bodyText1.color, fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),
                      text: [
                        'MakhaneRush'
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.80,
                  child: DefaultTextStyle(
                    style: TextStyle(fontSize: 40),
                    child: TypewriterAnimatedTextKit(
                      speed: Duration(milliseconds: 200),
                      textAlign: TextAlign.center,
                      repeatForever: true,
                      textStyle: TextStyle(color: theme.textTheme.bodyText1.color, fontWeight: FontWeight.w600, fontFamily: 'Montserrat'),
                      text: [
                        'Think the impossible',
                        'There\'s no limit'
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.40,
                ),
                GestureDetector(
                  onTap: () {},
                  child: GoogleSignInButton(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
