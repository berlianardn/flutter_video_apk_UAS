import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;
  final String videoTitle;
  final String videoCategory;

  const VideoPlayerPage({
    super.key,
    required this.videoUrl,
    required this.videoTitle,
    required this.videoCategory,
  });

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    // Mengambil videoId dari URL yang valid
    String videoId = YoutubePlayer.convertUrlToId(widget.videoUrl) ?? '';

    // Inisialisasi YoutubePlayerController dengan videoId
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true, // Video akan otomatis diputar
        mute: false,    // Video diputar dengan suara aktif
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true, // Menampilkan indikator progres video
        progressIndicatorColor: Colors.red, // Warna indikator progres
        onReady: () {
          debugPrint("Player is ready.");
        },
        onEnded: (metadata) {
          // Tampilkan notifikasi saat video selesai diputar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Video '${widget.videoTitle}' telah selesai."),
            ),
          );
        },
      ),
      builder: (context, player) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.videoTitle),
            backgroundColor: const Color.fromARGB(255, 193, 70, 68),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              player,
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.videoTitle,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Kategori: ${widget.videoCategory}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
