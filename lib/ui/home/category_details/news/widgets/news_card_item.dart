import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/utils/app_styles.dart';

class NewsCardItem extends StatelessWidget {
  final String image;
  final String title;
  final String author;
  final String publishedAt;
  const NewsCardItem({
    super.key,
    required this.image,
    required this.title,
    required this.author,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: .symmetric(horizontal: 16.w),
      padding: .all(8.w),
      decoration: BoxDecoration(
        borderRadius: .circular(16),
        border: .all(color: Theme.of(context).splashColor, width: 1.5),
      ),
      child: Column(
        spacing: 10.h,
        crossAxisAlignment: .start,
        children: [
          ClipRRect(
            borderRadius: .circular(8),
            child: CachedNetworkImage(
              height: 220.h,
              fit: .fill,
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).splashColor,
                ),
              ),
              errorWidget: (context, url, error) =>
                  Center(child: Icon(Icons.error)),
              imageUrl: image,
            ),
          ),
          Text(title, style: Theme.of(context).textTheme.labelLarge),
          Row(
            mainAxisAlignment: .spaceBetween,
            children: [
              Expanded(
                child: Text('By : $author', style: AppStyles.medium12Grey),
              ),
              Text(time(publishedAt), style: AppStyles.medium12Grey),
            ],
          ),
        ],
      ),
    );
  }

  String time(String dateTime) {
    final date = DateTime.parse(dateTime);
    final now = DateTime.now();

    final difference = now.difference(date);

    if (difference.inSeconds < 60) {
      return 'Just now';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} days ago';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}
