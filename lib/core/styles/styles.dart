import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

class TextStyles {
  // none
  static const secondary3_32_700 = TextStyle(
    fontSize: 32,
    color: AppColors.secondary_3,
    fontWeight: FontWeight.w500,
  );
  static const secondary3_16_500 = TextStyle(
    fontSize: 16,
    color: AppColors.secondary_3,
    fontWeight: FontWeight.w500,
  );
  static const white_18_500 = TextStyle(
    fontSize: 16,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );

  // Erode
  static const secondary3_18Erode500 = TextStyle(
    fontSize: 18,
    fontFamily: 'Erode',
    color: AppColors.secondary_3,
    fontWeight: FontWeight.w500,
  );
  static const secondary3_16Erode500 = TextStyle(
    fontSize: 16,
    fontFamily: 'Erode',
    color: AppColors.secondary_3,
    fontWeight: FontWeight.w500,
  );

  static const erode_12_500 = TextStyle(
    fontSize: 12,
    fontFamily: 'Erode',
    color: AppColors.OBS_01,
    fontWeight: FontWeight.w500,
  );

  static const white24Erode500 = TextStyle(fontSize: 24, color: AppColors.white);
  static const w400White16 = TextStyle(
      fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w400);

  static const w600WhiteSize16 = TextStyle(
      fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w600);
  static const w700WhiteSize16 = TextStyle(
      fontSize: 16, color: AppColors.white, fontWeight: FontWeight.w700);
  static const w700WhiteSize18 = TextStyle(
      fontSize: 18, color: AppColors.white, fontWeight: FontWeight.w700);

  static const w700WhiteSize24 = TextStyle(
      fontSize: 24, color: AppColors.white, fontWeight: FontWeight.w700);
  static const black10 = TextStyle(fontSize: 10, color: AppColors.black);
  static const black12 = TextStyle(fontSize: 12, color: AppColors.black);
  static const black13 = TextStyle(fontSize: 13, color: AppColors.black);
  static const black16 = TextStyle(fontSize: 16, color: AppColors.black);
  static const black20 = TextStyle(fontSize: 20, color: AppColors.black);
  static const bold40black = TextStyle(
      fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.black);
  static const bold32black = TextStyle(
      fontSize: 32, fontWeight: FontWeight.bold, color: AppColors.black);
  static const bold28black = TextStyle(
      fontSize: 28, fontWeight: FontWeight.bold, color: AppColors.black);
  static const bold24black = TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.black);
  static const bold20black = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.black);
  static const bold15black = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.black);
  static const bold32blackItalic = TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
      fontStyle: FontStyle.italic);
  static const bold24blackItalic = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
      fontStyle: FontStyle.italic);
  static const bold16blackItalic = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
      fontStyle: FontStyle.italic);
  static const black16Italic = TextStyle(
      fontSize: 16, color: AppColors.black, fontStyle: FontStyle.italic);
  static const black10Bold = TextStyle(
      fontSize: 10, color: AppColors.black, fontWeight: FontWeight.bold);
  static const black15Italic = TextStyle(
      fontSize: 15, color: AppColors.black, fontStyle: FontStyle.italic);
  static const white12 = TextStyle(fontSize: 12, color: AppColors.white);
  static const white10 = TextStyle(fontSize: 10, color: AppColors.white);
  static const white12Underline = TextStyle(
    fontSize: 12,
    color: AppColors.white,
    decoration: TextDecoration.underline,
  );
  static const white14 = TextStyle(fontSize: 14, color: AppColors.white);
  static const w400White14 = TextStyle(
      fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w400);
  static const white14W700 = TextStyle(
      fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w700);
  static TextStyle white14WithOpacity =
  TextStyle(fontSize: 14, color: AppColors.white.withOpacity(0.2));
  static const white16 = TextStyle(fontSize: 16, color: AppColors.white);
  static const white16500 = TextStyle(
    fontSize: 16,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
    height: 24 / 16,
  );
  static const white18 = TextStyle(fontSize: 18, color: AppColors.white);
  static const white18W700 = TextStyle(
      fontSize: 18, color: AppColors.white, fontWeight: FontWeight.w700);
  static const boldWhite18 = TextStyle(
      fontSize: 18, color: AppColors.white, fontWeight: FontWeight.w700);
  static const white22Italic = TextStyle(
      fontSize: 22, color: AppColors.white, fontStyle: FontStyle.italic);
  static const bold30White = TextStyle(
      fontSize: 30, color: AppColors.white, fontWeight: FontWeight.w700);
  static const bold18White = TextStyle(
      fontSize: 18, color: AppColors.white, fontWeight: FontWeight.w700);
  static const bold14White = TextStyle(
      fontSize: 14, color: AppColors.white, fontWeight: FontWeight.w700);
  static const bold12Blue = TextStyle(
      fontSize: 12, color: AppColors.blue, fontWeight: FontWeight.w700);
  static const bold14Blue = TextStyle(
      fontSize: 14, color: AppColors.blue, fontWeight: FontWeight.w700);
  static const bold16Blue = TextStyle(
      fontSize: 16, color: AppColors.blue, fontWeight: FontWeight.w700);
  static const bold18Blue = TextStyle(
      fontSize: 18, color: AppColors.blue, fontWeight: FontWeight.w700);
  static const bold24Blue = TextStyle(
      fontSize: 24, color: AppColors.blue, fontWeight: FontWeight.w700);
  static const blue12 = TextStyle(fontSize: 14, color: AppColors.blue);
  static const blue12W700 = TextStyle(
      fontSize: 14, color: AppColors.blue, fontWeight: FontWeight.bold);
  static final blue14 = TextStyle(fontSize: 14.sp, color: AppColors.blue);
  static final idBed = TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500);
  static const blue14W700 = TextStyle(
      fontSize: 14, color: AppColors.blue, fontWeight: FontWeight.w700);
  static const blue16 = TextStyle(fontSize: 16, color: AppColors.blue);
  static const blue16W700 = TextStyle(
      fontSize: 16, color: AppColors.blue, fontWeight: FontWeight.w700);
  static const white32Italic = TextStyle(
      fontSize: 32, color: AppColors.white, fontStyle: FontStyle.italic);
}
