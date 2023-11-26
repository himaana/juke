import 'package:get/get.dart';
import 'package:juke/screens/screens.dart';

class AppPage {
  static List<GetPage> routre = [
    GetPage(name: navbar, page: () => const NavScreen()),
    GetPage(name: home, page: () => const HomeScreen()),
    GetPage(name: library, page: () => const LibraryScreen()),
    GetPage(name: search, page: () => const SearchScreen())
  ];

  static getnavbar() => navbar;
  static gethome() => home;
  static getlibrary() => library;
  static getsearch() => search;

  static String navbar = '/';
  static String home = '/home';
  static String library = '/library';
  static String search = '/search';
}
