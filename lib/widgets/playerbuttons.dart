import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:zenzone/utils/size_config.dart';

class PlayerButton extends StatelessWidget {
  const PlayerButton({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed: () {
                final newPosition = audioPlayer.position - const Duration(seconds: 10);
                if (newPosition > Duration.zero) {
                  audioPlayer.seek(newPosition);
                }
                else {
                  audioPlayer.seek(Duration.zero);
                }
              },
              iconSize: getProportionateScreenHeight(45),
              icon: const Icon(
                Icons.replay_10,
                color: Colors.white,
              )
            );
          }
        ),
        SizedBox(width: getProportionateScreenWidth(20)),
        StreamBuilder<PlayerState>(
          stream: audioPlayer.playerStateStream, 
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              final playerState = snapshot.data;
              final processingState = (playerState!).processingState;

              if(processingState == ProcessingState.loading || processingState == ProcessingState.buffering) {
                return SizedBox(
                  width: getProportionateScreenWidth(65),
                  height: getProportionateScreenHeight(65),
                  child: const CircularProgressIndicator(),
                );
              }
              else if (!audioPlayer.playing) {
                return IconButton(
                  onPressed: () => audioPlayer.play(),
                  iconSize: getProportionateScreenHeight(75),
                  icon: const Icon(
                    Icons.play_circle,
                    color: Colors.white,
                  ),
                );
              }
              else if (processingState != ProcessingState.completed) {
                return IconButton(
                  onPressed: () => audioPlayer.pause(),
                  iconSize: getProportionateScreenHeight(75),
                  icon: const Icon(
                    Icons.pause_circle,
                    color: Colors.white,
                  ),
                );
              }
              else {
                return IconButton(
                  onPressed: () => audioPlayer.seek(
                    Duration.zero,
                    index: audioPlayer.effectiveIndices!.first
                  ),
                  iconSize: getProportionateScreenHeight(75),
                  icon: const Icon(
                    Icons.replay_circle_filled_outlined,
                    color: Colors.white,
                  ),
                );
              }
            }
            else {
              return const CircularProgressIndicator();
            }
          },
        ),
        SizedBox(width: getProportionateScreenWidth(20)),
        StreamBuilder<SequenceState?>(
          stream: audioPlayer.sequenceStateStream,
          builder: (context, index) {
            return IconButton(
              onPressed: () {
                final newPosition = audioPlayer.position + const Duration(seconds: 10);
                final duration = audioPlayer.duration;
                if (newPosition < duration!) {
                  audioPlayer.seek(newPosition);
                } 
                else {
                  audioPlayer.seek(duration);
                }
              },
              iconSize: getProportionateScreenHeight(45),
              icon: const Icon(
                Icons.forward_10,
                color: Colors.white,
              )
            );
          }
        ),
      ],
    );
  }
}