import 'package:flutter/material.dart';
import 'star.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          ProfileImage(),
          ProfileDetails(),
          ProfileActions(),
        ],
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        width: 200,
        height: 200,
        'assets/dog.jpg',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            "Wolfram Barker",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w600,
            ),
          ),
          const StarRating(
            value: 2,
          ),
          _buildDetailsRow("Age", "4"),
          _buildDetailsRow("Status", "Good boy"),
        ],
      ),
    );
  }
}

Widget _buildDetailsRow(String heading, String value) {
  return Row(
    children: [
      Text("$heading: ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          )),
      Text(value),
    ],
  );
}

class ProfileActions extends StatelessWidget {
  const ProfileActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildIcon(Icons.restaurant, 'Feed'),
        _buildIcon(Icons.favorite, 'Pet'),
        _buildIcon(Icons.directions_walk, 'Walk'),
      ],
    );
  }
}

Widget _buildIcon(IconData icon, String text) {
  return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Icon(icon, size: 40),
          Text(text),
        ],
      ));
}
