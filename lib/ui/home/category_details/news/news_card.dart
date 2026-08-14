import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/model/news_response/article.dart';
import 'package:news_app/api/model/source_response/source.dart';
import 'package:news_app/ui/home/category_details/news/news_details/news_details.dart';
import 'package:news_app/ui/home/category_details/news/widgets/news_card_item.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/widgets/main_error.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:news_app/providers/news_paging_provider.dart';

class NewsCard extends StatefulWidget {
  final Source source;

  const NewsCard({super.key, required this.source});

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsPagingProvider>(context, listen: false);
    final controller = provider.controllerForSource(
      widget.source.id ?? '',
      context.locale.languageCode,
    );
    return PagedListView<int, Article>.separated(
      pagingController: controller,
      separatorBuilder: (context, index) => SizedBox(height: 16.h),
      builderDelegate: PagedChildBuilderDelegate<Article>(
        itemBuilder: (context, item, index) => InkWell(
          overlayColor: WidgetStatePropertyAll(AppColors.transparentColor),
          onTap: () => showBottomSheet(context, item),
          child: NewsCardItem(
            image: item.urlToImage ?? '',
            title: item.title ?? '',
            author: item.author ?? 'Unknown',
            publishedAt: item.publishedAt ?? '',
          ),
        ),
        firstPageErrorIndicatorBuilder: (context) =>
            MainError(onTap: () => controller.refresh()),
        noItemsFoundIndicatorBuilder: (context) => Center(
          child: Text(
            'no_news_found'.tr(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        newPageErrorIndicatorBuilder: (context) => ElevatedButton(
          onPressed: () => controller.retryLastFailedRequest(),
          child: Text('retry'.tr()),
        ),
      ),
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
