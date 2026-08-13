import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/category/category_model.dart';
import 'package:news_app/api/model/source_response/source_response.dart';
import 'package:news_app/ui/home/category_details/source/source_tapbar.dart';
import 'package:news_app/widgets/main_error.dart';
import 'package:news_app/widgets/main_waiting.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryDetails({super.key, required this.categoryModel});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManager.getSources(
        widget.categoryModel.id,
        context.locale.languageCode,
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MainWaiting();
        } else if (snapshot.hasError || snapshot.data!.status != 'ok') {
          return MainError(
            onTap: () {
              ApiManager.getSources(
                widget.categoryModel.id,
                context.locale.languageCode,
              );
              setState(() {});
            },
          );
        }
        var sourcesList = snapshot.data!.sources ?? [];
        return SourceTapbar(sourceList: sourcesList);
      },
    );
  }
}
