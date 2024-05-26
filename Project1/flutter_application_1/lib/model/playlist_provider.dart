import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/song.dart';

class PlaylistProvider extends ChangeNotifier {
  final List<Song> _playlist = [
    Song(
        songName: "Surround Sound",
        artistName: "21 Savage",
        albumArtImagePath: "assets/image/Image1.jpg",
        audiopath: "audio/Surround Sound-(PagalSongs.Com.IN).mp3"),
    Song(
        songName: "TBSM",
        artistName: "Calm, ABJ Encore",
        albumArtImagePath: "assets/image/Image1.jpg",
        audiopath: "audio/Surround Sound-(PagalSongs.Com.IN).mp3"),
    Song(
        songName: "JackMan",
        artistName: "Jackharlow",
        albumArtImagePath: "assets/image/Image1.jpg",
        audiopath: "audio/Surround Sound-(PagalSongs.Com.IN).mp3"),
  ];

  int? _currentSongIndex;

  //A U D I O P L A Y E R

  //audioplayer
  final AudioPlayer _audioPlayer = AudioPlayer();

  // durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // constrtctor
  PlaylistProvider() {
    listenToDuration();
  }
  // initially not playing
  bool _isPlaying = false;
  //play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audiopath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = true;
    notifyListeners();
  }

  // pause or resume
  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // seek specific location
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
    // notifyListeners();
  }

  // play next song
  void playNextSong() async {
    if (_currentSongIndex != null) {
      if (_currentSongIndex! < _playlist.length - 1) {
        _currentSongIndex = _currentSongIndex! + 1;
      } else {
        _currentSongIndex = 0;
      }
      // play();
    }
  }

  // play previous song
  void playPreviousSong() async {
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSongIndex! > 0) {
        _currentSongIndex = _currentSongIndex! - 1;
      } else {
        _currentSongIndex = _playlist.length - 1;
      }
    }
  }

  // listen to the durations

  void listenToDuration() {
    // listen for the total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    // listen for the current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // listen for the song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  //getter
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;
  //setter
  set currentSongIndex(int? newindex) {
    _currentSongIndex = newindex;

    if (newindex != 0) {
      play();
    }

    notifyListeners();
  }
}
