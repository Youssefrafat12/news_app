import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/api/model/category/category_model.dart';
import 'package:news_app/ui/home/category_details/category_details.dart';
import 'package:news_app/ui/home/category_fragment/category_fragment.dart';
import 'package:news_app/ui/home/drawer/drawer_body.dart';
import 'package:news_app/ui/home/search/search_body.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String searchText = '';
  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: AppColors.blackColor,
        child: DrawerBody(
          onTap: () {
            selectedCategory = null;
            setState(() {});
            Navigator.pop(context);
          },
        ),
      ),
      appBar: isSearch
          ? null
          : AppBar(
              title: Text(
                selectedCategory == null
                    ? 'home'.tr()
                    : selectedCategory!.title.tr(),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              actions: [
                Padding(
                  padding: EdgeInsetsDirectional.only(end: 16.w),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isSearch = true;
                      });
                    },
                    child: SvgPicture.asset(
                      AppAssets.searchIcon,
                      colorFilter: ColorFilter.mode(
                        Theme.of(context).splashColor,
                        .srcIn,
                      ),
                    ),
                  ),
                ),
              ],
            ),
      body: isSearch
          ? SearchBody(
              searchText: searchText,
              onChanged: (value) {
                searchText = value;
                setState(() {});
              },
              onCancelClick: () {
                isSearch = false;
                searchText = '';
                setState(() {});
              },
            )
          : selectedCategory == null
          ? CategoryFragment(onCategoryClick: onCatedgoryItemClick)
          : CategoryDetails(categoryModel: selectedCategory!),
    );
  }

  CategoryModel? selectedCategory;

  void onCatedgoryItemClick(CategoryModel newCategory) {
    selectedCategory = newCategory;
    setState(() {});
  }
}
