import 'package:flutter/material.dart';
import '/Screens/Login/components/background.dart';
import '/Screens/Signup/signup_screen.dart';
import '/components/already_have_an_account_acheck.dart';
import '/components/rounded_button.dart';
import '/components/rounded_input_field.dart';
import '/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import '/main.dart';

class Body extends StatefulWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email;

  String pass;

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                icon: Icons.email,
                hintText: "Your Email",
                onChanged: (value) {
                  email = '$value';
                },
                validator: (value) {
                  if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value) ==
                      false) {
                    return 'Enter a valid email';
                  }
                  email = value;
                  return null;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  pass = '$value';
                },
                validator: (passwordValue) {
                  if (passwordValue.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              RoundedButton(
                  text: "LOGIN",
                  press: () {
                    if (_formKey.currentState.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyHomePage(title: 'Flutter Demo Home Page')),
                      );
                    }
                  }),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}
