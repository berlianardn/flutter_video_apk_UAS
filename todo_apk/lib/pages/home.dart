import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:todo_apk/pages/video_player.dart'; // Halaman video player
import 'package:todo_apk/pages/crud_video_page.dart'; // Halaman CRUD video
import 'package:todo_apk/pages/user_page.dart'; // Halaman profil pengguna

class BerandaPage extends StatefulWidget {
  final String role;
  final String name;

  const BerandaPage({
    super.key,
    required this.role,
    required this.name,
  });

  @override
  State<BerandaPage> createState() => _BerandaPageState();
}

class _BerandaPageState extends State<BerandaPage> {
  int _currentIndex = 0;

  final List<String> videoCategories = [
    "Musik", "Olahraga", "Film", "Teknologi", "Game", "Pendidikan", "Berita", "Makanan", "Vlog", "Travel", "Komedi", "Sejarah"
  ];

List<Map<String, String>> videoList = [
  // Musik
  {"title": "Coldplay - Yellow", "videoId": "yKNxeF4KMsY", "category": "Musik", "videoUrl": "https://youtu.be/yKNxeF4KMsY"},
  {"title": "Adele - Hello", "videoId": "YQHsXMglC9A", "category": "Musik", "videoUrl": "https://youtu.be/YQHsXMglC9A"},
  {"title": "Ed Sheeran - Shape of You", "videoId": "JGwWNGJdvx8", "category": "Musik", "videoUrl": "https://youtu.be/JGwWNGJdvx8"},
  {"title": "Taylor Swift - Blank Space", "videoId": "e-ORhEE9VVg", "category": "Musik", "videoUrl": "https://youtu.be/e-ORhEE9VVg"},
  {"title": "BTS - Dynamite", "videoId": "gdZLi9oWNZg", "category": "Musik", "videoUrl": "https://youtu.be/gdZLi9oWNZg"},
  {"title": "Billie Eilish - Bad Guy", "videoId": "DyDfgMOUjCI", "category": "Musik", "videoUrl": "https://youtu.be/DyDfgMOUjCI"},
  {"title": "Justin Bieber - Peaches", "videoId": "tQ0yjYUFKAE", "category": "Musik", "videoUrl": "https://youtu.be/tQ0yjYUFKAE"},

  // Olahraga
  {"title": "Messi Amazing Goals", "videoId": "ldd3dsg35Rk", "category": "Olahraga", "videoUrl": "https://youtu.be/ldd3dsg35Rk"},
  {"title": "Top 10 NBA Plays", "videoId": "LWwpX0O6z_Q", "category": "Olahraga", "videoUrl": "https://youtu.be/LWwpX0O6z_Q"},
  {"title": "Cristiano Ronaldo Skills", "videoId": "u0Oa3pIPohw", "category": "Olahraga", "videoUrl": "https://youtu.be/u0Oa3pIPohw"},
  {"title": "Best Tennis Shots 2023", "videoId": "kO7cH7Gzkuw", "category": "Olahraga", "videoUrl": "https://youtu.be/kO7cH7Gzkuw"},
  {"title": "F1 Highlights", "videoId": "f1ROF2xtlkk", "category": "Olahraga", "videoUrl": "https://youtu.be/f1ROF2xtlkk"},
  {"title": "LeBron James Best Moments", "videoId": "BfsrZ_Mi0mc", "category": "Olahraga", "videoUrl": "https://youtu.be/BfsrZ_Mi0mc"},
  {"title": "Usain Bolt Records", "videoId": "f3u_sN2l9p4", "category": "Olahraga", "videoUrl": "https://youtu.be/f3u_sN2l9p4"},

  // Film
  {"title": "Avengers: Endgame Official Trailer", "videoId": "TcMBFSGVi1c", "category": "Film", "videoUrl": "https://youtu.be/TcMBFSGVi1c"},
  {"title": "The Dark Knight Trailer", "videoId": "EXeTwQWrcwY", "category": "Film", "videoUrl": "https://youtu.be/EXeTwQWrcwY"},
  {"title": "Inception Official Trailer", "videoId": "YoHD9XEInc0", "category": "Film", "videoUrl": "https://youtu.be/YoHD9XEInc0"},
  {"title": "Interstellar Official Trailer", "videoId": "zSWdZVtXT7E", "category": "Film", "videoUrl": "https://youtu.be/zSWdZVtXT7E"},
  {"title": "Spider-Man: No Way Home Trailer", "videoId": "JfVOs4V7El4", "category": "Film", "videoUrl": "https://youtu.be/JfVOs4V7El4"},
  {"title": "Matrix 4 Official Trailer", "videoId": "vqjK8jH99rk", "category": "Film", "videoUrl": "https://youtu.be/vqjK8jH99rk"},
  {"title": "Batman v Superman: Dawn of Justice", "videoId": "m7Yz5O3H9zM", "category": "Film", "videoUrl": "https://youtu.be/m7Yz5O3H9zM"},

  // Teknologi
  {"title": "iPhone 15 Pro Max Review", "videoId": "sR81lz2-2zM", "category": "Teknologi", "videoUrl": "https://youtu.be/sR81lz2-2zM"},
  {"title": "Samsung Galaxy Z Fold 5 Review", "videoId": "JYcJgpD1pLg", "category": "Teknologi", "videoUrl": "https://youtu.be/JYcJgpD1pLg"},
  {"title": "Tesla Cybertruck Review", "videoId": "ggoVbNhsl3w", "category": "Teknologi", "videoUrl": "https://youtu.be/ggoVbNhsl3w"},
  {"title": "MacBook Pro 2023 Review", "videoId": "Dtd0GrY-62M", "category": "Teknologi", "videoUrl": "https://youtu.be/Dtd0GrY-62M"},
  {"title": "Best 2023 Smartphones", "videoId": "nq_Z0gAqXkE", "category": "Teknologi", "videoUrl": "https://youtu.be/nq_Z0gAqXkE"},
  {"title": "Apple Watch Ultra Review", "videoId": "ACzGGpNrd5Y", "category": "Teknologi", "videoUrl": "https://youtu.be/ACzGGpNrd5Y"},
  {"title": "AI in 2024: What to Expect", "videoId": "0kcxKTZjHq4", "category": "Teknologi", "videoUrl": "https://youtu.be/0kcxKTZjHq4"},

  // Game
  {"title": "PUBG Mobile Gameplay", "videoId": "VdtgYZb72i0", "category": "Game", "videoUrl": "https://youtu.be/VdtgYZb72i0"},
  {"title": "Valorant Best Plays", "videoId": "hfA0p4X3ZXg", "category": "Game", "videoUrl": "https://youtu.be/hfA0p4X3ZXg"},
  {"title": "Minecraft Best Builds", "videoId": "T-8qZmfKn0A", "category": "Game", "videoUrl": "https://youtu.be/T-8qZmfKn0A"},
  {"title": "Call of Duty: Modern Warfare 2", "videoId": "g_2gGqP8ReA", "category": "Game", "videoUrl": "https://youtu.be/g_2gGqP8ReA"},
  {"title": "GTA V Top Moments", "videoId": "t0NnFgf5S0g", "category": "Game", "videoUrl": "https://youtu.be/t0NnFgf5S0g"},
  {"title": "Fortnite Best Skins", "videoId": "8XajRwv46KY", "category": "Game", "videoUrl": "https://youtu.be/8XajRwv46KY"},
  {"title": "Elden Ring Best Boss Fights", "videoId": "bStkRZbAft8", "category": "Game", "videoUrl": "https://youtu.be/bStkRZbAft8"},

  // Pendidikan
  {"title": "Introduction to Quantum Physics", "videoId": "1dL_h4hLsc8", "category": "Pendidikan", "videoUrl": "https://youtu.be/1dL_h4hLsc8"},
  {"title": "History of Ancient Egypt", "videoId": "KPvF0YrKHXY", "category": "Pendidikan", "videoUrl": "https://youtu.be/KPvF0YrKHXY"},
  {"title": "Math Tips & Tricks", "videoId": "lFzP2_vTbDQ", "category": "Pendidikan", "videoUrl": "https://youtu.be/lFzP2_vTbDQ"},
  {"title": "Astronomy 101", "videoId": "zZtfyy_Ovxk", "category": "Pendidikan", "videoUrl": "https://youtu.be/zZtfyy_Ovxk"},
  {"title": "Introduction to Psychology", "videoId": "fM2PjyoFBmQ", "category": "Pendidikan", "videoUrl": "https://youtu.be/fM2PjyoFBmQ"},
  {"title": "Programming for Beginners", "videoId": "QScmM6rGmbE", "category": "Pendidikan", "videoUrl": "https://youtu.be/QScmM6rGmbE"},
  {"title": "Learn English Grammar", "videoId": "4I4E1kFy8Nc", "category": "Pendidikan", "videoUrl": "https://youtu.be/4I4E1kFy8Nc"},
];


