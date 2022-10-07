import 'package:a/resources/resources.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../dimensions/dimension.dart';

class TBRightAppBarWidget extends StatelessWidget {
  final String image;
  final Action? action;

  TBRightAppBarWidget({Key? key, required this.image, this.action, });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => action ?? {},
      child: Padding(
        padding:
        EdgeInsets.only(right: Dimensions.sizeWidth(21)),
        child: Image.asset(
          image,
          width: 22,
          fit: BoxFit.contain,
        ),
      ),
    );
  }

}
