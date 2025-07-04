import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: index % 2 == 0 
                    ? Colors.blue.withOpacity(0.1)
                    : Colors.green.withOpacity(0.1),
                child: Icon(
                  index % 2 == 0 ? Icons.info : Icons.check_circle,
                  color: index % 2 == 0 ? Colors.blue : Colors.green,
                ),
              ),
              title: Text('Notification ${index + 1}'),
              subtitle: const Text('This is a sample notification message'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${index + 1}h ago',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  if (index < 3)
                    Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.only(top: 4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}