import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.icon,
  });
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white.withOpacity(.08)),
      child: Center(
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            size: 30,
          ),
        ),
      ),
    );
  }
}
