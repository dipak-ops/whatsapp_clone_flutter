import 'package:flutter/material.dart';
import 'dart:developer' as developer; // Used for production-safe logging

class StatusScreen extends StatelessWidget {
  const StatusScreen({super.key});

  // Mock data representing contact status updates
  final List<Map<String, dynamic>> statusData = const [
    {
      "name": "Rahul Sharma",
      "time": "Just now",
      "statusCount": 2,
      "isViewed": false,
    },
    {
      "name": "Priya Patil",
      "time": "15 minutes ago",
      "statusCount": 1,
      "isViewed": false,
    },
    {
      "name": "Akash Deshmukh",
      "time": "30 minutes ago",
      "statusCount": 4,
      "isViewed": false,
    },
    {
      "name": "Sneha Kulkarni",
      "time": "Today, 11:45 AM",
      "statusCount": 2,
      "isViewed": true,
    },
    {
      "name": "Rohan Wankhede",
      "time": "Today, 10:20 AM",
      "statusCount": 3,
      "isViewed": true,
    },
    {
      "name": "Anjali Joshi",
      "time": "Today, 9:15 AM",
      "statusCount": 1,
      "isViewed": false,
    },
    {
      "name": "Vikram Singh",
      "time": "Yesterday, 9:30 PM",
      "statusCount": 5,
      "isViewed": true,
    },
    {
      "name": "Pooja Yadav",
      "time": "Yesterday, 7:10 PM",
      "statusCount": 2,
      "isViewed": true,
    },
    {
      "name": "Karan Mehta",
      "time": "Yesterday, 5:45 PM",
      "statusCount": 3,
      "isViewed": false,
    },
    {
      "name": "Neha Gupta",
      "time": "Yesterday, 3:20 PM",
      "statusCount": 1,
      "isViewed": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Separate updates into Recent (Unviewed) and Viewed categories
    final recentUpdates = statusData.where((status) => !status['isViewed']).toList();
    final viewedUpdates = statusData.where((status) => status['isViewed']).toList();

    return Scaffold(
      body: ListView(
        children: [
          // 1. MY STATUS SECTION
          ListTile(
            leading: Stack(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, color: Colors.white, size: 35),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFF25D366), // WhatsApp Green
                      shape: BoxShape.circle,
                    ),
                    padding: const EdgeInsets.all(2),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            title: const Text(
              'My status',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: const Text('Tap to add status update'),
            onTap: () {
              developer.log("Create your own status update");
            },
          ),

          // 2. RECENT UPDATES HEADER
          if (recentUpdates.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 12.0, bottom: 8.0),
              child: Text(
                'Recent updates',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: recentUpdates.length,
              itemBuilder: (context, index) {
                final status = recentUpdates[index];
                return _buildStatusRow(status);
              },
            ),
          ],

          // 3. VIEWED UPDATES HEADER
          if (viewedUpdates.isNotEmpty) ...[
            const Padding(
              padding: EdgeInsets.only(left: 16.0, top: 12.0, bottom: 8.0),
              child: Text(
                'Viewed updates',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: viewedUpdates.length,
              itemBuilder: (context, index) {
                final status = viewedUpdates[index];
                return _buildStatusRow(status);
              },
            ),
          ],
        ],
      ),

      // Floating Action Buttons for Status (Text status & Camera status)
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton.small(
            heroTag: 'textStatusFab',
            backgroundColor: Colors.grey[200],
            elevation: 4,
            child: const Icon(Icons.edit, color: Colors.blueGrey),
            onPressed: () {},
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            heroTag: 'cameraStatusFab',
            backgroundColor: const Color(0xFF00A884),
            elevation: 6,
            child: const Icon(Icons.camera_alt, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  // Helper widget builder to draw the status items cleanly
  Widget _buildStatusRow(Map<String, dynamic> status) {
    final bool isViewed = status['isViewed'];

    return ListTile(
      onTap: () {
        developer.log("Viewing status update from ${status['name']}");
      },
      leading: Container(
        padding: const EdgeInsets.all(2.5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isViewed ? Colors.grey : const Color(0xFF25D366),
            width: 2.5,
          ),
        ),
        child: CircleAvatar(
          radius: 22,
          backgroundColor: Colors.grey[300],
          child: const Icon(Icons.person, color: Colors.white, size: 28),
        ),
      ),
      title: Text(
        status['name'],
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
      subtitle: Text(status['time']),
    );
  }
}