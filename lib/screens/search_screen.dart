import 'package:flutter/material.dart';
import 'package:juke/widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String inputString = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF151A22),
      appBar: CustomAppBar(title: 'Search', color: Colors.white),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 10),
            formField(),
            SizedBox(height: 10),
            //listview.builder
          ],
        ),
      ),
    );
  }

  Widget formField() {
    return TextField(
      style: TextStyle(color: Colors.grey.shade800),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(5),
        hintText: 'What do you want to listen to?',
        hintStyle:
            TextStyle(color: Colors.grey.shade600, fontWeight: FontWeight.bold),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        prefixIcon: Icon(
          Icons.search,
          size: 30,
          color: Colors.grey.shade600,
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      onChanged: (value) {
        setState(() {
          inputString = value;
        });
      },
    );
  }
}
