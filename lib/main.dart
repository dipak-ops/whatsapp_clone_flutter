import 'package:flutter/material.dart';
import 'package:whatsapp_app/screens/calls/calls.dart';
import 'package:whatsapp_app/screens/camera/camerascreen.dart';
import 'package:whatsapp_app/screens/chats/chats.dart';
import 'package:whatsapp_app/screens/splashscreen.dart';
import 'package:whatsapp_app/screens/status/status.dart';
import 'package:whatsapp_app/widgets/uihelper.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0XFF00A884)),
        useMaterial3: false,
        fontFamily: "Regular",
      ),
      home: SplashScreen(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => MyHomePageState();
}


class MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF008069), // WhatsApp Brand Teal
        toolbarHeight: 55,
        title: UiHelper.CustomText(
            text: "WhatsApp",
            height: 29,
            color: Colors.white,
            fontWeight: FontWeight.bold
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 28),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, size: 28),
          ),
          const SizedBox(width: 10),
        ],
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          indicatorWeight: 3,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          tabs: const [
            Tab(icon: Icon(Icons.camera_alt)),
            Tab(text: 'CHATS'),
            Tab(text: 'STATUS'),
            Tab(text: 'CALLS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          CameraScreen(),
          ChatsScreen(),
          StatusScreen(),
          CallsScreen(),
        ],
      ),
    );
  }
}