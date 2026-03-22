import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// ==========================================
// PHẦN 1: DỮ LIỆU CƠ BẢN
// ==========================================
class Product {
  final String id;
  final String name;
  final String description;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });
}

final List<Product> sampleProducts = [
  Product(
    id: '1',
    name: 'Điện thoại 01',
    description: 'Điện thoại mới của hãng Samsung với công nghệ hiện đại',
    price: 1200.0,
  ),
  Product(
    id: '2',
    name: 'Điện thoại 02',
    description: 'Thiết kế sang trọng',
    price: 2000.0,
  ),
  Product(
    id: '3',
    name: 'Điện thoại 03',
    description: 'Pin trâu bò',
    price: 600.0,
  ),
  Product(
    id: '4',
    name: 'Điện thoại 04',
    description: 'Chụp ảnh sắc nét',
    price: 850.0,
  ),
];

// Biến toàn cục lưu danh sách hàng đã chọn
List<Product> myCart = [];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cửa hàng điện thoại',
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const IntroScreen(),
    );
  }
}

// ==========================================
// PHẦN 2: MÀN HÌNH GIỚI THIỆU
// ==========================================
class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.school, size: 100, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Cửa hàng điện thoại',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text('140 Lê Trọng Tấn, Tân Phú, TP.Hồ Chí Minh'),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShopScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
              ),
              child: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// PHẦN 3: MÀN HÌNH CỬA HÀNG
// ==========================================
class ShopScreen extends StatefulWidget {
  const ShopScreen({super.key});

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  void _showConfirmDialog(Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận'),
          content: const Text('Bạn vừa thêm sản phẩm vào Giỏ hàng'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Không'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  myCart.add(product);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Đồng ý'),
            ),
          ],
        );
      },
    );
  }

  void _goToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const CartScreen()),
    ).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cửa hàng điện thoại'),
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: _goToCart,
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              accountName: Text('Vũ Thiên Trường'),
              accountEmail: Text('vuthientruong@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.blue),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.store),
              title: const Text('Cửa hàng'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text('Giỏ hàng'),
              onTap: () {
                Navigator.pop(context);
                _goToCart();
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Thoát'),
              onTap: () =>
                  Navigator.of(context).popUntil((route) => route.isFirst),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Chọn sản phẩm bạn muốn sử dụng',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: sampleProducts.length,
              itemBuilder: (context, index) {
                final product = sampleProducts[index];
                return Card(
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            color: Colors.grey[300],
                            child: const Center(
                              child: Icon(Icons.smartphone, size: 50),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          product.description,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${product.price}',
                              style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.add_box,
                                color: Colors.teal,
                                size: 30,
                              ),
                              onPressed: () => _showConfirmDialog(product),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// PHẦN 4: MÀN HÌNH GIỎ HÀNG VÀ THANH TOÁN
// ==========================================
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  void _showRemoveDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận'),
          content: const Text('Bạn muốn loại bỏ sản phẩm này ra khỏi giỏ hàng'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Không'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  myCart.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Đồng ý'),
            ),
          ],
        );
      },
    );
  }

  void _showCheckoutDialog() {
    if (myCart.isEmpty) return;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Thanh toán'),
          content: const Text('Bạn đã thanh toán xong giỏ hàng'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  myCart.clear();
                });
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Giỏ hàng của bạn'),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Giỏ hàng của bạn',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: myCart.isEmpty
                ? const Center(
                    child: Text('Bạn chưa bỏ sản phẩm nào vô giỏ hàng!!!'),
                  )
                : ListView.builder(
                    itemCount: myCart.length,
                    itemBuilder: (context, index) {
                      final product = myCart[index];
                      return ListTile(
                        title: Text(
                          product.name,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('${product.price}'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.black),
                          onPressed: () => _showRemoveDialog(index),
                        ),
                      );
                    },
                  ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _showCheckoutDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(color: Colors.teal),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 12,
                ),
              ),
              child: const Text('Thanh toán'),
            ),
          ),
        ],
      ),
    );
  }
}
