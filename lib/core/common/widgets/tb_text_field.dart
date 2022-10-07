import 'package:a/core/dimensions/dimension.dart';
import 'package:a/core/styles/app_colors.dart';
import 'package:a/resources/resources.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TBTextField extends StatefulWidget {
  const TBTextField(
      {Key? key,
      this.hintText,
      this.initialText,
      this.textStyle,
      this.hintStyle,
      this.enabled,
      this.maxLine,
      this.maxLength,
      this.controller,
      this.textAlign,
      this.onChanged,
      this.textInputType,
      this.inputFormatters,
      this.focusNode,
      this.rightIcon,
      this.rightIconAction,
      this.leftIcon,
      this.leftIconAction})
      : super(key: key);

  final String? hintText;
  final String? initialText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool? enabled;
  final int? maxLine;
  final int? maxLength;
  final TextEditingController? controller;
  final TextAlign? textAlign;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final String? rightIcon;
  final Function()? rightIconAction;
  final String? leftIcon;
  final Function()? leftIconAction;

  @override
  State<TBTextField> createState() => _TBTextFieldState();
}

class _TBTextFieldState extends State<TBTextField> {
  bool _isPassword = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.controller?.dispose();
    super.dispose();
  }

  _setIsPassword() {
    setState(() {
      _isPassword = !_isPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.sizeHeight(50),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(width: 1, color: AppColors.secondary_4)),
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                widget.leftIcon != null
                    ? Container(
                        padding: EdgeInsets.only(right: 10),
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: AppColors.grey_15),
                          ),
                        ),
                        child: Image.asset(widget.leftIcon ?? '',
                            width: Dimensions.sizeWidth(20),
                            height: Dimensions.sizeHeight(20)),
                      )
                    : Container(),
                Flexible(
                    flex: 1,
                    child: TextField(
                      style: widget.textStyle ??
                          const TextStyle(
                              fontSize: 16,
                              color: AppColors.black,
                              fontWeight: FontWeight.w400),
                      textCapitalization: TextCapitalization.none,
                      obscureText: _isPassword,
                      onChanged: widget.onChanged,
                      obscuringCharacter: "*",
                      keyboardType: widget.textInputType,
                      controller: widget.controller,
                      maxLines: widget.maxLine ?? 1,
                      maxLength: widget.maxLength,
                      enabled: widget.enabled,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          hintText: widget.hintText?.tr(),
                          isDense: true,
                          hintStyle: const TextStyle(
                              fontFamily: 'Erode',
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: AppColors.grey_50
                          ),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          counterText: "",
                          errorMaxLines: 10),
                    )),
                widget.rightIcon != null
                    ? InkWell(
                        onTap: widget.rightIconAction ?? _setIsPassword,
                        child: Image.asset(widget.rightIcon ?? '',
                            width: Dimensions.sizeWidth(20),
                            height: Dimensions.sizeHeight(20)),
                      )
                    : Container()
              ],
            ),
          )),
    );
  }
}
