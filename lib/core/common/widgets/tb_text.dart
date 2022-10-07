import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TBText extends Text {
  final String text;
  final TextStyle? textStyle;
  final TextAlign? textAlign;

  TBText({Key? key, required this.text, this.textStyle = null, this.textAlign = null}) : super('');

  @override
  Widget build(BuildContext context) {
    return Text(text.tr(), textAlign: textAlign, style: textStyle,);
  }
}
