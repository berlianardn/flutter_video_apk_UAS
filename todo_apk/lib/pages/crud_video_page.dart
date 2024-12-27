import 'package:flutter/material.dart';
import 'package:todo_apk/pages/home.dart'; // Mengimport halaman Beranda untuk sinkronisasi data
import 'package:todo_apk/pages/video_player.dart'; // Halaman video player

class CrudVideoPage extends StatefulWidget {
  final List<Map<String, String>> videoList;
  final Function(List<Map<String, String>>) onUpdateVideos;

  const CrudVideoPage({
    super.key,
    required this.videoList,
    required this.onUpdateVideos,
  });

  @override
  State<CrudVideoPage> createState() => _CrudVideoPageState();
}

class _CrudVideoPageState extends State<CrudVideoPage> {
  late TextEditingController _titleController;
  late TextEditingController _videoIdController;
  late TextEditingController _categoryController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _videoIdController = TextEditingController();
    _categoryController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _videoIdController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  // Fungsi untuk menambah video baru
  void _addVideo() {
    if (_titleController.text.isNotEmpty &&
        _videoIdController.text.isNotEmpty &&
        _categoryController.text.isNotEmpty) {
      final newVideo = {
        'title': _titleController.text,
        'videoId': _videoIdController.text,
        'category': _categoryController.text,
      };
      setState(() {
        widget.videoList.add(newVideo);
      });
      widget.onUpdateVideos(widget.videoList); // Update data di Beranda
      Navigator.pop(context); // Kembali ke halaman sebelumnya
    }
  }

  // Fungsi untuk mengedit video yang sudah ada
  void _editVideo(int index) {
    if (_titleController.text.isNotEmpty &&
        _videoIdController.text.isNotEmpty &&
        _categoryController.text.isNotEmpty) {
      final editedVideo = {
        'title': _titleController.text,
        'videoId': _videoIdController.text,
        'category': _categoryController.text,
      };
      setState(() {
        widget.videoList[index] = editedVideo;
      });
      widget.onUpdateVideos(widget.videoList); // Update data di Beranda
      Navigator.pop(context); // Kembali ke halaman sebelumnya
    }
  }

  // Fungsi untuk menghapus video
  void _deleteVideo(int index) {
    final deletedVideo = widget.videoList[index];
    setState(() {
      widget.videoList.removeAt(index);
    });
    widget.onUpdateVideos(widget.videoList); // Update data di Beranda
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Video "${deletedVideo['title']}" has been deleted!')),
    );
    Navigator.pop(context); // Kembali ke halaman sebelumnya
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CRUD Video'),
        backgroundColor: const Color.fromARGB(255, 193, 70, 68),
      ),
      body: ListView.builder(
        itemCount: widget.videoList.length,
        itemBuilder: (context, index) {
          final video = widget.videoList[index];
          return ListTile(
            title: Text(video['title']!),
            subtitle: Text('Kategori: ${video['category']}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    _titleController.text = video['title']!;
                    _videoIdController.text = video['videoId']!;
                    _categoryController.text = video['category']!;
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Edit Video'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: _titleController,
                                decoration: const InputDecoration(labelText: 'Title'),
                              ),
                              TextField(
                                controller: _videoIdController,
                                decoration: const InputDecoration(labelText: 'Video ID'),
                              ),
                              TextField(
                                controller: _categoryController,
                                decoration: const InputDecoration(labelText: 'Category'),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                _editVideo(index);
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _deleteVideo(index);
                  },
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tampilkan dialog untuk menambah video baru dengan input kosong
          _titleController.clear();
          _videoIdController.clear();
          _categoryController.clear();
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Add New Video'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: const InputDecoration(labelText: 'Title'),
                    ),
                    TextField(
                      controller: _videoIdController,
                      decoration: const InputDecoration(labelText: 'Video ID'),
                    ),
                    TextField(
                      controller: _categoryController,
                      decoration: const InputDecoration(labelText: 'Category'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: _addVideo,
                    child: const Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.red,
      ),
    );
  }
}
