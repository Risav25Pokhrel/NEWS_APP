import 'package:dio/dio.dart';
import 'package:news_app/model/news_model.dart';

Future<newsdecode?> news(String newsurl) async {
  try {
    final response = await Dio().get(newsurl);
    if (response.statusCode == 200) {
      return newsdecode.fromJson(response.data);
    } else {}
  } catch (e) {
    print(e.toString());
    return null;
  }
  return null;
}
