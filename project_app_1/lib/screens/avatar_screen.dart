import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avengers'),
        actions: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: const CircleAvatar(
                child: Text('Av'),
              ))
        ],
      ),
      body: const Center(
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://i0.wp.com/imgs.hipertextual.com/wp-content/uploads/2022/08/avengers-infinity-war-joe-y-anthony-russo-scaled.jpg?resize=1200%2C800&quality=50&strip=all&ssl=1'),
          maxRadius: 110,
        ),
      ),
    );
  }
}
