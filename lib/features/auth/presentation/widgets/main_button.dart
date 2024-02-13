

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/theme/widget_themes/text_theme.dart';

class MainButton extends StatelessWidget {
 const  MainButton({super.key, this.onPressed,  this.color= AppColor.primary,  this.title=''});
 final void Function()? onPressed;
 final Color color;
 final String title;

  @override
  Widget build(BuildContext context) {
    Color colorText=AppColor.light;

    if(color.value== AppColor.light.value) {
      colorText=AppColor.primary;
    }else{
      colorText=AppColor.light;

    }

    print(AppColor.light);
    print(AppColor.primary);
    print(colorText);
    print('--------------');
    return    MaterialButton(
      onPressed: onPressed,
      height: 52.h,
      minWidth: double.infinity.w,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color:  color,

      child:  Text(title,
          style:  TTextTheme.headlineSmall?.copyWith(color: colorText)),
    );
  }
}
