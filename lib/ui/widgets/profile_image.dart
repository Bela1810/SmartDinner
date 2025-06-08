import 'package:flutter/material.dart';

class UserProfileImage extends StatelessWidget {
  final String imageUrl;

  const UserProfileImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 130,
            backgroundImage: NetworkImage(imageUrl),
            backgroundColor: Colors.grey[300],
          ),
        ],
      ),
    );
  }
}
