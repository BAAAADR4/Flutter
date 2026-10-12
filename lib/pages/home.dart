import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:x_clone_ec/models/quote.dart';
import 'package:x_clone_ec/models/tweet.dart';
import 'package:x_clone_ec/pages/tweet_tile.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:x_clone_ec/settings_persistence.dart';

import 'dart:convert';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Quote quote = Quote('', '');

  final _settings = SettingsPersistence();
  final List<Color> _colors = [
    Colors.black,
    const Color(0xFF0D1B2A),
    const Color(0xFF1B1B3A),
  ];
  int _colorIndex = 0;

  Future<Quote> fetchQuote() async {
    try {
      final url = Uri.parse('https://dummyjson.com/quotes/random');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return Quote(data['quote'], data['author']);
      } else {
        return Quote('Erreur de récupération', '');
      }
    } catch (e) {
      return Quote('Erreur : $e', '');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchQuote().then((value) {
      setState(() {
        quote = value;
      });
    });
    _settings.loadColorIndex().then((i) {
      setState(() {
        _colorIndex = i;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: _colors[_colorIndex],
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/avatar.jpg'),
            ),
          ),
          title: Image.asset('assets/x-logo.png', height: 30),
          backgroundColor: _colors[_colorIndex],
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.palette, color: Colors.white),
              onPressed: () {
                final next = (_colorIndex + 1) % _colors.length;
                setState(() {
                  _colorIndex = next;
                });
                _settings.saveColorIndex(next);
              },
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: 'Pour vous'),
              Tab(text: 'Abonnements'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: tweets.length,
              itemBuilder: (context, index) {
                return TweetTile(tweet: tweets[index]);
              },
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  '${quote.text}\n\n${quote.author}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
