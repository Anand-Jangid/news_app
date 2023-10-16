import 'package:flutter/material.dart';
import 'package:test/test.dart';
import '../../lib/Database/database_helper.dart';
import 'package:news_app/Model/news_article.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper db = DatabaseHelper();
  await db.init();

  test('Adding an artice', () async {
    Article article = Article(
        // source: Source(name: "name", id: "id"),
        title: "title",
        url: "url",
        publishedAt: "publishedAt",
        author: "author",
        description: "description",
        urlToImage: "urlToImage",
        content: "content");

    final response = await db.addArticle(article);
    print(response);
    expect(response, 1);
  });
}
