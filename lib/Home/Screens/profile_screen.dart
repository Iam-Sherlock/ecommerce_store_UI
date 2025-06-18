import 'package:ecommerce_store/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBgColor,
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Profile Photo
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
              "https://via.placeholder.com/150", // Dummy image
            ),
          ),
          const SizedBox(height: 10),

          // Name
          Text(
            "Tony Stark",
            style: GoogleFonts.baiJamjuree(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 4),

          // Email
          Text(
            "jarvis@starkindustries.com",
            style: GoogleFonts.baiJamjuree(fontSize: 14, color: Colors.grey),
          ),

          const SizedBox(height: 30),

          // Profile Menu
          Expanded(
            child: ListView(
              children: [
                _buildMenuItem(
                  icon: Icons.edit,
                  title: "Edit Profile",
                  onTap: () {
                    // Go to edit profile
                  },
                ),
                _buildMenuItem(
                  icon: Icons.lock_outline,
                  title: "Change Password",
                  onTap: () {
                    // Go to change password
                  },
                ),
                _buildMenuItem(
                  icon: Icons.shopping_bag_outlined,
                  title: "My Orders",
                  onTap: () {
                    // Go to orders
                  },
                ),
                _buildMenuItem(
                  icon: Icons.settings_outlined,
                  title: "Settings",
                  onTap: () {
                    // Go to settings
                  },
                ),
                _buildMenuItem(
                  icon: Icons.logout,
                  title: "Logout",
                  onTap: () {
                    // Log out
                  },
                  color: Colors.red,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    Color color = Colors.black,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(title, style: GoogleFonts.baiJamjuree(color: color, fontSize: 16)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
