import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(

                  width: 37,
                  height: 42,
                  child: Image.asset('assets/images/Vector.png'),
                ),
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
  height: 114,
  width: 367,
  color: const Color(0xFFF2F3F2),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 105,
        width: 122,
        child: Image.asset("assets/images/2771 1.png"),
      ),
      
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            
            width: 188,
            height: 44,
            child: Image.asset("assets/images/Group 6811.png"),
          ),
        ],
      ),
      const SizedBox(width: 10),
    ],
  ),
),

                Row(
                  children: [
                    const SizedBox(height: 20),
                    const Text( 'Exclusive Offers',
                    textAlign: 
                        TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // Handle sign up logic
                      },
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
           SizedBox(
             height: 200, // Set a fixed height for the ListView
             child: ListView.builder(
               scrollDirection: Axis.horizontal, // Horizontal scrolling
               itemCount: 5, // Set the number of items you want to display
               itemBuilder: (BuildContext context, int index) {
                 return Container(
                   width:150,
                   height: 100,
                   decoration: BoxDecoration(

                      image: const DecorationImage(

                        image: AssetImage('assets/images/Group 6814.png'),
                        
                      ),
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.white,
                   ),
                 );
               },
             ),
           ),  Row(
                  children: [
                    const SizedBox(height: 20),
                    const Text( 'Best Sellers',
                    textAlign: 
                        TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // Handle sign up logic
                      },
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
           SizedBox(
             height: 200, // Set a fixed height for the ListView
             child: ListView.builder(
               scrollDirection: Axis.horizontal, // Horizontal scrolling
               itemCount: 5, // Set the number of items you want to display
               itemBuilder: (BuildContext context, int index) {
                 return Container(
                   width:150,
                   height: 100,
                   decoration: BoxDecoration(

                      image: const DecorationImage(

                        image: AssetImage('assets/images/Group 6814.png'),
                        
                      ),
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.white,
                   ),
                 );
               },
             ),
           ),  Row(
                  children: [
                    const SizedBox(height: 20),
                    const Text( 'Grocies',
                    textAlign: 
                        TextAlign.start,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        )),
                    const Spacer(),
                    TextButton(
                      onPressed: () {
                        // Handle sign up logic
                      },
                      child: const Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
           SizedBox(
             height: 120, // Set a fixed height for the ListView
             child: ListView.builder(
               scrollDirection: Axis.horizontal, // Horizontal scrolling
               itemCount: 5, // Set the number of items you want to display
               itemBuilder: (BuildContext context, int index) {
                 return Container(
                   width:300,
                   height: 100,
                   decoration: BoxDecoration(

                      image: const DecorationImage(

                        image: AssetImage('assets/images/Group 6814.png'),
                        
                      ),
                     borderRadius: BorderRadius.circular(10),
                     color: Colors.white,
                   ),
                 );
               },
             ),
           ), 
           
           
           
            // Add more widgets here as needed
              ],
              
            ),

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
                Navigator.pushNamed(context, '/favourite_page');
              },
            ),
            IconButton(
              icon: const Icon(Icons.home, color: Colors.green),
              onPressed: () {
  Navigator.pushNamed(context, '/home_page');   
      },
            ),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.green),
              onPressed: () {
Navigator.pushNamed(context, '/explore_page'
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.green),
              onPressed: () {
Navigator.pushNamed(context, '/cart_page');
                },
            ),
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.green),
              onPressed: () {
                Navigator.pushNamed(context, '/favourite_page');
              },
            ),IconButton(
              icon: const Icon(Icons.person_2, color: Colors.green),
              onPressed: () {
                Navigator.pushNamed(context, '/account_page');
              },
            ),
            // Your items here
          ],
        ),
      ),
    );
  }
}
