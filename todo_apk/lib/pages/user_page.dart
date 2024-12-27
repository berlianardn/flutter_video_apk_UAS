import 'package:flutter/material.dart';
import 'package:todo_apk/pages/welcome.dart';

class UserPage extends StatelessWidget {
  final String name;
  final String email;
  final String role;
  final String phone;
  final String address;

  const UserPage({
    super.key,
    required this.name,
    required this.email,
    required this.role,
    required this.phone,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    // Debugging: Menampilkan data ke konsol
    debugPrint('Name: $name');
    debugPrint('Email: $email');
    debugPrint('Role: $role');
    debugPrint('Phone: $phone');
    debugPrint('Address: $address');

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 193, 70, 68), // Warna merah untuk AppBar
        title: const Text('User Profile'),
        centerTitle: true, // Memusatkan judul pada AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView( // Menambahkan scroll jika konten meluap
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                radius: 60,
                backgroundImage: const NetworkImage(
                'https://www.w3schools.com/w3images/avatar3.png', // URL Avatar yang valid
                ),
                onBackgroundImageError: (exception, stackTrace) {
                debugPrint('Error loading image: $exception'); // Debug jika gagal memuat gambar
                },
  backgroundColor: Colors.grey[200], // Tambahkan warna background jika gambar tidak terbaca
  child: const Icon(
    Icons.person,
    size: 60,
    color: Colors.grey,
  ), // Fallback jika gambar gagal dimuat
),


                // Nama pengguna
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 53, 6, 6), // Warna gelap untuk visibilitas
                  ),
                ),
                const SizedBox(height: 10),
                // Peran pengguna
                Text(
                  'Peran: Admin $role',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 53, 6, 6),
                  ),
                ),
                const SizedBox(height: 20),
                // Email pengguna
                ListTile(
                  leading: const Icon(Icons.email, color: Color.fromARGB(255, 193, 70, 68)),
                  title: const Text('Email: admin@todo.com'),
                  subtitle: Text(email, style: const TextStyle(color: Colors.black)),
                ),
                const SizedBox(height: 20),
                // Nomor telepon pengguna
                ListTile(
                  leading: const Icon(Icons.phone, color: Color.fromARGB(255, 193, 70, 68)),
                  title: const Text('Phone: 08895560132'),
                  subtitle: Text(phone, style: const TextStyle(color: Colors.black)),
                ),
                const SizedBox(height: 20),
                // Alamat pengguna
                ListTile(
                  leading: const Icon(Icons.location_on, color: Color.fromARGB(255, 193, 70, 68)),
                  title: const Text('Address: UHB'),
                  subtitle: Text(address, style: const TextStyle(color: Colors.black)),
                ),
                const SizedBox(height: 30),
                // Tombol Logout
                ElevatedButton(
                  onPressed: () {
                    // Kembali ke halaman Welcome
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => WelcomePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 193, 70, 68), // Warna merah
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
                    minimumSize: const Size(double.infinity, 50), // Membuat tombol full-width
                  ),
                  child: const Text(
                    'Logout',
                    style: TextStyle(fontSize: 18, color: Colors.white), // Warna teks putih
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Menghilangkan banner debug
    home: UserPage(
      name: 'Berliana Rdn', // Nama user
      email: 'admin@todo.com', // Email user
      role: 'Admin', // Peran user
      phone: '08895560132', // Nomor telepon user
      address: 'UHB', // Alamat user
    ),
  ));
}
