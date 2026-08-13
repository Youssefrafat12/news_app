import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/api/model/news_response/article.dart';
import 'package:news_app/ui/home/category_details/news/news_details/widgets/custom_button.dart';
import 'package:news_app/ui/home/category_details/news/news_details/widgets/news_web_view.dart';
import 'package:news_app/widgets/main_waiting.dart';

class NewsDetails extends StatelessWidget {
  final Article article;
  const NewsDetails({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: .symmetric(horizontal: 16.w, vertical: 22.h),
      decoration: BoxDecoration(
        borderRadius: .circular(16),
        color: Theme.of(context).splashColor,
      ),
      child: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          mainAxisSize: .min,
          crossAxisAlignment: .stretch,
          spacing: 8.h,
          children: [
            ClipRRect(
              borderRadius: .circular(8),
              child: CachedNetworkImage(
                height: 220.h,
                fit: .fill,
                placeholder: (context, url) => MainWaiting(),
                errorWidget: (context, url, error) => Icon(Icons.error),
                imageUrl: article.urlToImage!,
              ),
            ),
            Text(
              article.content!,
              style: Theme.of(
                context,
              ).textTheme.titleSmall!.copyWith(height: 1.6, letterSpacing: 1),
            ),
            CustomButton(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NewsWebView(url: article.url!);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
