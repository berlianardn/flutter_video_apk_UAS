import 'package:flutter/material.dart';

class VideoProvider with ChangeNotifier {
  final List<Map<String, String>> _videos = [
    {'id': 'xvFZjo5PgG0', 'title': 'Contoh Video 1'},
    {'id': 'dQw4w9WgXcQ', 'title': 'Contoh Video 2'},
  ];

  List<Map<String, String>> get videos => List.unmodifiable(_videos);

  void addVideo(String title, String url) {
    final videoId = _extractVideoId(url);
    if (videoId != null) {
      _videos.add({'id': videoId, 'title': title});
      notifyListeners();
    }
  }

  void editVideo(int index, String title, String url) {
    final videoId = _extractVideoId(url);
    if (videoId != null) {
      _videos[index] = {'id': videoId, 'title': title};
      notifyListeners();
    }
  }

  void deleteVideo(int index) {
    _videos.removeAt(index);
    notifyListeners();
  }

  String? _extractVideoId(String url) {
    final uri = Uri.tryParse(url);
    if (uri == null) return null;

    if (uri.host.contains('youtube.com') || uri.host.contains('youtu.be')) {
      if (uri.host.contains('youtu.be')) {
        return uri.pathSegments.isNotEmpty ? uri.pathSegments.first : null;
      } else if (uri.host.contains('youtube.com')) {
        return uri.queryParameters['v'];
      }
    }
    return null;
  }

  String getVideoUrl(String id) {
    return 'https://www.youtube.com/watch?v=$id';
  }
}
