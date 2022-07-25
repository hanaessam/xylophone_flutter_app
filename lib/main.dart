import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    void playSound(int soundNumber)
    {
      final player = AudioPlayer();
      player.setSourceAsset('note$soundNumber.wav');
      player.play(
        AssetSource('note$soundNumber.wav'),
      );
    }
    Expanded buildKey({required Color color, required int soundNumber}){
      return Expanded(
        child: TextButton(
          style: TextButton.styleFrom(padding: EdgeInsets.all(0.0)),
          child: Container(
            color: color,
          ),
          onPressed: () {
            playSound(soundNumber);
          },
        ),
      );
    }
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: [
              buildKey(color: Colors.red, soundNumber: 1),
              buildKey(color: Colors.orange, soundNumber: 2),
              buildKey(color: Colors.yellow, soundNumber: 3),
              buildKey(color: Colors.green, soundNumber: 4),
              buildKey(color: Colors.cyan, soundNumber: 5),
              buildKey(color: Colors.blue, soundNumber: 6),
              buildKey(color: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
