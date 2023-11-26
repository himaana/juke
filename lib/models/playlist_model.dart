import 'package:flutter/material.dart';
import 'package:juke/models/models.dart';

class Playlist extends ChangeNotifier {
  final String name;
  final String description;
  final List<Song> songs;
  final String coverUrl;

  Playlist({
    required this.name,
    required this.description,
    required this.songs,
    required this.coverUrl,
  });

  static List<Playlist> playlists = [
    Playlist(
        name: 'Llla',
        description: 'aaa',
        songs: Song.songs,
        coverUrl: 'assets/images/Fate_Of_Life_Cover.jpg'),
    Playlist(
        name: 'Llla',
        description: 'aaa',
        songs: Song.songs,
        coverUrl: 'assets/images/Mad_Hatter_Cover.jpg'),
    Playlist(
        name: 'Llla',
        description: 'aaa',
        songs: Song.songs,
        coverUrl: 'assets/images/sweet_scar.jpg'),
  ];
}
