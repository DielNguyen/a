import 'package:a/core/common/widgets/tb_text.dart';
import 'package:a/core/dimensions/dimension.dart';
import 'package:a/core/styles/app_colors.dart';
import 'package:a/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TBHeader extends AppBar {
  final String label;
  final String? leftIcon;
  final Widget? rightWidget1;
  final Widget? rightWidget2;

  TBHeader(
      {super.key,
      required this.label,
      this.leftIcon,
      this.rightWidget1,
      this.rightWidget2})
      : super(
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(Dimensions.sizeWidth(1)),
              child: Container(
                color: AppColors.grey_15,
                height: 1.0,
                margin:
                    EdgeInsets.symmetric(horizontal: Dimensions.sizeWidth(21)),
              )),
          toolbarHeight: 60,
          leading: GestureDetector(
            onTap: () => {print('asdsad')},
            child: Padding(
              padding: EdgeInsets.only(left: Dimensions.sizeWidth(21)),
              child: Image.asset(
                leftIcon ?? Imgs.header_icon_back,
              ),
            ),
          ),
          leadingWidth: Dimensions.sizeWidth(40),
          actions: [rightWidget1 ?? SizedBox(), rightWidget2 ?? SizedBox()],
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.Netral_1,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: AppColors.Netral_1,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          elevation: 0,
          centerTitle: true,
          titleSpacing: 14,
          title: TBText(
            text: label,
            textAlign: TextAlign.center,
            textStyle: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.secondary_3),
          ),
        );
}
