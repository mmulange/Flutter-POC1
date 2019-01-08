import 'package:http/http.dart' as http;
import 'package:first_project/model/User.dart';
import 'package:first_project/model/Post.dart';
import 'dart:convert';

/// NetworkUtils to do network call.
class NetworkUtils {
  ///Get data from specific url.
  Future<List<T>> getData<T>(String url) async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return parseData(response.body);
    } else {
      throw Exception('Failed to load users');
    }
  }

  /// Parsing json data with any model i.e. User, Post etc.
  List<T> parseData<T>(String responseBody) {
    final parsed = json.decode(responseBody);
    if (T == User) {
      return parsed.map<User>((json) => User.fromJson(json)).toList();
    } else if (T == Post) {
      return parsed.map<Post>((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception("Unknow type");
    }
  }
}
