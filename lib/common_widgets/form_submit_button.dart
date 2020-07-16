import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mandala/common_widgets/custom_raised_button.dart';

class FormSubmitButton extends CustomRaisedButton {
  FormSubmitButton({
    @required String text,
    VoidCallback onPressed,
}) : super(
    child: Text(
      text,
      style: TextStyle(color: Colors.orange, fontSize: 20.0),
    ),
    height: 44.0,
    color: Colors.black,
    borderRadius: 4.0,
    onPressed: onPressed,
  );
}