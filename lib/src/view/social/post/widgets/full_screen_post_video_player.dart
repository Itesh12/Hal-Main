import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';




@RoutePage()
class FullScreenPostVideoPlayerPage extends StatefulWidget {
  const FullScreenPostVideoPlayerPage({super.key});

  @override
  State<FullScreenPostVideoPlayerPage> createState() => _FullScreenPostVideoPlayerPageState();
}

class _FullScreenPostVideoPlayerPageState extends State<FullScreenPostVideoPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Go'),
      ),
    );
  }
}
