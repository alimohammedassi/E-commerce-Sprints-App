import 'package:flutter/material.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildCoverImage());
  }
}

Widget buildCoverImage() => Container(

color: Colors.grey,
child: Image.network(
  "https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80",
  fit: BoxFit.cover,
  loadingBuilder: (context, child, loadingProgress) {
    if (loadingProgress == null) return child;
    return Center(
      child: CircularProgressIndicator(
        color: Colors.blue,
      ),
    );
  },
  errorBuilder: (context, error, stackTrace) {
    return Center(
      child: Icon(Icons.error, color: Colors.red),
    );
  },
),

);

// import 'package:flutter/material.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   // User data that can be edited
//   String userName = "Ali Asi";
//   String userTitle = "Flutter Developer";
//   String userEmail = "ali.asi@example.com";
//   String userPhone = "+20 123 456 789";
//   String userAddress = "Cairo, Egypt";
//   String profileImageUrl =
//       "https://i.pravatar.cc/300?t=${DateTime.now().millisecondsSinceEpoch}";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         title: const Text(
//           'My Profile',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
//         ),
//         backgroundColor: const Color(0xFF2196F3),
//         elevation: 2,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.edit, color: Colors.white),
//             onPressed: () => _navigateToEditProfile(),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Profile Image Section
//             _buildProfileImageSection(),
//             const SizedBox(height: 16),

//             // Name and Title
//             _buildNameSection(),
//             const SizedBox(height: 24),

//             // Profile Information Card
//             _buildProfileInfoCard(),
//             const SizedBox(height: 24),

