import 'dart:convert';

class ItemModel {

  final int id;
  final bool deleted;
  final String type;
  final String by;
  final int time;
  final String text;
  final bool dead;
  final int parent;
  final List<dynamic> kids;
  final String url;
  final int score;
  final String title;
  final int descendants;

   ItemModel.fromJson(Map<String,dynamic> parsedJason)
      :id = parsedJason['id'],
      deleted =parsedJason['deleted'],
      type =parsedJason['type'],
      by =parsedJason['by'],
      time =parsedJason['time'],
      text =parsedJason['text'],
      dead =parsedJason['dead'],
      parent =parsedJason['parent'],
      kids =parsedJason['kids'],
      url =parsedJason['url'],
      score =parsedJason['score'],
      title =parsedJason['title'],
      descendants =parsedJason['descendants'];

  ItemModel.fromDb(Map<String,dynamic> parsedJason)
      :id = parsedJason['id'],
        deleted =parsedJason['deleted'] == 1,
        type =parsedJason['type'],
        by =parsedJason['by'],
        time =parsedJason['time'],
        text =parsedJason['text'],
        dead =parsedJason['dead'] == 1,
        parent =parsedJason['parent'],
        kids =jsonDecode(parsedJason['kids']),
        url =parsedJason['url'],
        score =parsedJason['score'],
        title =parsedJason['title'],
        descendants =parsedJason['descendants'];
       

}