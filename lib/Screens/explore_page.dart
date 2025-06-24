import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  const Text("Find Products",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                  const SizedBox(height: 10),
        
                  // 🔍 Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
        
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      height: 600, // Set a fixed height according to your needs
                      child: GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16, // horizontal space between items
                          mainAxisSpacing: 20,  // vertical space between items
                        ),
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 180,
                            height: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/images/beef bone.png',
                                  height: 140,
                                  width: 140,
                                  fit: BoxFit.contain,
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 8,
                      ),
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