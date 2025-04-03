import 'package:flutter/material.dart';

class ItemData {
  final String title;
  final String description;
  final double price;
  final String asset;
  final bool isWishlist;
  ItemData({
    required this.title,
    required this.description,
    required this.price,
    required this.asset,
    required this.isWishlist,
  });
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  List<ItemData> items = [
    ItemData(
      title: "PEUGEOT-LR01",
      description: "Road Bike",
      price: 1999.99,
      asset: "assets/cyclehercules.jpg",
      isWishlist: false,
    ),
    ItemData(
      title: "SMITH-Trade",
      description: "Road Helmet",
      price: 20,
      asset: "assets/helmet.png",
      isWishlist: true,
    ),
    ItemData(
      title: "Hercules",
      description: "street cycle",
      price: 1300,
      asset: "assets/cyclehercules.jpg",
      isWishlist: false,
    ),

    ItemData(
      title: "Atlas",
      description: "Hill rider",
      price: 3000.86,
      asset: "assets/cycleatlas.jpg",
      isWishlist: true,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Choose Your Bike",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, color: Colors.white),
                    ),
                  ],
                ),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [Colors.blue.shade900, Colors.blueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 20,
                        child: Text(
                          "30% Off",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 10,
                        top: 10,
                        child: Image.asset('assets/bike.jpg', width: 300),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FilterChip(
                      label: const Text("All"),
                      selected: true,
                      onSelected: (bool value) {},
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.bolt, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.abc, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.safety_check, color: Colors.white),
                    ),
                  ],
                ),

                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                        ),
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.blue.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,

                                children: [
                                  Image.asset(items[index].asset, height: 100),
                                  Text(
                                    items[index].description,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    items[index].title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "\$ ${items[index].description}",
                                    style: TextStyle(color: Colors.white70),
                                  ),
                                ],
                              ),
                            ),

                            Positioned(
                              top: 5,
                              right: 5,
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  items[index].isWishlist
                                      ? Icons.favorite
                                      : Icons.favorite_outline,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white60,
          selectedItemColor: Colors.blueAccent,
          currentIndex: currentIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (v) {
            setState(() {
              currentIndex = v;
            });
          },
          items: const [
            BottomNavigationBarItem(label: "", icon: Icon(Icons.bike_scooter)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.map)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.shopping_cart)),
            BottomNavigationBarItem(label: "", icon: Icon(Icons.person)),
          ],
        ),
      ),
    );
  }
}
