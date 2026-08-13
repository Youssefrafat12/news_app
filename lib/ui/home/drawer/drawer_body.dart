import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/ui/home/drawer/widgets/divider_item.dart';
import 'package:news_app/ui/home/drawer/widgets/drawer_item.dart';
import 'package:news_app/ui/home/drawer/widgets/drop_down_item.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class DrawerBody extends StatelessWidget {
  final VoidCallback onTap;
  const DrawerBody({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 166.h,
          alignment: .center,
          color: AppColors.whiteColor,
          child: Text('news_app'.tr(), style: AppStyles.bold24Black),
        ),
        SizedBox(height: 16.h),
        InkWell(
          overlayColor: WidgetStatePropertyAll(AppColors.transparentColor),
          onTap: onTap,
          child: DrawerItem(
            imageIcon: AppAssets.homeIcon,
            title: 'go_to_home'.tr(),
          ),
        ),
        DividerItem(),
        DrawerItem(imageIcon: AppAssets.themeIcon, title: 'theme'.tr()),
        SizedBox(height: 8.h),
        DropDownItem(isDropTheme: true),
        DividerItem(),
        DrawerItem(imageIcon: AppAssets.languageIcon, title: 'language'.tr()),
        SizedBox(height: 8.h),
        DropDownItem(),
      ],
    );
  }
}
