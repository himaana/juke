import 'package:flutter/material.dart';
import 'package:juke/models/models.dart';
import 'package:juke/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromRGBO(21, 26, 34, 1),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        // bottomNavigationBar: Container(
        //   decoration: const BoxDecoration(
        //     border: Border(
        //       top: BorderSide(
        //         color: Colors.white,
        //         width: 0.5,
        //       ),
        //     ),
        //   ),
        //   child: BottomNavigationBar(
        //     type: BottomNavigationBarType.fixed,
        //     backgroundColor: Colors.transparent,
        //     unselectedItemColor: Colors.white,
        //     selectedItemColor: Colors.red,
        //     items: const [
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.play_circle),
        //         label: 'Listen Now',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.library_music),
        //         label: 'Library',
        //       ),
        //       BottomNavigationBarItem(
        //         icon: Icon(Icons.search),
        //         label: 'Search',
        //       ),
        //     ],
        //   ),
        // ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const _BannerBox(),
              _NewAddedSong(songs: songs),
              _RecentlyPlayed(songs: songs)
            ],
          ),
        ),
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
        left: 20,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}

class _RecentlyPlayed extends StatelessWidget {
  const _RecentlyPlayed({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: SectionHeader(title: 'Recently Played'),
          ),
          const SizedBox(height: 20.0),
          SizedBox(
            height: 140.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(song: songs[index]);
              },
            ),
          ),
          const SizedBox(height: 10.0),
          const _LineSpacing(),
        ],
      ),
    );
  }
}

class _NewAddedSong extends StatelessWidget {
  const _NewAddedSong({
    super.key,
    required this.songs,
  });

  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: SectionHeader(title: 'New Added Song'),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            height: 140.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return SongCard(song: songs[index]);
              },
            ),
          ),
          const SizedBox(height: 10.0),
          const _LineSpacing(),
        ],
      ),
    );
  }
}

class _BannerBox extends StatelessWidget {
  const _BannerBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
        right: 10,
        left: 10,
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.90,
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.amber.shade500.withOpacity(1),
              Colors.transparent,
            ],
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15.0),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(
            top: 65,
            left: 50,
            right: 50,
          ),
          child: Column(
            children: [
              const Text(
                '1 Million Songs To Play. All ad-free',
                style: TextStyle(
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                'assets/images/juke_banner.png',
                width: MediaQuery.of(context).size.width * 0.40,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0.0,
      titleSpacing: 20,
      title: Text(
        'Listen Now',
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: InkWell(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.red,
                    width: 1.0,
                  )),
              child: const CircleAvatar(
                backgroundColor: Color.fromRGBO(21, 26, 34, 1),
                child: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
