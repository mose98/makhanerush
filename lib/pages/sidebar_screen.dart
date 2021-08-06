
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makhanerush/models/sidebar.dart';
import 'package:makhanerush/models/user.dart';
import 'package:makhanerush/widgets/components/sidebar_row.dart';

class SidebarScreen extends StatelessWidget {
  final FirebaseUser user;
  final Function signOutFunc;

  const SidebarScreen({Key key, @required this.user, this.signOutFunc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: theme.accentColor.withOpacity(0.8),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(34.0),
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: EdgeInsets.symmetric(
        vertical: 35.0,
        horizontal: 20.0,
      ),
      child: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                user.photoUrl != null
                    ? ClipOval(
                        child: Material(
                          //color: kBlueMainColor,
                          child: Image.network(
                            user.photoUrl,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      )
                    : ClipOval(
                        child: Material(
                          //color: kBlueMainColor,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                SizedBox(
                  width: 15.0,
                ),
                user.displayName != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.displayName,
                            //style: kHeadlineLabelStyle,
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            user.email,
                            //style: kSearchPlaceholderStyle,
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.email,
                            //style: kHeadlineLabelStyle,
                          ),
                        ],
                      )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            GestureDetector(
              onTap: () {
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => IntroScreen(user: user)));
              },
              child: SidebarRow(
                item: sidebarItem[0],
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            GestureDetector(
              onTap: () {
              },
              child: SidebarRow(
                item: sidebarItem[1],
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            GestureDetector(
              onTap: (){
                //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultScreen(user: user)));
              },
              child: SidebarRow(
                item: sidebarItem[2],
              ),
            ),
            SizedBox(
              height: 32.0,
            ),
            Spacer(),
            GestureDetector(
              onTap: signOutFunc,
              child: Row(
                children: [
                  Image.asset(
                    'assets/icons/icon-logout.png',
                    width: 17.0,
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    "Log out",
                    //style: kSecondaryCalloutLabelStyle,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