//             // Action Buttons
//             _buildActionButtons(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildProfileImageSection() {
//     return Center(
//       child: Stack(
//         children: [
//           CircleAvatar(
//             radius: 65,
//             backgroundColor: Colors.grey[300],
//             child: CircleAvatar(
//               radius: 60,
//               backgroundImage: NetworkImage(profileImageUrl),
//               onBackgroundImageError: (_, __) {
//                 // Handle image loading error
//               },
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: const Color(0xFF2196F3),
//                 shape: BoxShape.circle,
//                 border: Border.all(color: Colors.white, width: 2),
//               ),
//               child: IconButton(
//                 icon: const Icon(
//                   Icons.camera_alt,
//                   color: Colors.white,
//                   size: 20,
//                 ),
//                 onPressed: () => _changeProfilePicture(),
//                 constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildNameSection() {
//     return Column(
//       children: [
//         Text(
//           userName,
//           style: const TextStyle(
//             fontSize: 26,
//             fontWeight: FontWeight.bold,
//             color: Colors.black87,
//           ),
//         ),
//         const SizedBox(height: 6),
//         Text(
//           userTitle,
//           style: TextStyle(
//             fontSize: 18,
//             color: Colors.grey[600],
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildProfileInfoCard() {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       child: Column(
//         children: [
//           _buildInfoTile(
//             icon: Icons.email,
//             title: "Email",
//             subtitle: userEmail,
//             onTap: () => _editField(
//               "Email",
//               userEmail,
//               (value) => setState(() => userEmail = value),
//             ),
//           ),
//           const Divider(height: 1),
//           _buildInfoTile(
//             icon: Icons.phone,
//             title: "Phone",
//             subtitle: userPhone,
//             onTap: () => _editField(
//               "Phone",
//               userPhone,
//               (value) => setState(() => userPhone = value),
//             ),
//           ),
//           const Divider(height: 1),
//           _buildInfoTile(
//             icon: Icons.location_on,
//             title: "Address",
//             subtitle: userAddress,
//             onTap: () => _editField(
//               "Address",
//               userAddress,
//               (value) => setState(() => userAddress = value),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoTile({
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required VoidCallback onTap,
//   }) {
//     return ListTile(
//       leading: Container(
//         padding: const EdgeInsets.all(8),
//         decoration: BoxDecoration(
//           color: const Color(0xFF2196F3).withOpacity(0.1),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Icon(icon, color: const Color(0xFF2196F3), size: 24),
//       ),
//       title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
//       subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[700])),
//       trailing: const Icon(Icons.edit, color: Colors.grey, size: 20),
//       onTap: onTap,
//       contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//     );
//   }

//   Widget _buildActionButtons() {
//     return Column(
//       children: [
//         // Edit Profile Button
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton.icon(
//             icon: const Icon(Icons.edit, color: Colors.white),
//             label: const Text(
//               "Edit Profile",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: const Color(0xFF2196F3),
//               foregroundColor: Colors.white,
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 2,
//             ),
//             onPressed: () => _navigateToEditProfile(),
//           ),
//         ),
//         const SizedBox(height: 12),

//         // Logout Button
//         SizedBox(
//           width: double.infinity,
//           child: ElevatedButton.icon(
//             icon: const Icon(Icons.logout, color: Colors.white),
//             label: const Text(
//               "Log Out",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Colors.red,
//               foregroundColor: Colors.white,
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               elevation: 2,
//             ),
//             onPressed: () => _showLogoutDialog(),
//           ),
//         ),
//       ],
//     );
//   }

//   // Navigate to edit profile page (you can implement a separate EditProfilePage)
//   void _navigateToEditProfile() {
//     Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (context) => EditProfilePage(
//           currentName: userName,
//           currentTitle: userTitle,
//           currentEmail: userEmail,
//           currentPhone: userPhone,
//           currentAddress: userAddress,
//           onSave: (name, title, email, phone, address) {
//             setState(() {
//               userName = name;
//               userTitle = title;
//               userEmail = email;
//               userPhone = phone;
//               userAddress = address;
//             });
//           },
//         ),
//       ),
//     );
//   }

//   // Quick edit dialog for individual fields
//   void _editField(
//     String fieldName,
//     String currentValue,
//     Function(String) onSave,
//   ) {
//     final controller = TextEditingController(text: currentValue);

//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Edit $fieldName'),
//         content: TextField(
//           controller: controller,
//           decoration: InputDecoration(
//             labelText: fieldName,
//             border: const OutlineInputBorder(),
//           ),
//           keyboardType: fieldName == "Phone"
//               ? TextInputType.phone
//               : fieldName == "Email"
//               ? TextInputType.emailAddress
//               : TextInputType.text,
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               onSave(controller.text);
//               Navigator.pop(context);
//             },
//             child: const Text('Save'),
//           ),
//         ],
//       ),
//     );
//   }

//   // Change profile picture functionality
//   void _changeProfilePicture() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) => Container(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               'Change Profile Picture',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildImageOption(Icons.camera_alt, 'Camera', () {
//                   // Implement camera functionality
//                   Navigator.pop(context);
//                   _showSnackBar(
//                     'Camera functionality would be implemented here',
//                   );
//                 }),
//                 _buildImageOption(Icons.photo_library, 'Gallery', () {
//                   // Implement gallery functionality
//                   Navigator.pop(context);
//                   _showSnackBar(
//                     'Gallery functionality would be implemented here',
//                   );
//                 }),
//                 _buildImageOption(Icons.delete, 'Remove', () {
//                   setState(() {
//                     profileImageUrl =
//                         "https://i.pravatar.cc/300?t=${DateTime.now().millisecondsSinceEpoch}";
//                   });
//                   Navigator.pop(context);
//                 }),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildImageOption(IconData icon, String label, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.grey[100],
//               shape: BoxShape.circle,
//             ),
//             child: Icon(icon, size: 30, color: const Color(0xFF2196F3)),
//           ),
//           const SizedBox(height: 8),
//           Text(label, style: const TextStyle(fontSize: 14)),
//         ],
//       ),
//     );
//   }

//   // Logout confirmation dialog
//   void _showLogoutDialog() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: const Text('Log Out'),
//         content: const Text('Are you sure you want to log out?'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text('Cancel'),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//               _showSnackBar('Logged out successfully');
//               // Implement actual logout logic here
//             },
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//             child: const Text('Log Out', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showSnackBar(String message) {
//     ScaffoldMessenger.of(
//       context,
//     ).showSnackBar(SnackBar(content: Text(message)));
//   }
// }

// // Separate Edit Profile Page
// class EditProfilePage extends StatefulWidget {
//   final String currentName;
//   final String currentTitle;
//   final String currentEmail;
//   final String currentPhone;
//   final String currentAddress;
//   final Function(String, String, String, String, String) onSave;

//   const EditProfilePage({
//     super.key,
//     required this.currentName,
//     required this.currentTitle,
//     required this.currentEmail,
//     required this.currentPhone,
//     required this.currentAddress,
//     required this.onSave,
//   });

//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   late TextEditingController _nameController;
//   late TextEditingController _titleController;
//   late TextEditingController _emailController;
//   late TextEditingController _phoneController;
//   late TextEditingController _addressController;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.currentName);
//     _titleController = TextEditingController(text: widget.currentTitle);
//     _emailController = TextEditingController(text: widget.currentEmail);
//     _phoneController = TextEditingController(text: widget.currentPhone);
//     _addressController = TextEditingController(text: widget.currentAddress);
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _titleController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _addressController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Edit Profile',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: const Color(0xFF2196F3),
//         iconTheme: const IconThemeData(color: Colors.white),
//         actions: [
//           TextButton(
//             onPressed: _saveChanges,
//             child: const Text(
//               'Save',
//               style: TextStyle(color: Colors.white, fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             _buildTextField(_nameController, 'Full Name', Icons.person),
//             const SizedBox(height: 16),
//             _buildTextField(_titleController, 'Job Title', Icons.work),
//             const SizedBox(height: 16),
//             _buildTextField(
//               _emailController,
//               'Email',
//               Icons.email,
//               TextInputType.emailAddress,
//             ),
//             const SizedBox(height: 16),
//             _buildTextField(
//               _phoneController,
//               'Phone',
//               Icons.phone,
//               TextInputType.phone,
//             ),
//             const SizedBox(height: 16),
//             _buildTextField(_addressController, 'Address', Icons.location_on),
//             const SizedBox(height: 32),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: _saveChanges,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF2196F3),
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 child: const Text(
//                   'Save Changes',
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//     TextEditingController controller,
//     String label,
//     IconData icon, [
//     TextInputType? keyboardType,
//   ]) {
//     return TextField(
//       controller: controller,
//       keyboardType: keyboardType,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, color: const Color(0xFF2196F3)),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Color(0xFF2196F3), width: 2),
//         ),
//       ),
//     );
//   }

//   void _saveChanges() {
//     widget.onSave(
//       _nameController.text,
//       _titleController.text,
//       _emailController.text,
//       _phoneController.text,
//       _addressController.text,
//     );
//     Navigator.pop(context);
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Profile updated successfully')),
//     );
//   }
// }
