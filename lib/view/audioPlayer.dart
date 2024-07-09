import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class MyAudioPlayer extends StatelessWidget {
  MyAudioPlayer({super.key});

  final AudioPlayer _player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(
            future: _player.setAsset('assets/Friends.mp3'),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Column(
                  children: [
                    StreamBuilder<Duration?>(
                      stream: _player.durationStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(formatDuration(snapshot.data!));
                        } else {
                          return const Text('00:00');
                        }
                      },
                    ),
                    StreamBuilder<Duration>(
                      stream: _player.positionStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Slider(
                            min: 0,
                            max: _player.duration!.inSeconds.toDouble(),
                            value: snapshot.data!.inSeconds.toDouble(),
                            onChanged: (value) {
                              _player.seek(Duration(seconds: value.toInt()));
                            },
                          );
                        } else {
                          return const Slider(
                            min: 0,
                            max: 0,
                            value: 0,
                            onChanged: null,
                          );
                        }
                      },
                    ),
                    StreamBuilder<PlayerState>(
                      stream: _player.playerStateStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ElevatedButton(
                            onPressed: () {
                              if (snapshot.data!.playing) {
                                _player.pause();
                              } else {
                                if (snapshot.data!.processingState ==
                                    ProcessingState.completed) {
                                  _player.seek(Duration.zero);
                                }
                                _player.play();
                              }
                            },
                            child: snapshot.data!.playing
                                ? const Text('Pause')
                                : snapshot.data!.processingState ==
                                        ProcessingState.completed
                                    ? const Text('Play Again')
                                    : const Text('Play'),
                          );
                        } else {
                          return const ElevatedButton(
                            onPressed: null,
                            child: Text('Play'),
                          );
                        }
                      },
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }

  String formatDuration(Duration d) {
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
  }
}
