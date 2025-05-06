import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:note_app/Api/api.dart';

class HomeController extends GetxController {
  var posts = <Map<String, dynamic>>[].obs;
  var isLoading = true.obs;
  var isFetchingMore = false.obs;
  int page = 0;
  final int limit = 10;

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  Future<void> fetchPosts() async {
    try {
      if (page == 0) isLoading.value = true;

      // Dynamically constructing the URL using query parameters
      final url = Uri.parse(
        '${ApiConstants.home}?limit=$limit&skip=${page * limit}',
      );

      final response = await http.get(url);

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final List postsList = jsonData['posts'];
        posts.addAll(postsList.cast<Map<String, dynamic>>());
        page++;
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
      isFetchingMore.value = false;
    }
  }

  void loadMore() {
    if (!isFetchingMore.value) {
      isFetchingMore.value = true;
      fetchPosts();
    }
  }
}
