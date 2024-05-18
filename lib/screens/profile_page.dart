import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evoltsoft/components/my_button.dart';
import 'package:evoltsoft/screens/address_screen.dart';
import 'package:evoltsoft/screens/change_password_screen.dart';
import 'package:evoltsoft/screens/help_screen.dart';
import 'package:evoltsoft/screens/history_screen.dart';
import 'package:evoltsoft/screens/settings_screen.dart';
import 'package:evoltsoft/screens/user_details_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:evoltsoft/services/auth/auth_service.dart';

class ProfilePage extends StatefulWidget {
  final String uid;

  const ProfilePage({
    super.key,
    required this.uid,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        surfaceTintColor: Colors.white,
        title: const Text(
          "Profile",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(widget.uid)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(
                child: MyButton(
              onTap: logout,
              text: "LogOut",
            ));
          }

          var userData = snapshot.data!.data()!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade900,
                        width: 3,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        userData['photoURL'] ??
                            'https://www.shutterstock.com/image-vector/default-avatar-profile-icon-social-600nw-1677509740.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    userData['name'] ?? 'No Name',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.call),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "+91 ${userData['phoneNum']}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.alternate_email_rounded),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        userData['userName'] ?? 'No Username',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailsScreen(
                            userName: userData['userName'],
                            phoneNumber: userData['phoneNum'],
                            image: userData['photoURL'],
                            fullName: userData['name'],
                            isEditing: true,
                          ),
                        ),
                      );
                      setState(() {});
                    },
                    child: Container(
                      height: 50,
                      width: 140,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey.shade900,
                      ),
                      child: const Center(
                        child: Text(
                          "Edit Profile",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.grey.shade300,
                  indent: 20,
                  endIndent: 20,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsPage(),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.settings_suggest_outlined,
                              color: Colors.grey.shade900,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Settings",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey.shade900,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddressScreen(),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              CupertinoIcons.map_pin_ellipse,
                              color: Colors.grey.shade900,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Address",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey.shade900,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HistoryScreen(),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.history,
                              color: Colors.grey.shade900,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "History",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey.shade900,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChangePasswordScreen(),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.lock_outline_rounded,
                              color: Colors.grey.shade900,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Change Password",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey.shade900,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Divider(
                        color: Colors.grey.shade300,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HelpScreen(),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.help_outline_rounded,
                              color: Colors.grey.shade900,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Help & Support",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: Colors.grey.shade900,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () => showLogoutDialog(context),
                        child: Row(
                          children: [
                            Icon(
                              Icons.logout_rounded,
                              color: Colors.grey.shade900,
                              size: 30,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "Log Out",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  void showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text("Log Out"),
          content: const Text("Are you sure you want to log out?"),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text(
                "No",
                style: TextStyle(
                  color: Colors.blue.shade900,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            CupertinoDialogAction(
              child: const Text(
                "Yes",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                logout();
              },
            ),
          ],
        );
      },
    );
  }
}
