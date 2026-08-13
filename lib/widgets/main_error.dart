import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainError extends StatelessWidget {
  final VoidCallback onTap;
  const MainError({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        spacing: 8.h,
        mainAxisAlignment: .center,
        children: [
          Text(
            'something_went_wrong'.tr(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).splashColor,
              shape: RoundedRectangleBorder(borderRadius: .circular(8)),
            ),
            onPressed: onTap,
            child: Text(
              'try_again'.tr(),
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
        ],
      ),
    );
  }
}