  List<Map<String, String>> getVideosByCategory(String category) {
    return videoList.where((video) => video['category'] == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color.fromARGB(255, 193, 70, 68),
      ),
      body: Column(
        children: [
          // Kategori (horizontal scroll)
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: videoCategories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? Colors.red.shade300
                          : Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        videoCategories[index],
                        style: TextStyle(
                          color: _currentIndex == index
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          // Daftar video (vertical scroll)
          Expanded(
            child: ListView.builder(
              itemCount: getVideosByCategory(videoCategories[_currentIndex]).length,
              itemBuilder: (context, index) {
                final video =
                    getVideosByCategory(videoCategories[_currentIndex])[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoPlayerPage(
                          videoUrl: 'https://youtu.be/${video['videoId']}',
                          videoTitle: video['title']!,
                          videoCategory: video['category']!,
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                      leading: Container(
                        width: 100,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              'https://img.youtube.com/vi/${video['videoId']}/0.jpg',
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        video['title']!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text('Kategori: ${video['category']}'),
                      trailing: const Icon(Icons.play_arrow, color: Colors.red),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            // Ambil video pertama yang sesuai dengan kategori yang dipilih
            final video = getVideosByCategory(videoCategories[_currentIndex])[0]; // Video pertama

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => VideoPlayerPage(
                  videoUrl: 'https://youtu.be/${video['videoId']}',
                  videoTitle: video['title']!,
                  videoCategory: video['category']!,
                ),
              ),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CrudVideoPage(
                  videoList: videoList,
                  onUpdateVideos: (updatedVideos) {
                    setState(() {
                      videoList = updatedVideos;
                    });
                  },
                ),
              ),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UserPage(
                  name: '',
                  role: '',
                  email: '', phone: '', address: '',
                ),
              ),
            );
          }
        },
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Shorts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Tambah',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
