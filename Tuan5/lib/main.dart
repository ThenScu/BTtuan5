import 'package:flutter/material.dart';
import 'BaiTap/B1.dart';
import 'BaiTap/B2.dart';
import 'BaiTap/B3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Menu Bài Tập'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Nut Bam B1
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListViewDemoScreen(),
                  ),
                );
              },
              child: const Text('Mở bài tập 01 (ListView)'),
            ),

            const SizedBox(height: 20), // Khoang cach 20px
            // Nut Bam B2
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // Goi dung ten class MomoScreen trong file B2.dart
                    builder: (context) => const MomoScreen(),
                  ),
                );
              },
              child: const Text('Mở bài tập 02 (Momo)'),
            ),

            const SizedBox(height: 20), // Khoang cach 20px
            // Nut Bam B2
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    // Goi dung ten class MomoScreen trong file B3.dart
                    builder: (context) => const VoucherScreen(),
                  ),
                );
              },
              child: const Text('Mở bài tập 03 (Voucher)'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
