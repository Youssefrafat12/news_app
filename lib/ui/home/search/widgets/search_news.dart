import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/news_response/article.dart';
import 'package:news_app/api/model/news_response/news_response.dart';
import 'package:news_app/ui/home/category_details/news/news_details/news_details.dart';
import 'package:news_app/ui/home/category_details/news/widgets/news_card_item.dart';
import 'package:news_app/ui/home/category_details/news/widgets/page_item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/widgets/main_error.dart';
import 'package:news_app/widgets/main_waiting.dart';
// unused imports removed

class SearchNews extends StatefulWidget {
  final String searchText;

  const SearchNews({super.key, required this.searchText});

  @override
  State<SearchNews> createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {
  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    if (widget.searchText.isEmpty) return SizedBox();
    return FutureBuilder<NewsResponse>(
      future: ApiManager.getNewsBySearch(widget.searchText, currentPage),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Expanded(child: MainWaiting());
        } else if (snapshot.hasError) {
          return MainError(
            onTap: () {
              setState(() {});
            },
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return newsList.isEmpty
            ? Expanded(
                child: Center(
                  child: Text(
                    'no_news_matching_found'.tr(),
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              )
            : Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 16.h),
                  itemCount: newsList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == newsList.length) {
                      return Row(
                        spacing: 6.w,
                        mainAxisAlignment: .center,
                        children: [
                          PageItem(
                            isSelected: currentPage == 1,
                            page: 1,
                            onTap: () {
                              currentPage = 1;
                              setState(() {});
                            },
                          ),
                          PageItem(
                            isSelected: currentPage == 2,
                            page: 2,
                            onTap: () {
                              currentPage = 2;
                              setState(() {});
                            },
                          ),
                          PageItem(
                            isSelected: currentPage == 3,
                            page: 3,
                            onTap: () {
                              currentPage = 3;
                              setState(() {});
                            },
                          ),
                          PageItem(
                            isSelected: currentPage == 4,
                            page: 4,
                            onTap: () {
                              currentPage = 4;
                              setState(() {});
                            },
                          ),
                          PageItem(
                            isSelected: currentPage == 5,
                            page: 5,
                            onTap: () {
                              currentPage = 5;
                              setState(() {});
                            },
                          ),
                        ],
                      );
                    }
                    return InkWell(
                      overlayColor: WidgetStatePropertyAll(
                        AppColors.transparentColor,
                      ),
                      onTap: () {
                        showBottomSheet(context, newsList[index]);
                      },
                      child: NewsCardItem(
                        image: newsList[index].urlToImage ?? '',
                        title: newsList[index].title ?? '',
                        author: newsList[index].author ?? 'Unknown',
                        publishedAt: newsList[index].publishedAt ?? '',
                      ),
                    );
                  },
                ),
              );
      },
    );
  }

  void showBottomSheet(BuildContext context, Article article) {
    showModalBottomSheet(
      backgroundColor: AppColors.transparentColor,
      context: context,
      builder: (context) => NewsDetails(article: article),
    );
  }
}

