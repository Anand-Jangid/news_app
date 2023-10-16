import 'package:news_app/Model/news_article.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "NewsArticles.db";
  static const _databaseVersion = 1;

  //!tables
  static const _articleTable = 'articles';

  //! columns
  static const _id = '_id';
  static const _author = 'author';
  static const _title = 'title';
  static const _description = 'description';
  static const _url = 'url';
  static const _urlToImage = 'urlToImage';
  static const _publishedAt = 'publishedAt';
  static const _content = 'content';

  late Database _db;

  Future<void> init() async {
    final documentDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentDirectory.path, _databaseName);
    _db = await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $_articleTable (
        $_id INTEGER PRIMARY KEY,
        $_author TEXT,
        $_title TEXT,
        $_description TEXT,
        $_url TEXT,
        $_urlToImage TEXT,
        $_publishedAt TEXT,
        $_content TEXT
      );
    ''');
  }

  Future<int> addArticle(Article article) async {
    try {
      int result = await _db.insert(
        _articleTable,
        article.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return result;
    } catch (error) {
      throw error;
    }
  }

  Future<List<Article>> getAllArticles() async {
    final articles = await _db.query(_articleTable);
    return List.generate(articles.length, (index) {
      return Article.fromJson(articles[index]);
    });
  }

  Future<int> deleteArticle(int id) async {
    try {
      int result =
          await _db.delete(_articleTable, where: '$_id = ?', whereArgs: [id]);
      return result;
    } catch (e) {
      throw e;
    }
  }
}
