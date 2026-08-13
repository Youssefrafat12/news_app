import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageItem extends StatelessWidget {
  final int page;
  final bool isSelected;
  final VoidCallback onTap;
  const PageItem({
    super.key,
    required this.page,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: .center,
        padding: .symmetric(vertical: 4.h, horizontal: isSelected ? 10.w : 8.w),
        decoration: BoxDecoration(
          borderRadius: .circular(8),
          border: isSelected
              ? null
              : .all(color: Theme.of(context).splashColor),
          color: isSelected
              ? Theme.of(context).splashColor
              : Theme.of(context).primaryColor,
        ),
        child: Text(
          page.toString(),
          style: isSelected
              ? Theme.of(context).textTheme.titleSmall
              : Theme.of(context).textTheme.labelMedium,
        ),
      ),
    );
  }
}
