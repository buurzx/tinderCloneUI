import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/components/text_field_container.dart';
import '/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Function validator;
  final int maxIn;
  const RoundedInputField(
      {Key key,
      this.hintText,
      this.icon,
      this.onChanged,
      this.validator,
      this.maxIn = 200})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        maxLines: maxIn,
        textInputAction: TextInputAction.next,
        onChanged: onChanged,
        validator: validator,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
