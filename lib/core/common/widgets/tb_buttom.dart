import 'package:a/core/common/widgets/tb_text.dart';
import 'package:a/core/dimensions/dimension.dart';
import 'package:a/core/styles/app_colors.dart';
import 'package:a/core/styles/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TBButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  TBButton({Key? key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: Dimensions.sizeHeight(50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          gradient: AppColors.linear_1,
        ),
        child: TBText(text: title, textStyle: TextStyles.white_18_500,),
      ),
    );
  }
}
