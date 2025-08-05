import 'package:flutter/material.dart';

// Dummy LoginPage for navigation (replace
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

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
          
          padding: const EdgeInsets.all(20.0)
          , child: Column(
            children: [
        const Row(
          children: [
            CircleAvatar(
        radius: 30,
        backgroundImage: AssetImage('assetsimagesprofile_picture.png'), // Replace with your image
            ),
            SizedBox(width:  20),
        Column(
          children: [
            Text(
        'Afsar Hussien',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
            ),
            Text(
        'Email Address',
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
            ),
            
        ]
          ),
         
          ],
        ),
        
        
          
        
          ListTile(
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        
            leading: const Icon(Icons.shopping_bag, color: Colors.black),
            title: const Text(
        'Orders',
        style: TextStyle(fontSize: 18),
            ),   
            onTap: () {
        
            }
            ),
          Divider(height: 1, thickness: 1, color: Colors.grey[300]),
        
          ListTile(
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        
            leading: const Icon(Icons.format_indent_increase, color: Colors.black),
            title: const Text(
        'My Details',
        style: TextStyle(fontSize: 18),
            ),   
            onTap: () {
        
            }
            ),
          Divider(height: 1, thickness: 1, color: Colors.grey[300]),
        
          ListTile(
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        
            leading: const Icon(Icons.location_pin, color: Colors.black),
            title: const Text(
        'Delivery Address',
        style: TextStyle(fontSize: 18),
            ),   
            onTap: () {
        
            }
            ),    Divider(height: 1, thickness: 1, color: Colors.grey[300]),
        
          ListTile(
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        
            leading: const Icon(Icons.credit_card, color: Colors.black),
            title: const Text(
        'Payment Methods',
        style: TextStyle(fontSize: 18),
            ),   
            onTap: () {
        
            }
            ),    Divider(height: 1, thickness: 1, color: Colors.grey[300]),
        
          ListTile(
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        
            leading: const Icon(Icons.wallet_giftcard, color: Colors.black),
            title: const Text(
        'Promo Codes',
        style: TextStyle(fontSize: 18),
            ),   
            onTap: () {
        
            }
            ),    Divider(height: 1, thickness: 1, color: Colors.grey[300]),
        
          ListTile(
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        
            leading: const Icon(Icons.notification_add, color: Colors.black),
            title: const Text(
        'Notifications',
        style: TextStyle(fontSize: 18),
            ),   
            onTap: () {
        
            }
            ),    Divider(height: 1, thickness: 1, color: Colors.grey[300]),
        
          ListTile(
            trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
            leading: const Icon(Icons.help, color: Colors.black),
            title: const Text(
        'Help & Support',
        style: TextStyle(fontSize: 18),
            ),   
            onTap: () {
        
            }
            ),    Divider(height: 1, thickness: 1, color: Colors.grey[300]),
        
          ListTile(
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black),
        
            leading: const Icon(Icons.info, color: Colors.black),
            title: const Text(
        'About Us',
        style: TextStyle(fontSize: 18),
            ),   
            onTap: () {
        
            }
            ),const SizedBox(height: 20),
          ElevatedButton.icon(
            iconAlignment: IconAlignment.values[0],  // Align icon to the left
            icon: const Icon(Icons.logout, color: Colors.white), // Icon color
            label: const Text('Logout'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey, // Button color
              foregroundColor: Colors.white, // Text color
              padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16), // Rounded corners
              ),
            ),
            onPressed: () {
              
            },
          ),
        
          ]
          ),
          
        
          
        
          
          ),
      ),


    );
  }
}
