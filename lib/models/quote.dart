import 'dart:convert';

class Quote {
  final String text;
  final String author;

  Quote(this.text, this.author);

  Quote._fromMap(Map<String, dynamic> map) : text = map['q'], author = map['a'];

  factory Quote.fromJSON(String quoteJSON) {
    final List jsonList = json.decode(quoteJSON);
    final quoteMap = jsonList.first;
    return Quote._fromMap(quoteMap);
  }
}
