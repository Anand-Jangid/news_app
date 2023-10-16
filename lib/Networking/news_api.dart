import 'package:dio/dio.dart';
import 'package:news_app/Constants/exceptions.dart';
import 'package:news_app/Model/news_article.dart';

class NewsAPI {
  final dio = Dio();

  Future<List<Article>> getEveryNewsArticles() async {
    try {
      Response response = await dio.get("https://newsapi.org/v2/everything",
          queryParameters: {
            'q': 'india',
            'apiKey': '8ce47e357f4d47b391f0848f801303bd'
          });
      if (response.statusCode == 200) {
        final newsArticles = NewsArticles.fromJson(response.data);
        return newsArticles.articles;
      } else {
        throw Exception('Failed to load News Article');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NetworkException("Check your internet connection");
      } else {
        rethrow;
      }
    }
  }

  Future<List<Article>> getTopHeadlineNewsArticles() async {
    try{
      Response response = await dio.get("https://newsapi.org/v2/top-headlines",
          queryParameters: {
            'country': 'us',
            'apiKey': '8ce47e357f4d47b391f0848f801303bd'
          });
      if (response.statusCode == 200) {
        final newsArticle = NewsArticles.fromJson(response.data);
        return newsArticle.articles;
      } else {
        throw Exception('Failed to load News Article');
      }
    }on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw NetworkException("Check your internet connection");
      } else {
        rethrow;
      }
    }
  }
}
