import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_app/api/api_manager.dart';
import 'package:news_app/api/model/news_response/article.dart';

class NewsPagingProvider extends ChangeNotifier {
  final Map<String, PagingController<int, Article>> _controllers = {};

  PagingController<int, Article> controllerForSource(
    String sourceId,
    String language,
  ) {
    final key = 'source:$sourceId:$language';
    if (_controllers.containsKey(key)) return _controllers[key]!;
    final controller = PagingController<int, Article>(firstPageKey: 1);
    controller.addPageRequestListener((pageKey) {
      _fetchSourcePage(controller, sourceId, language, pageKey);
    });
    _controllers[key] = controller;
    return controller;
  }

  PagingController<int, Article> controllerForSearch(String query) {
    final key = 'search:$query';
    if (_controllers.containsKey(key)) return _controllers[key]!;
    final controller = PagingController<int, Article>(firstPageKey: 1);
    controller.addPageRequestListener((pageKey) {
      _fetchSearchPage(controller, query, pageKey);
    });
    _controllers[key] = controller;
    return controller;
  }

  Future<void> _fetchSourcePage(
    PagingController<int, Article> controller,
    String sourceId,
    String language,
    int pageKey,
  ) async {
    try {
      final response = await ApiManager.getNewsBySourceId(
        sourceId,
        language,
        pageKey,
      );
      final newItems = response.articles ?? [];
      final isLastPage =
          newItems.length < ApiManager.pageSize ||
          (response.totalResults != null &&
              pageKey * ApiManager.pageSize >= response.totalResults!);
      if (isLastPage) {
        controller.appendLastPage(newItems);
      } else {
        controller.appendPage(newItems, pageKey + 1);
      }
    } catch (error) {
      controller.error = error;
    }
  }

  Future<void> _fetchSearchPage(
    PagingController<int, Article> controller,
    String query,
    int pageKey,
  ) async {
    try {
      final response = await ApiManager.getNewsBySearch(query, pageKey);
      final newItems = response.articles ?? [];
      final isLastPage =
          newItems.length < ApiManager.pageSize ||
          (response.totalResults != null &&
              pageKey * ApiManager.pageSize >= response.totalResults!);
      if (isLastPage) {
        controller.appendLastPage(newItems);
      } else {
        controller.appendPage(newItems, pageKey + 1);
      }
    } catch (error) {
      controller.error = error;
    }
  }

  @override
  void dispose() {
    for (final c in _controllers.values) {
      c.dispose();
    }
    _controllers.clear();
    super.dispose();
  }
}
