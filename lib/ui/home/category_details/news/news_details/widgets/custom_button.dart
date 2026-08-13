import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  const CustomButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        padding: .symmetric(vertical: 16.h),
        shape: RoundedRectangleBorder(borderRadius: .circular(16)),
      ),
      onPressed: onTap,
      child: Text(
        'view_full_articel'.tr(),
        style: Theme.of(context).textTheme.displaySmall,
      ),
    );
  }
}
