import 'package:flutter/material.dart';

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
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10),
        child: InkWell(
          onTap: () {},
          child: Row(
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
        ),
      ),
    );
  }
}
