import 'package:decore_wallpaper/core/base_model.dart';
import 'package:decore_wallpaper/core/base_network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WallpaperNotifier extends StateNotifier<AsyncValue<PhotoResponse>> {
  WallpaperNotifier() : super(const AsyncValue.loading());

  Future fetchWallpaper(String query, int page, int limit) async {
    try {
      state = const AsyncValue.loading();
      final data = await BaseHttp.fetchData("/v1/search", queryParameter: {
        "query": query,
        "page": page.toString(),
        "per_page": limit.toString(),
      });
      // print(data);
      final resp = PhotoResponse.fromJson(data);

      state = AsyncValue.data(resp);
    } catch (e) {
      print(e.toString());
      state = const AsyncValue.error("Error Occured");
    }
  }
}

class FeaturedNotifier extends StateNotifier<AsyncValue<FeaturedResponse>> {
  FeaturedNotifier() : super(const AsyncValue.loading());

  Future fetchFeatured(int page, int limit) async {
    try {
      state = const AsyncValue.loading();
      final data =
          await BaseHttp.fetchData("/v1/collections/featured", queryParameter: {
        "page": page.toString(),
        "per_page": limit.toString(),
      });
      // print(data);
      final resp = FeaturedResponse.fromJson(data);

      state = AsyncValue.data(resp);
    } catch (e) {
      print(e.toString());
      state = const AsyncValue.error("Error Occured");
    }
  }
}
