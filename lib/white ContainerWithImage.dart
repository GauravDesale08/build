import 'package:flutter/material.dart';

class WhiteContainerWithImage extends StatelessWidget {
  final String imagePath;

  const WhiteContainerWithImage({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 29,
      width: 29,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
          ),
        ],
      ),
      child: Image.asset(
        imagePath,
        width: 2,
        height: 2,
      ),
    );
  }
}

