import 'package:flutter/material.dart';

class MessageIconPage extends StatelessWidget {
  const MessageIconPage({super.key});

  final List<Map<String, String>> contacts = const [
    {"name": "Rahul Sharma", "status": "Busy coding Flutter apps 🚀"},
    {"name": "Priya Patil", "status": "Available"},
    {"name": "Akash Deshmukh", "status": "At college 📚"},
    {"name": "Sneha Kulkarni", "status": "In a meeting"},
    {"name": "Rohan Wankhede", "status": "Gym time 💪"},
    {"name": "Anjali Joshi", "status": "Feeling happy 😊"},
    {"name": "Vikram Singh", "status": "Urgent calls only"},
    {"name": "Pooja Yadav", "status": "At work"},
    {"name": "Karan Mehta", "status": "Learning Flutter"},
    {"name": "Neha Gupta", "status": "Online"},
    {"name": "Aditya Patil", "status": "Traveling ✈️"},
    {"name": "Sakshi Verma", "status": "Available"},
    {"name": "Omkar Pawar", "status": "Cricket lover 🏏"},
    {"name": "Vaishnavi Jadhav", "status": "Studying"},
    {"name": "Harsh Agrawal", "status": "At the office"},
    {"name": "Aarti Mishra", "status": "Sleeping 😴"},
    {"name": "Shubham Chavan", "status": "Busy"},
    {"name": "Tanvi Joshi", "status": "Listening to music 🎵"},
    {"name": "Pratik More", "status": "Available"},
    {"name": "Deepali Patil", "status": "Family time ❤️"},
    {"name": "Yash Thakur", "status": "Coding all day"},
    {"name": "Meera Nair", "status": "Coffee first ☕"},
    {"name": "Nikhil Sharma", "status": "At university"},
    {"name": "Ritika Kapoor", "status": "Weekend vibes 😎"},
    {"name": "Saurabh Jain", "status": "Working remotely"},
    {"name": "Komal Deshpande", "status": "Shopping 🛍️"},
    {"name": "Aniket Bhondekar", "status": "Building WhatsApp Clone 📱"},
    {"name": "Pallavi Kulkarni", "status": "Reading books 📖"},
    {"name": "Aman Tiwari", "status": "Available"},
    {"name": "Divya Shinde", "status": "Good vibes only ✨"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF008069),
        iconTheme: const IconThemeData(color: Colors.white),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select contact',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              '${contacts.length} contacts',
              style: const TextStyle(color: Colors.white70, fontSize: 13),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert, color: Colors.white), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        itemCount: contacts.length + 3,
        itemBuilder: (context, index) {
          if (index == 0) {
            return const ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF25D366),
                child: Icon(Icons.group, color: Colors.white),
              ),
              title: Text('New group', style: TextStyle(fontWeight: FontWeight.bold)),
            );
          }
          if (index == 1) {
            return ListTile(
              leading: const CircleAvatar(
                backgroundColor: Color(0xFF25D366),
                child: Icon(Icons.person_add, color: Colors.white),
              ),
              title: const Text('New contact', style: TextStyle(fontWeight: FontWeight.bold)),
              trailing: IconButton(
                icon: const Icon(Icons.qr_code, color: Colors.grey),
                onPressed: () {},
              ),
            );
          }
          if (index == 2) {
            return const ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF25D366),
                child: Icon(Icons.groups, color: Colors.white),
              ),
              title: Text('New community', style: TextStyle(fontWeight: FontWeight.bold)),
            );
          }

          final contact = contacts[index - 3];
          return ListTile(
            onTap: () {
              print("Selected: ${contact['name']}");
            },
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              child: const Icon(Icons.person, color: Colors.white),
            ),
            title: Text(
              contact['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            subtitle: Text(
              contact['status']!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          );
        },
      ),
    );
  }
}