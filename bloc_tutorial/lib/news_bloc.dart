import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:bloc_tutorial/models/news_model.dart';

import 'credentials/constants.dart';

enum NewsAction { fetch, delete }

class NewsBloc {
  final _stateStreamController = StreamController<List<Articles>>();
  StreamSink<List<Articles>> get _newsSink => _stateStreamController.sink;
  Stream<List<Articles>> get newsStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<NewsAction>();
  StreamSink<NewsAction> get eventSink => _eventStreamController.sink;
  Stream<NewsAction> get _eventStream => _eventStreamController.stream;

  NewsBloc() {
    _eventStream.listen((event) async {
      if (event == NewsAction.fetch) {
        try {
          var news = await getNews();
          _newsSink.add(news.articles);
        } catch (e) {
          _newsSink.addError("something went wrong");
          print(e.toString());
        }
      } else if (event == NewsAction.delete) {}
    });
  }

  Future<NewsModel> getNews() async {
    var client = http.Client();
    var newsUrl = Uri.parse(
        "https://newsapi.org/v2/everything?domains=wsj.com&apiKey=$kAPIkey");
    var newsModel;

    var response = await client.get(newsUrl);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      newsModel = NewsModel.fromJson(jsonMap);
    }
    return newsModel;
  }

  void dispose() {
    _eventStreamController.close();
    _stateStreamController.close();
  }
}
