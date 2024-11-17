import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _firestore = FirebaseFirestore.instance;
  final TextEditingController _messageController = TextEditingController();

  String _currentBoardName = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentBoardName = ModalRoute.of(context)!.settings.arguments as String;
  }

  Future<void> _sendMessage(String message) async {
    if (message.isNotEmpty) {
      await _firestore.collection('messages').add({
        'board': _currentBoardName,
        'message': message,
        'username': 'User', // Replace 'User' with the logged-in user's name
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentBoardName),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _firestore
                  .collection('messages')
                  .where('board', isEqualTo: _currentBoardName)
                  .snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                final messages = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return ListTile(
                      title: Text(
                        message['message'],
                        style: TextStyle(fontSize: 16),
                      ),
                      subtitle: Text(
                        message['username'], // Replaces timestamp with username
                        style: TextStyle(color: Colors.grey),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _sendMessage(_messageController.text),
                  child: Text(
                    'Send',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
