import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import 'package:zenzone/utils/size_config.dart';
import 'package:zenzone/utils/song.dart';
import 'package:zenzone/utils/theme.dart';
import 'package:zenzone/widgets/playerbuttons.dart';
import 'package:zenzone/widgets/seekbar.dart';

class AudioScreen extends StatefulWidget {
  final Song song;
  
  const AudioScreen({super.key, required this.song});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  late Song song;

  @override
  void initState() {
    super.initState();
    song = widget.song;
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.asset(song.songPath),
        ]
      ),
    );
  }
    
  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }
  
  Stream<SeekBarData> get _seekBarDataStream => 
  rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
    audioPlayer.positionStream,
    audioPlayer.durationStream,
    (Duration position, Duration? duration) {
      return SeekBarData(position, duration ?? Duration.zero);
    }
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            constraints: const BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(song.imagePath),
                fit: BoxFit.cover
              )
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 30,
                sigmaY: 30
              ),
              child: Container(color: bluetheme.withOpacity(0.2),),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  song.imagePath,
                  width: getProportionateScreenWidth(250),
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                song.title,
                style: regularTextStyle.copyWith(
                  color: Colors.white,
                  fontSize: getProportionateScreenHeight(25)
                ),
              ),
              SizedBox(
                height: getProportionateScreenHeight(60),
              ),
              _AudioPlayer(
                song: song,
                seekBarDataStream: _seekBarDataStream, 
                audioPlayer: audioPlayer
              )
            ],
          )
        ],
      ),
    );
  }
}

class _AudioPlayer extends StatelessWidget {
  const _AudioPlayer({
    required this.song,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
  }) : _seekBarDataStream = seekBarDataStream;

  final Song song;
  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20)
      ),
      child: Column(
        children: [
          StreamBuilder<SeekBarData>(
            stream: _seekBarDataStream,
            builder: (context, snapshot) {
              final positionData = snapshot.data;
              return SeekBar(
                position: positionData?.position ?? Duration.zero, 
                duration: positionData?.duration ?? Duration.zero,
                onChangedEnd: audioPlayer.seek,
              );
            }
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          PlayerButton(audioPlayer: audioPlayer)
        ],
      ),
    );
  }
}

