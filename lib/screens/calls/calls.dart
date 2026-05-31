import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class CallsScreen extends StatelessWidget {
  const CallsScreen({super.key});

  // Mock data representing recent call logs
  final List<Map<String, dynamic>> callLogs = const [
    {
      "name": "Rahul Sharma",
      "time": "Today, 12:15 PM",
      "isMissed": false,
      "isIncoming": true,
      "isVideo": false,
    },
    {
      "name": "Priya Patil",
      "time": "Today, 10:45 AM",
      "isMissed": true,
      "isIncoming": true,
      "isVideo": false,
    },
    {
      "name": "Akash Deshmukh",
      "time": "Yesterday, 8:30 PM",
      "isMissed": false,
      "isIncoming": false,
      "isVideo": true,
    },
    {
      "name": "Sneha Kulkarni",
      "time": "Yesterday, 6:20 PM",
      "isMissed": false,
      "isIncoming": true,
      "isVideo": false,
    },
    {
      "name": "Family Group",
      "time": "Yesterday, 5:10 PM",
      "isMissed": true,
      "isIncoming": true,
      "isVideo": true,
    },
    {
      "name": "Rohan Wankhede",
      "time": "May 29, 9:15 PM",
      "isMissed": false,
      "isIncoming": false,
      "isVideo": false,
    },
    {
      "name": "Anjali Joshi",
      "time": "May 28, 7:40 PM",
      "isMissed": true,
      "isIncoming": true,
      "isVideo": false,
    },
    {
      "name": "Vikram Singh",
      "time": "May 27, 11:25 AM",
      "isMissed": false,
      "isIncoming": true,
      "isVideo": true,
    },
    {
      "name": "Pooja Yadav",
      "time": "May 26, 4:50 PM",
      "isMissed": false,
      "isIncoming": false,
      "isVideo": false,
    },
    {
      "name": "College Friends",
      "time": "May 25, 2:30 PM",
      "isMissed": true,
      "isIncoming": true,
      "isVideo": true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          // 1. CREATE CALL LINK SECTION
          ListTile(
            leading: const CircleAvatar(
              radius: 24,
              backgroundColor: Color(0xFF00A884), // WhatsApp Teal Green
              child: Icon(
                Icons.link,
                color: Colors.white,
                size: 24,
              ),
            ),
            title: const Text(
              'Create call link',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: const Text(
              'Share a link for your WhatsApp call',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {
              developer.log("Create call link pressed");
            },
          ),

          // 2. RECENT CALLS HEADER
          const Padding(
            padding: EdgeInsets.only(left: 16.0, top: 12.0, bottom: 8.0),
            child: Text(
              'Recent',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),

          // 3. CALL LOGS LIST
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: callLogs.length,
            itemBuilder: (context, index) {
              final log = callLogs[index];
              return ListTile(
                onTap: () {
                  developer.log("Viewing details for call with ${log['name']}");
                },
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, color: Colors.white, size: 30),
                ),
                title: Text(
                  log['name'],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    // Missed call names don't turn red in modern WhatsApp, only the arrow does
                    color: Colors.black.withOpacity(0.9),
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Row(
                    children: [
                      // Renders call direction arrow (Incoming vs Outgoing)
                      Icon(
                        log['isIncoming'] ? Icons.call_received : Icons.call_made,
                        size: 16,
                        // Red color for missed calls, Green color for completed calls
                        color: log['isMissed'] ? Colors.red : const Color(0xFF25D366),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        log['time'],
                        style: const TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                // Icon at the right edge (Video camera or Phone icon)
                trailing: IconButton(
                  icon: Icon(
                    log['isVideo'] ? Icons.videocam : Icons.call,
                    color: const Color(0xFF008069), // WhatsApp icon color
                  ),
                  onPressed: () {
                    developer.log("Initiating ${log['isVideo'] ? 'Video' : 'Voice'} call with ${log['name']}");
                  },
                ),
              );
            },
          ),
        ],
      ),

      // 4. FLOATING ACTION BUTTON (Call Dialer Icon)
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00A884),
        elevation: 6,
        child: const Icon(
          Icons.add_call, // Dialpad plus icon matching WhatsApp UI
          color: Colors.white,
          size: 24,
        ),
        onPressed: () {
          developer.log("Open dialer / contact selection for new call");
        },
      ),
    );
  }
}