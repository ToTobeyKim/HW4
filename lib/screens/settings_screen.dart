import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatelessWidget {
  final _auth = FirebaseAuth.instance;

  Future<void> _logout(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacementNamed(context, '/login');
  }

  Future<void> _changePassword(BuildContext scaffoldContext) async {
    try {
      await _auth.sendPasswordResetEmail(email: _auth.currentUser!.email!);
      ScaffoldMessenger.of(scaffoldContext).showSnackBar(
        SnackBar(content: Text('Password reset email sent!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(scaffoldContext).showSnackBar(
        SnackBar(content: Text('Error: Unable to send password reset email.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Builder(
        builder: (scaffoldContext) => Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text('Log Out'),
                leading: Icon(Icons.logout),
                onTap: () => _logout(context),
              ),
              Divider(),
              ListTile(
                title: Text('Change Password'),
                leading: Icon(Icons.lock),
                onTap: () => _changePassword(scaffoldContext),
              ),
              Divider(),
              ListTile(
                title: Text('Update Personal Information'),
                leading: Icon(Icons.person),
                onTap: () {
                  // Navigate to a separate page for updating DOB or other info (optional)
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
