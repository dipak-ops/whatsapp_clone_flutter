import 'package:flutter/material.dart';
import '../message/message_icon_page.dart';
import 'message_icon_page.dart'; // Import the second file here

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  // Mock data representing 10 different chat threads
  final List<Map<String, dynamic>> chatData = const [
    {"name":"Akash Patil","message":"Bhai, class kab hai?","time":"10:05 AM","unreadCount":2,"isGroup":false},
    {"name":"Ritika Sharma","message":"Assignment complete ho gaya.","time":"09:50 AM","unreadCount":1,"isGroup":false},
    {"name":"Saurabh Jadhav","message":"Kal milte hain.","time":"09:30 AM","unreadCount":0,"isGroup":false},
    {"name":"Komal Deshmukh","message":"Good Morning ☀️","time":"08:45 AM","unreadCount":3,"isGroup":false},
    {"name":"Nikhil Verma","message":"Call karna free hoke.","time":"Yesterday","unreadCount":0,"isGroup":false},
    {"name":"Vaishnavi Kulkarni","message":"Notes bhej diye.","time":"Yesterday","unreadCount":5,"isGroup":false},
    {"name":"Aditya Shinde","message":"Match dekh raha hai?","time":"Tuesday","unreadCount":1,"isGroup":false},
    {"name":"Sakshi Gupta","message":"Thank you 😊","time":"Tuesday","unreadCount":0,"isGroup":false},
    {"name":"Pratik More","message":"Project submit kar diya.","time":"Monday","unreadCount":2,"isGroup":false},
    {"name":"Aarti Yadav","message":"Photo bhejna.","time":"Monday","unreadCount":4,"isGroup":false},
    {"name":"Harsh Agrawal","message":"Flutter sikh raha hu.","time":"30/05/26","unreadCount":1,"isGroup":false},
    {"name":"Tanvi Joshi","message":"Lecture cancel ho gaya.","time":"29/05/26","unreadCount":0,"isGroup":false},
    {"name":"Rohit Wankhede","message":"Kaha hai tu?","time":"28/05/26","unreadCount":6,"isGroup":false},
    {"name":"Pallavi Patwardhan","message":"See you tomorrow.","time":"27/05/26","unreadCount":0,"isGroup":false},
    {"name":"Omkar Pawar","message":"Cricket khelne aa.","time":"26/05/26","unreadCount":3,"isGroup":false},
    {"name":"Shubham Chavan","message":"Party kab de raha hai?","time":"25/05/26","unreadCount":2,"isGroup":false},
    {"name":"Meera Nair","message":"Meeting at 5 PM.","time":"24/05/26","unreadCount":0,"isGroup":false},
    {"name":"Yash Thakur","message":"Code review kar de.","time":"23/05/26","unreadCount":1,"isGroup":false},
    {"name":"Aniket Bhondekar","message":"College kab start ho raha hai?","time":"22/05/26","unreadCount":4,"isGroup":false},
    {"name":"Deepali Mishra","message":"Take care!","time":"21/05/26","unreadCount":0,"isGroup":false}

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: chatData.length,
        separatorBuilder: (context, index) => const Divider(
          indent: 85,
          height: 1,
          thickness: 0.5,
        ),
        itemBuilder: (context, index) {
          final chat = chatData[index];
          final bool hasUnread = chat['unreadCount'] > 0;

          return ListTile(
            onTap: () {
              print("Opened chat with ${chat['name']}");
            },
            leading: CircleAvatar(
              radius: 26,
              backgroundColor: Colors.grey[300],
              child: Icon(
                chat['isGroup'] ? Icons.group : Icons.person,
                color: Colors.white,
                size: 30,
              ),
            ),
            title: Text(
              chat['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                chat['message'],
                style: TextStyle(
                  color: hasUnread ? Colors.black : Colors.grey[600],
                  fontWeight: hasUnread ? FontWeight.w500 : FontWeight.normal,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat['time'],
                  style: TextStyle(
                    color: hasUnread ? const Color(0xFF25D366) : Colors.grey,
                    fontSize: 12,
                    fontWeight: hasUnread ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 6),
                if (hasUnread)
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFF25D366),
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${chat['unreadCount']}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                else
                  const SizedBox(height: 20),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF00A884),
        elevation: 6,
        child: const Icon(
          Icons.comment,
          color: Colors.white,
          size: 28,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MessageIconPage(),
            ),
          );
        },
      ),
    );
  }
}