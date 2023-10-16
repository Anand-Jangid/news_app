import 'package:news_app/Model/news_article.dart';

import '../../lib/Networking/news_api.dart';
import 'package:test/test.dart';

void main() async {
  final newsAPI = NewsAPI();
  test('Fetch all stories from internet', () async {
    final response = await newsAPI.getEveryNewsArticles();
    print(response);
    expect(response, isA<List<Article>>());
  });

  test('Fetch top headlines from internet', () async {
    final response = await newsAPI.getTopHeadlineNewsArticles();
    expect(response, isA<List<Article>>());
  });
}
