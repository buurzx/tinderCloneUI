import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/components/text_field_container.dart';
import '/constants.dart';

class RoundedInputField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Function validator;
  final TextInputType type;
  final int maxIn;
  const RoundedInputField(
      {Key key,
      this.hintText,
      this.type,
      this.icon,
      this.onChanged,
      this.validator,
      this.maxIn})
      : super(key: key);

  @override
  _RoundedInputFieldState createState() => _RoundedInputFieldState();
}

class _RoundedInputFieldState extends State<RoundedInputField> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Container(
      child: TextFieldContainer(
        child: TextFormField(
          keyboardType: widget.type,
          maxLines: widget.maxIn,
          textInputAction: TextInputAction.next,
          onChanged: widget.onChanged,
          validator: widget.validator,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            icon: Icon(
              widget.icon,
              color: kPrimaryColor,
            ),
            hintText: widget.hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
