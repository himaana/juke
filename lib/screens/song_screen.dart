import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juke/models/models.dart';
import 'package:juke/widgets/widgets.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;

import '../widgets/seekbar.dart';

enum sampleItem { itemOne, itemTwo, itemThree }

class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  Song song = Get.arguments ?? Song.songs[0];

  @override
  void initState() {
    super.initState();

    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${song.url}'),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream, (
        Duration position,
        Duration? duration,
      ) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(21, 26, 34, 1),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'PLAYING FROM RADIO',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [],
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).maybePop();
            },
            icon: Icon(Icons.keyboard_arrow_down_rounded),
            iconSize: 28,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _CoverArt(song: song),
              _MusicPlayer(
                song: song,
                seekBarDataStream: _seekBarDataStream,
                audioPlayer: audioPlayer,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CoverArt extends StatelessWidget {
  const _CoverArt({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          song.coverUrl,
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.width * 0.65,
          width: MediaQuery.of(context).size.width * 0.65,
        ),
      ),
    );
  }
}

class _MusicPlayer extends StatelessWidget {
  const _MusicPlayer({
    super.key,
    required this.song,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
  }) : _seekBarDataStream = seekBarDataStream;

  final Song song;
  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30.0,
        vertical: 30.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            song.title,
            style: TextStyle(fontSize: 18.0),
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
                          fontSize: 16.0,
                        ),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(
            height: 30,
          ),
          StreamBuilder<SeekBarData>(
              stream: _seekBarDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return SeekBar(
                  position: positionData?.position ?? Duration.zero,
                  duration: positionData?.duration ?? Duration.zero,
                  onChanged: audioPlayer.seek,
                );
              }),
          PlayerButtons(audioPlayer: audioPlayer)
        ],
      ),
    );
  }
}
