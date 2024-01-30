import 'package:dio/dio.dart';

class UnsplashRepository {
  final String _baseUrl = 'https://api.unsplash.com';
  final String _accessKey = 'GnxdpEeGkM4DBRzUWQxeQb4sYQWLtfUHeyXfhb03aXA';

  Future<List<String>> fetchImages() async {
    final response = await Dio().get(
      '$_baseUrl/photos/random?count=30',
      options: Options(
        headers: {
          'Authorization': 'Client-ID $_accessKey',
        },
      ),
      // Add any necessary query parameters here, like 'page' and 'per_page'
      // to implement pagination.
      // 'page': page.toString(),
      // 'per_page': perPage.toString(),
    );

    List<String> images = [];

    if (response.statusCode == 200) {
      for (var i = 0; i < (response.data as List).length; i++) {
        images.add(response.data[i]['urls']['regular']);
      }
      return images;
    } else {
      throw Exception('Failed to load images');
    }
  }
}