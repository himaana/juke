import 'package:get/get.dart';
import 'package:juke/screens/screens.dart';

class AppRoutes {
  static List<GetPage> routes = [
    GetPage(name: navbar, page: () => const NavScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: library, page: () => const LibraryScreen()),
    GetPage(name: search, page: () => const SearchScreen()),
    GetPage(
        name: song, page: () => const SongScreen(), arguments: Get.arguments),
  ];

  static getnavbar() => navbar;
  static gethome() => home;
  static getlibrary() => library;
  static getsearch() => search;
  static getsong() => song;

  static String song = '/song';
  static String navbar = '/';
  static String home = '/home';
  static String library = '/library';
  static String search = '/search';
}
