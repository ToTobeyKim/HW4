import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  String _firstName = '';
  String _lastName = '';
  String _email = '';
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final doc =
            await _firestore.collection('users').doc(user.uid).get();
        setState(() {
          _firstName = doc['firstName'];
          _lastName = doc['lastName'];
          _email = user.email!;
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error loading profile: $e');
    }
  }

  Future<void> _updateProfile() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'firstName': _firstName,
          'lastName': _lastName,
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Profile updated successfully!')),
        );
      }
    } catch (e) {
      print('Error updating profile: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profile')),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    decoration: InputDecoration(labelText: 'First Name'),
                    onChanged: (value) => _firstName = value,
                    controller: TextEditingController(text: _firstName),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Last Name'),
                    onChanged: (value) => _lastName = value,
                    controller: TextEditingController(text: _lastName),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Email'),
                    enabled: false, // Email cannot be edited
                    controller: TextEditingController(text: _email),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _updateProfile,
                    child: Text('Update Profile'),
                  ),
                ],
              ),
            ),
    );
  }
}
