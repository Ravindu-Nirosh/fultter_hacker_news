import 'dart:convert';
import 'package:http/http.dart' show Client;
import '../models/items_models.dart';


const _root ='https://hacker-news.firebaseio.com/v0';

class NewsApiProvider {
  Client client =Client();


  fetchTopIds() async {
    final response = await client.get(Uri.parse('$_root/topstories.json'));
    final ids = jsonDecode(response.body);
    
    return ids;
  }

  fetchItems(int id) async{
    final response = await client.get(Uri.parse('$_root/item/$id.json'));
    final parsedJson =jsonDecode(response.body);

    return ItemModel.fromJson(parsedJson);
  }
}