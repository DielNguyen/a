import 'package:a/core/common/widgets/tb_buttom.dart';
import 'package:a/core/common/widgets/tb_header.dart';
import 'package:a/core/common/widgets/tb_text.dart';
import 'package:a/core/common/widgets/tb_text_field.dart';
import 'package:a/core/dimensions/dimension.dart';
import 'package:a/core/styles/app_colors.dart';
import 'package:a/core/styles/styles.dart';
import 'package:a/core/widgets/dismiss_keyboard_widget.dart';
import 'package:a/resources/resources.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TBHeader(label: 'login.title'),
      body: LoginWidget(),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.Netral_1,
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 21),
        child: DismissKeyboardWidget(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.sizeHeight(32),
                      bottom: Dimensions.sizeHeight(8)),
                  child: TBText(
                    text: 'login.title',
                    textStyle: TextStyles.secondary3_32_700,
                  ),
                ),
                Container(
                  width: Dimensions.sizeWidth(250),
                  child: TBText(
                    text: 'login.content',
                    textStyle: TextStyles.secondary3_18Erode500,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  color: Colors.white,
                  child: const TBTextField(
                    hintText: 'login.hint_email_phone',
                    leftIcon: Imgs.ic_mail,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  color: Colors.white,
                  child: const TBTextField(
                    hintText: 'login.hint_password',
                    leftIcon: Imgs.ic_lock,
                    rightIcon: Imgs.ic_eye,
                  ),
                ),
                Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                        top: Dimensions.sizeHeight(12),
                        bottom: Dimensions.sizeHeight(24)),
                    child: InkWell(
                      onTap: () {},
                      child: TBText(
                        text: 'forgot_password.text',
                        textAlign: TextAlign.center,
                        textStyle: TextStyles.secondary3_16_500,
                      ),
                    )),
                Container(
                  child: TBButton(title: 'login.title'),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(
                      top: Dimensions.sizeHeight(12),
                      bottom: Dimensions.sizeHeight(12)),
                  child: TBText(
                    text: 'common.terms',
                    textStyle: TextStyles.erode_12_500,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
