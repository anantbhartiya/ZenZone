class Song {
  final String id;
  final String title;
  final String imagePath;
  final String songPath;

  Song({
    this.id = '',
    required this.title,
    required this.imagePath,
    required this.songPath,
  });


  static List<Song> songs = [
    Song(
      id: '1',
      title: 'Deep Relaxation',
      songPath: 'assets/meditation/audio/Deep Relaxation.mp3',
      imagePath: 'assets/meditation/cover/Deep Relaxation.jpeg',
    ),
    Song(
      id: '2',
      title: 'Fall asleep',
      songPath: 'assets/meditation/audio/Fall asleep.mp3',
      imagePath: 'assets/meditation/cover/Fall asleep.jpg',
    ),
    Song(
      id: '3',
      title: 'Healing Meditation',
      songPath: 'assets/meditation/audio/Healing meditation.mp3',
      imagePath: 'assets/meditation/cover/Healing meditation.jpg',
    ),
    Song(
      id: '4',
      title: 'Mindfulness Meditation',
      songPath: 'assets/meditation/audio/Mindfulness meditation guided.mp3',
      imagePath: 'assets/meditation/cover/Mindfulness Meditation.jpg',
    ),
    Song(
      id: '5',
      title: 'Morning Meditation',
      songPath: 'assets/meditation/audio/Morning meditation.mp3',
      imagePath: 'assets/meditation/cover/Morning Meditation.jpg',
    ),
    Song(
      id: '6',
      title: 'Ultimate Relaxation',
      songPath: 'assets/meditation/audio/Ultimate Relaxation.mp3',
      imagePath: 'assets/meditation/cover/Ultimate relaxation.jpg',
    ),
  ];
}