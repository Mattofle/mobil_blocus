import 'package:flutter/cupertino.dart';

import '../models/article.dart';

class ArticleViewModel extends ChangeNotifier {
  var _articles = <Article>[];
  bool _showRead = false;

  List<Article> get articles => _articles;
  bool get showRead => _showRead;

  void addArticle(Article article) {
    _articles.add(article);
    notifyListeners();
  }

  void removeArticle(Article article) {
    _articles.remove(article);
    notifyListeners();
  }

  Article? getArticleById(int id) {
    return _articles.firstWhere((element) => element.id == id);
  }

  void toggleShowRead() {
    _showRead = !_showRead;
    notifyListeners();
  }

  void markAsReadOrUnread(int id) {
    var article = getArticleById(id);
    article?.read = !article.read;
    notifyListeners();
  }


}