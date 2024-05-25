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
  //getter
  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  //setter
  set currentSongIndex(int? newindex) {
    _currentSongIndex = newindex;
    notifyListeners();
  }
}
