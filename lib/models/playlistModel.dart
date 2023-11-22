import 'package:juke/models/models.dart';

class Playlist {
  final String name;
  final String description;
  final List<Song> songs;
  final String imageUrl;

  Playlist({
    required this.name,
    required this.description,
    required this.songs,
    required this.imageUrl,
  });
}
