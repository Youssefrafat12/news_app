import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/api/model/category/category_model.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  const CategoryItem({
    super.key,
    required this.categoryModel,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    bool isEven = index % 2 == 0;
    return Container(
      height: 198.h,
      width: .infinity,
      decoration: BoxDecoration(
        borderRadius: .circular(24),
        image: DecorationImage(
          image: AssetImage(
            themeProvider.appTheme == .dark
                ? categoryModel.darkImage
                : categoryModel.lightImage,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          textDirection: .ltr,
          mainAxisAlignment: .spaceEvenly,
          crossAxisAlignment: isEven ? .end : .start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                start: !isEven ? 12.w : 0,
                end: isEven ? 12.w : 0,
              ),
              child: Text(
                capitalize(categoryModel.title.tr()),
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Container(
              padding: .directional(
                start: context.locale.languageCode == 'en'
                    ? isEven
                          ? 16.w
                          : 0
                    : !isEven
                    ? 16.w
                    : 0,
                end: context.locale.languageCode == 'ar'
                    ? isEven
                          ? 16.w
                          : 0
                    : !isEven
                    ? 16.w
                    : 0,
              ),
              decoration: BoxDecoration(
                borderRadius: .circular(84),
                color: AppColors.greyColor,
              ),
              child: Row(
                textDirection: isEven ? .ltr : .rtl,
                mainAxisSize: .min,
                spacing: 10.w,
                children: [
                  Text(
                    'view_all'.tr(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Theme.of(context).primaryColor,
                    child: SvgPicture.asset(
                      isEven
                          ? AppAssets.arrowForwardLightIcon
                          : AppAssets.arrowBackLightIcon,
                      width: 28.w,
                      height: 28.h,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).splashColor,
                        .srcIn,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String capitalize(String text) {
    return text[0].toUpperCase() + text.substring(1);
  }
}
