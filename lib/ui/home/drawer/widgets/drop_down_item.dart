import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

class DropDownItem extends StatelessWidget {
  final bool isDropTheme;
  const DropDownItem({super.key, this.isDropTheme = false});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: DropdownMenu(
        key: ValueKey(context.locale.languageCode),
        trailingIcon: SvgPicture.asset(AppAssets.dropDownIcon),
        selectedTrailingIcon: SvgPicture.asset(AppAssets.dropDownIcon),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.transparent,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
        menuStyle: MenuStyle(
          minimumSize: WidgetStatePropertyAll(Size(270, 0)),
          maximumSize: const WidgetStatePropertyAll(Size(270, double.infinity)),
          backgroundColor: WidgetStatePropertyAll(AppColors.whiteColor),
          elevation: const WidgetStatePropertyAll(8),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        onSelected: (value) {
          if (isDropTheme) {
            if (value == ThemeMode.light) {
              themeProvider.changeTheme(.light);
            } else {
              themeProvider.changeTheme(.dark);
            }
          } else {
            if (value == 'en') {
              context.setLocale(Locale('en'));
            } else {
              context.setLocale(Locale('ar'));
            }
          }
          Navigator.pop(context);
        },
        width: .infinity,
        textStyle: AppStyles.bold16White,
        initialSelection: isDropTheme
            ? themeProvider.appTheme
            : context.locale.languageCode,
        dropdownMenuEntries: [
          DropdownMenuEntry(
            value: isDropTheme ? ThemeMode.light : 'en',
            label: isDropTheme ? 'light'.tr() : 'english'.tr(),
          ),
          DropdownMenuEntry(
            value: isDropTheme ? ThemeMode.dark : 'ar',
            label: isDropTheme ? 'dark'.tr() : 'arabic'.tr(),
          ),
        ],
      ),
    );
  }
}
