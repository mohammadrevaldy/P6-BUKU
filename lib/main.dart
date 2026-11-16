
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

final List<Map<String, String>> bukuData = [
  {
    'title': 'Islam ala prabowo',
    'image': 'https://down-id.img.susercontent.com/file/id-11134207-82252-mj0mc683rjsz3a',
    'description': 'Pandangan islam ala praboowo yang agak aneh.'
  },
  {
    'title': '10 Dosa Besar Soeharto',
    'image': 'https://i.gr-assets.com/images/S/compressed.photo.goodreads.com/books/1266068843i/7725825._UY630_SR1200,630_.jpg',
    'description': 'Buku yang mencerahkan tentang 10 dosa besar yang dilakukan oleh Soeharto selama masa pemerintahannya.'
  },
  {
    'title': 'Dosa Prabowo',
    'image': 'https://down-id.img.susercontent.com/file/id-11134207-7r992-lryat3vfzi1z6f',
    'description': 'Buku yang membahas dosa-dosa yang dilakukan oleh Prabowo Subianto dalam konteks politik dan sosial di Indonesia.'
  },
  {
    'title': 'Bangkitnya Gerakan Masyarakat Sipil di era Orde Baru',
    'image': 'https://down-id.img.susercontent.com/file/id-11134207-7ra0j-mcdhvjznxz5uf7',
    'description': 'Buku ini membahas tentang kebangkitan gerakan masyarakat sipil di era Orde Baru, termasuk peran aktivis, organisasi non-pemerintah, dan gerakan sosial dalam memperjuangkan hak-hak masyarakat dan demokrasi di Indonesia.'
  },
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Data Buku',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Data Buku',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
            ),
          ),
          foregroundColor: Colors.black,
          backgroundColor: Colors.yellow,
          centerTitle: true,
          leading: const Icon(
            Icons.book_online_outlined,
            size: 30,
          ),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list), text: 'List View'),
              Tab(icon: Icon(Icons.grid_on), text: 'Grid View'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildListView(),
            tampilanGrid(),
          ],
        ),
      ),
    );
  }
}

// NAVIGASI KE HALAMAN DETAIL
void bukaDetail(BuildContext context, Map<String, String> item) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => DetailPage(buku: item),
    ),
  );
}

// LIST VIEW
Widget buildListView() {
  return ListView.builder(
    itemCount: bukuData.length,
    itemBuilder: (context, index) {
      final item = bukuData[index];

      return Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        elevation: 3,
        child: ListTile(
          onTap: () => bukaDetail(context, item),
          leading: Image.network(
            item['image']!,
            width: 60,
            height: 80,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return const Icon(Icons.book, size: 50);
            },
          ),
          title: Text(
            item['title']!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      );
    },
  );
}

// GRID VIEW
Widget tampilanGrid() {
  return GridView.builder(
    itemCount: bukuData.length,
    padding: const EdgeInsets.all(12),
    gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
    ),
    itemBuilder: (context, index) {
      final item = bukuData[index];

      return Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () => bukaDetail(context, item),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.network(
                  item['image']!,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.book,
                      size: 60,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(9),
                child: Text(
                  item['title']!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

// HALAMAN DETAIL
class DetailPage extends StatelessWidget {
  final Map<String, String> buku;

  const DetailPage({
    super.key,
    required this.buku,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text(
          'Detail Buku',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 25),

            // GAMBAR BUKU
            Center(
              child: Container(
                height: 300,
                width: 210,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    buku['image']!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.book,
                        size: 100,
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // INFORMASI BUKU
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'INFORMASI BUKU',
                    style: TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    buku['title']!,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Divider(),

                  const SizedBox(height: 10),

                  const Text(
                    'Deskripsi Buku',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  Text(
                    buku['description']!,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.7,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),

                  const SizedBox(height: 30),

                  // TOMBOL KEMBALI
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Kembali'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
