import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpFormField extends StatefulWidget {
  final Function function;

  const SignUpFormField({Key key, this.function}) : super(key: key);

  @override
  _SignUpFormFieldState createState() => _SignUpFormFieldState();
}

class _SignUpFormFieldState extends State<SignUpFormField> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  TextEditingController mailController = new TextEditingController();
  TextEditingController password1Controller = new TextEditingController();
  TextEditingController password2Controller = new TextEditingController();
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    var theme = Theme.of(context);
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        height: MediaQuery.of(context).devicePixelRatio * 185,
        width: MediaQuery.of(context).devicePixelRatio * 210,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //MAIL
                    Container(
                      decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(14), boxShadow: [
                        BoxShadow(
                          color: theme.primaryColorDark,
                          offset: Offset(0, 12),
                          blurRadius: 16,
                        )
                      ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: mailController,
                          obscureText: false,
                          enableSuggestions: true,
                          autocorrect: true,
                          keyboardType: TextInputType.emailAddress,
                          textAlignVertical: TextAlignVertical.center,
                          enabled: true,
                          cursorColor: theme.iconTheme.color,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.alternate_email,
                              color: theme.iconTheme.color,
                            ),
                            border: InputBorder.none,
                            hintText: "Indirizzo mail",
                            //hintStyle: kBodyLabelStyle.copyWith(color: kBackgroundColor),
                          ),
                          //style: TextStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //PASSWORD
                    Container(
                      decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(14), boxShadow: [
                        BoxShadow(
                          color: theme.primaryColorDark,
                          offset: Offset(0, 12),
                          blurRadius: 16,
                        )
                      ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: password1Controller,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          textAlignVertical: TextAlignVertical.center,
                          enabled: true,
                          cursorColor: theme.iconTheme.color,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock_outline,
                              color: theme.iconTheme.color,
                            ),
                            border: InputBorder.none,
                            hintText: "Password",
                            //hintStyle: kBodyLabelStyle.copyWith(color: kBackgroundColor),
                          ),
                          //style: kBodyLabelStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //RIPETI PASSWORD
                    Container(
                      decoration: BoxDecoration(color: theme.primaryColor, borderRadius: BorderRadius.circular(14), boxShadow: [
                        BoxShadow(
                          color: theme.primaryColorDark,
                          offset: Offset(0, 12),
                          blurRadius: 16,
                        )
                      ]),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextFormField(
                          controller: password2Controller,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                          textAlignVertical: TextAlignVertical.center,
                          enabled: true,
                          cursorColor: theme.iconTheme.color,
                          decoration: InputDecoration(
                            icon: Icon(
                              Icons.lock_outline,
                              color: theme.iconTheme.color,
                            ),
                            border: InputBorder.none,
                            hintText: "Ripeti password",
                            //hintStyle: kBodyLabelStyle.copyWith(color: kBackgroundColor),
                          ),
                          //style: kBodyLabelStyle.copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Listener(
                      onPointerDown: (PointerDownEvent event) {
                        _controller.forward();
                      },
                      onPointerUp: (PointerUpEvent event) {
                        _controller.reverse();
                      },
                      child: Transform.scale(
                        scale: _scale,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
                              BoxShadow(
                                color: theme.primaryColor,
                                offset: Offset(0, 12),
                                blurRadius: 16,
                              )
                            ]),
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              ),
                              color: theme.buttonColor,
                              onPressed: () async {},
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                                child: Text(
                                  "Registrati",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: widget.function,
                child: Text(
                  "Sei già in possesso di un account? Accedi",
                  style: TextStyle(fontSize: 15, decoration: TextDecoration.underline, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
