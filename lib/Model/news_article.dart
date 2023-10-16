import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewsArticles {
  String status;
  int totalResults;
  List<Article> articles;

  NewsArticles({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory NewsArticles.fromJson(Map<String, dynamic> json) {
    return NewsArticles(
        status: json['status'],
        totalResults: json['totalResults'],
        articles: (json["articles"] as List)
            .map((e) => Article.fromJson(e))
            .toList());
  }

  @override
  String toString() => 'NewsArticles(status: $status, totalResults: $totalResults, articles: $articles)';
}

class Article {
  String? author;
  String title;
  String? description;
  String url;
  String? urlToImage;
  String publishedAt;
  String? content;

  Article({
    this.author,
    required this.title,
    this.description,
    required this.url,
    this.urlToImage,
    required this.publishedAt,
    this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
        author: json['author'] ?? "null",
        title: json["title"],
        description: json["description"] ?? "null",
        url: json["url"],
        urlToImage: json["urlToImage"] ?? "null",
        publishedAt: json["publishedAt"],
        content: json["content"] ?? "null");
  }

  @override
  String toString() {
    return 'Article(author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt,
      'content': content,
    };
  }


}

class Source {
  String? id;
  String name;

  Source({
    this.id,
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(id: json["id"] ?? "null", name: json["name"]);
  }

  @override
  String toString() => 'Source(id: $id, name: $name)';
}

