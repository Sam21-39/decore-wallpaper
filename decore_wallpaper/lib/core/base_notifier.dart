import 'dart:convert';

import 'package:decore_wallpaper/core/base_model.dart';
import 'package:decore_wallpaper/core/base_network.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WallpaperNotifier extends StateNotifier<AsyncValue<List<PhotoModel>>> {
  WallpaperNotifier() : super(const AsyncValue.data(<PhotoModel>[]));

  Future fetchWallpaper(String query, int page, int limit) async {
    try {
      state = const AsyncValue.loading();
      final data = await BaseHttp.fetchData("/v1/search", queryParameter: {
        "query": query,
        "page": page,
        "per_page": limit,
      });
      final resp = BaseResponse.fromJson(jsonDecode(data));
      if (resp is List<PhotoModel>) {
        print(resp);
        state = AsyncValue.data(resp as List<PhotoModel>);
      } else {
        state = const AsyncValue.error("Error Occured");
      }
    } catch (e) {
      print(e.toString());
      state = const AsyncValue.error("Error Occured");
    }
  }
}
