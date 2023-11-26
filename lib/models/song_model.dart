import 'package:flutter/material.dart';

class Song extends ChangeNotifier {
  List<String> artis;
  String title;
  String genre;
  String url;
  String coverUrl;

  Song({
    required this.artis,
    required this.title,
    required this.genre,
    required this.url,
    required this.coverUrl,
  });

  static List<Song> songs = [
    Song(
      artis: ['Weird Genius', 'Prince Husein'],
      title: 'Sweet Scar',
      genre: "EDM",
      url: 'assets/musics/sweet_scar.mp3',
      coverUrl: 'assets/images/sweet_scar.jpg',
    ),
    Song(
      artis: ['Axwell Ingrosso'],
      title: 'More Than You Know',
      genre: "EDM",
      url: 'assets/musics/more_than_you_know.mp3',
      coverUrl: 'assets/images/more_than_you_know.jpg',
    ),
    Song(
      artis: ['Helsinki Lambda Club'],
      title: 'Good News is Bad News',
      genre: "Alternative Rock",
      url: 'assets/musics/good_news_is_bad_news.mp3',
      coverUrl: 'assets/images/good_news_is_bad_news.jpg',
    ),
  ];
}
