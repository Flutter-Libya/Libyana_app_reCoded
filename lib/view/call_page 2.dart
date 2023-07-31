import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CallsPage extends StatelessWidget {
  final List<Call> calls = [
    Call('1234567890', CallType.incoming, DateTime.now().subtract(Duration(days: 1)), 15, 0.75),
    Call('0987654321', CallType.outgoing, DateTime.now().subtract(Duration(days: 2)), 10, 0.50),
    Call('1122334455', CallType.missed, DateTime.now().subtract(Duration(days: 3)), 0, 0.0),
    Call('5566778899', CallType.incoming, DateTime.now().subtract(Duration(days: 4)), 5, 0.25),
    Call('9988776655', CallType.missed, DateTime.now().subtract(Duration(days: 5)), 0, 0.0),
  ];

  Color getCallColor(CallType type) {
    switch(type) {
      case CallType.incoming:
        return Colors.green;
      case CallType.outgoing:
        return Colors.blue;
      case CallType.missed:
        return Colors.red;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: calls.length,
        itemBuilder: (context, index) {
          final call = calls[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: Icon(Icons.call, color: getCallColor(call.type)),
              title: Text(
                call.number,
                style: TextStyle(color: getCallColor(call.type)),
              ),
              subtitle: Text('${call.type.toString().split('.').last} - ${DateFormat('dd-MM-yyyy').format(call.timestamp)} - ${call.callDuration} mins - ${call.callCost} Dinar'),
              trailing: IconButton(
                icon: Icon(Icons.call),
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}

class Call {
  final String number;
  final CallType type;
  final DateTime timestamp;
  final int callDuration;
  final double callCost; 

  Call(this.number, this.type, this.timestamp, this.callDuration, this.callCost);
}

enum CallType {
  incoming,
  outgoing,
  missed
}
