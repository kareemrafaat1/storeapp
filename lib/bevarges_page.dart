import 'package:flutter/material.dart';

class BeveragesPage extends StatefulWidget {
  const BeveragesPage({super.key});

  @override
  State<BeveragesPage> createState() => _BeveragesPageState();
}

class _BeveragesPageState extends State<BeveragesPage> {
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
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/explore');
            },
            child: const Icon(Icons.arrow_back, color: Colors.black),
          ),
          const SizedBox(width: 10),
          const Text("Bevarages",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              )),
          ElevatedButton(onPressed: (){}, child: const Icon(Icons.line_style, color: Colors.black)),
        ],
      ),
      const SizedBox(height: 10),
      Center(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: 10, // Adjust based on your data
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                children: [
                  Image.asset('assets/images/Group 6824.png', fit: BoxFit.cover),
                  
                ],
              ),
            );
          },
        ),
      ),
    ],
  ),
),
    );  
      
    
  }
}