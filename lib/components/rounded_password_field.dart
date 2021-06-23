import 'package:flutter/material.dart';
import '/components/text_field_container.dart';
import '/constants.dart';


class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final Function validator;
  RoundedPasswordField({
    Key key,
    this.onChanged,
    this.validator
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  final TextEditingController _passwordField = TextEditingController();
bool _hidePassword = true;
  void _toggle() {
    setState(() {
      _hidePassword = !_hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        controller: _passwordField,
        obscureText: _hidePassword,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
              icon: Icon(
                Icons.visibility,
                color: kPrimaryColor,
              ),
              onPressed: _toggle,
          ),
          border: InputBorder.none,
        ),
        validator: widget.validator,
      ),
    );
  }
}

