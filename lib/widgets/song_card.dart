import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juke/route/routes.dart';

import '../models/song_model.dart';

class SongCard extends StatelessWidget {
  final Song song;
  const SongCard({
    Key? key,
    required this.song,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20.0),
        InkWell(
          onTap: () {
            Get.toNamed(AppRoutes.song, arguments: this.song);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  song.coverUrl,
                  fit: BoxFit.cover,
                  height: 90.0,
                  width: 90.0,
                ),
              ),
              const SizedBox(
                height: 3.0,
              ),
              Text(
                song.title,
              ),
              const SizedBox(
                height: 3.0,
              ),
              Row(
                children: song.artis
                    .map((artist) => Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            artist,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
