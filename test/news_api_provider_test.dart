import 'package:newsapp/src/resources/news_api_provider.dart';
import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main(){
  test('Fetch top ids',() async{
    final newsapi=NewsApiProvider();

    newsapi.client = MockClient((request) async{
      return Response(json.encode([1,2,3,4]),200);
    });

    final ids = await newsapi.fetchTopIds();

    expect(ids, [1,2,3,4]);

  });

}