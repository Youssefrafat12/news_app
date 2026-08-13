import 'package:news_app/utils/app_assets.dart';

class CategoryModel {
  String id;
  String lightImage;
  String darkImage;
  String title;

  CategoryModel({
    required this.id,
    required this.lightImage,
    required this.darkImage,
    required this.title,
  });

  static List<CategoryModel> getCategoryList() {
    return [
      CategoryModel(
        id: 'general',
        title: 'general',
        lightImage: AppAssets.generalLightImage,
        darkImage: AppAssets.generalDarkImage,
      ),
      CategoryModel(
        id: 'business',
        title: 'business',
        lightImage: AppAssets.businessLightImage,
        darkImage: AppAssets.businessDarkImage,
      ),
      CategoryModel(
        id: 'sports',
        title: 'sports',
        lightImage: AppAssets.sportsLightImage,
        darkImage: AppAssets.sportsDarkImage,
      ),
      CategoryModel(
        id: 'technology',
        title: 'technology',
        lightImage: AppAssets.technologyLightImage,
        darkImage: AppAssets.technologyDarkImage,
      ),
      CategoryModel(
        id: 'entertainment',
        title: 'entertainment',
        lightImage: AppAssets.entertainmentLightImage,
        darkImage: AppAssets.entertainmentDarkImage,
      ),
      CategoryModel(
        id: 'health',
        title: 'health',
        lightImage: AppAssets.healthLightImage,
        darkImage: AppAssets.healthDarkImage,
      ),
      CategoryModel(
        id: 'science',
        title: 'science',
        lightImage: AppAssets.scienceLightImage,
        darkImage: AppAssets.scienceDarkImage,
      ),
    ];
  }
}
