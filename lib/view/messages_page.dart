import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  final List<Message> messages = [
    Message('Your current data plan has expired.', DateTime.now().subtract(Duration(days: 1))),
    Message('You have used 90% of your monthly data.', DateTime.now().subtract(Duration(days: 2))),
    Message('Your SIM card has been temporarily disabled due to suspicious activity.', DateTime.now().subtract(Duration(days: 3))),
    Message('Your credit has ended. Please top up to continue service.', DateTime.now().subtract(Duration(days: 4))),
    Message('Welcome to our network! Your SIM card has been activated.', DateTime.now().subtract(Duration(days: 5))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Icon(Icons.message),
              title: Text(message.text),
              subtitle: Text(message.timestamp.toString()),
            ),
          );
        },
      ),
    );
  }
}

class Message {
  final String text;
  final DateTime timestamp;

  Message(this.text, this.timestamp);
}
