import 'package:flutter/material.dart';

class StatusField extends StatefulWidget {
  final String imagePath;
  final String title;
  final String statusComment;

  const StatusField({
    super.key,
    required this.imagePath,
    required this.title,
    required this.statusComment,
  });

  @override
  State<StatusField> createState() => _StatusFieldState();
}

class _StatusFieldState extends State<StatusField> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontFamily: 'SCDream',
              fontWeight: FontWeight.w300,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 5),
          Image(image: AssetImage(widget.imagePath), width: 50, height: 50),
          SizedBox(height: 5),
          Text(
            widget.statusComment,
            style: const TextStyle(
              fontFamily: 'SCDream',
              fontWeight: FontWeight.w300,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}
