import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juke/models/models.dart';
import 'package:juke/widgets/widgets.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Playlist> playlists = Playlist.playlists;

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF151A22),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: CustomAppBar(title: 'Library', color: Colors.white),
        body: Padding(
          padding: EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ItemRow(
                    title: 'Playlists', icon: Icons.queue_music_rounded),
                const ItemRow(title: 'history', icon: Icons.history_rounded),
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Column(
                    children: [
                      SectionHeader(title: 'Recently Added Playlist'),
                      SizedBox(height: 10),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: playlists.length,
                        itemBuilder: (context, index) {
                          return _PlaylistCard(
                            playlist: playlists[index],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlaylistCard extends StatelessWidget {
  const _PlaylistCard({super.key, required this.playlist});
  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/playlist', arguments: playlist);
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 20.0,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                playlist.coverUrl,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.width * 0.15,
                width: MediaQuery.of(context).size.width * 0.15,
              ),
            ),
            SizedBox(width: 10),
            Column(
              children: [
                Text(
                  playlist.name,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  playlist.description,
                  style: TextStyle(
                      fontSize: 16.0, color: Colors.white.withOpacity(0.6)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ItemRow extends StatelessWidget {
  const ItemRow({
    super.key,
    required this.title,
    required this.icon,
  });
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(color: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        icon,
                        size: 32,
                        color: Colors.red,
                      ),
                      SizedBox(width: 7),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Spacer(flex: 1),
                      Icon(
                        Icons.keyboard_arrow_right_rounded,
                        color: Colors.grey.shade700,
                        size: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          Container(
            margin: const EdgeInsets.only(
              left: 35,
            ),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LineSpacing extends StatelessWidget {
  const _LineSpacing({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: 35,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
