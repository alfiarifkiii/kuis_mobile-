import 'package:flutter/material.dart';

void main() {
  runApp(const AppHubApp());
}

class AppHubApp extends StatelessWidget {
  const AppHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppHub',
      theme: ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
        ),
        useMaterial3: true,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // Fungsi untuk menampilkan Dialog Identitas
  void _showIdentityDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Identitas Pembuat'),
          content: const Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama: Alfi Arifki',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text('NIM: 5520124022'),
              SizedBox(height: 4),
              Text('Email: alfialfi138@gmail.com'),
              SizedBox(height: 4),
              Text('Kelas: IF-A / 2024'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const AppDrawer(),
        appBar: AppBar(
          title: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Telusuri aplikasi & game',
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: () => _showIdentityDialog(context),
                child: const CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ),
          ],

          bottom: const TabBar(
            labelColor: Colors.green,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.green,
            tabs: [
              Tab(text: 'Untuk Anda'),
              Tab(text: 'Populer'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ForYouTab(), // Tab 1
            Center(child: Text('Daftar Aplikasi Populer')),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.green),
            accountName: Text('AppHub User'),
            accountEmail: Text('user@apphub.com'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.android, color: Colors.green, size: 40),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.apps),
            title: const Text('Aplikasi & game saya'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Setelan'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class ForYouTab extends StatelessWidget {
  const ForYouTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> appList = [
      {
        'name': 'WhatsApp Messenger',
        'dev': 'WhatsApp LLC',
        'rating': '4.3',
        'size': '45 MB',
      },
      {
        'name': 'Instagram',
        'dev': 'Instagram',
        'rating': '4.4',
        'size': '52 MB',
      },
      {
        'name': 'Spotify: Music and Podcasts',
        'dev': 'Spotify AB',
        'rating': '4.5',
        'size': '30 MB',
      },
      {
        'name': 'TikTok',
        'dev': 'TikTok Pte. Ltd.',
        'rating': '4.4',
        'size': '80 MB',
      },
      {
        'name': 'Shopee: Belanja Online',
        'dev': 'Shopee',
        'rating': '4.7',
        'size': '65 MB',
      },
      {
        'name': 'Gojek',
        'dev': 'PT Aplikasi Karya Anak Bangsa',
        'rating': '4.6',
        'size': '40 MB',
      },
    ];

    return ListView.builder(
      itemCount: appList.length,
      itemBuilder: (context, index) {
        final app = appList[index];

        return ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.green[100],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.android, color: Colors.green, size: 30),
          ),
          title: Text(
            app['name']!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text('${app['dev']} \n${app['rating']} ★ • ${app['size']}'),
          isThreeLine: true,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AppDetailScreen(appData: app),
              ),
            );
          },
        );
      },
    );
  }
}

class AppDetailScreen extends StatelessWidget {
  final Map<String, String> appData;

  const AppDetailScreen({super.key, required this.appData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Aplikasi')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.green[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(Icons.android, color: Colors.green, size: 60),
            ),
            const SizedBox(height: 16),
            Text(
              appData['name']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              appData['dev']!,
              style: const TextStyle(fontSize: 16, color: Colors.green),
            ),
            const SizedBox(height: 8),
            Text('${appData['rating']} ★ • ${appData['size']}'),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () {},
                child: const Text('Instal', style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 24),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Tentang aplikasi ini',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Ini adalah halaman detail untuk aplikasi ${appData['name']}. '
              'Pengguna dapat menekan tombol kembali di AppBar atau menggeser layar untuk kembali ke daftar.',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
