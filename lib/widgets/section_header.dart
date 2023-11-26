import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }
}
