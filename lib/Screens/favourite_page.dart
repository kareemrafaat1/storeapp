import 'package:flutter/material.dart';


class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}   

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TimeOfDay.now().format(context),
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Icon(Icons.signal_cellular_4_bar, color: Colors.black),
          SizedBox(width: 8),
          Icon(Icons.wifi, color: Colors.black),
          SizedBox(width: 8),
          Icon(Icons.battery_full, color: Colors.black),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Favourites',
                style: TextStyle(fontSize: 24, color: Colors.black54),
              ),
                ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10, // Example item count
                itemBuilder: (context, index) {
                  return SizedBox(
                  height: 80,
                  child: ListTile(
                    leading: const CircleAvatar(
                    backgroundColor: Colors.blue,
                    ),
                    title: const Text('bell paper '),
                    subtitle: const Text('price: \$10'),
                    trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      // Handle item removal
                    },
                    ),
                  ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  color: Color(0xFFE2E2E2),
                  thickness: 1,
                  height: 1,
                ),
                ),
              SizedBox(
                  width:400,
                    child: Column(
                    children: [
                      ElevatedButton(
                      onPressed: () {
                        // Handle login logic
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 80),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(fontSize: 18),
                      ),
                      ),
                      // You can add more widgets here as children
                    ],
                    ),
                  ),
            ],
        ),
      ),
      
      ),
      
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.shop_2, color: Colors.green),
              onPressed: () {
                // Handle home button press
              },
            ),
            IconButton(
              icon: const Icon(Icons.home, color: Colors.green),
              onPressed: () {
                // Handle home button press
              },
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.green),
              onPressed: () {
                // Handle home button press
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.green),
              onPressed: () {
                // Handle home button press
              },
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.green),
              onPressed: () {
                // Handle home button press
              },
            ),
            IconButton(
              icon: const Icon(Icons.person_2, color: Colors.green),
              onPressed: () {
                // Handle home button press
              },
            ),
            // Your items here
          ],
        ),
      ),
    );
  }
}