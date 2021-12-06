import 'dart:convert';

import 'package:library_roobin/models/doc.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<bool> setup() async {
    return Future.delayed(const Duration(
      seconds: 10,
    )).then((onValue) => true);
  }

  Future<List<Doc>> getBooksTittle(String namebook) async {
    final url =
        'https://openlibrary-org.translate.goog/search.json?title=$namebook&page=1';
    final response = await http.get(
      Uri.parse(url),
    );
    final List<dynamic> decodeData = json.decode(response.body)['docs'];

    final collectionbooks = decodeData
        .map(
          (d) => Doc.fromJson(d),
        )
        .toList();

    return collectionbooks;
  }

  Future<List<Doc>> getBooksAuthor(String nameauthor) async {
    final url =
        'https://openlibrary-org.translate.goog/search.json?author=$nameauthor&page=1';
    final response = await http.get(
      Uri.parse(url),
    );
    final List<dynamic> decodeData = json.decode(response.body)['docs'];

    final collectionbooks = decodeData
        .map(
          (d) => Doc.fromJson(d),
        )
        .toList();

    return collectionbooks;
  }
}
