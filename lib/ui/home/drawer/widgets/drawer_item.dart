import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/utils/app_styles.dart';

class DrawerItem extends StatelessWidget {
  final String imageIcon;
  final String title;
  const DrawerItem({super.key, required this.imageIcon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      child: Row(
        spacing: 6.w,
        children: [
          SvgPicture.asset(imageIcon),
          Text(title, style: AppStyles.bold20White),
        ],
      ),
    );
  }
}
