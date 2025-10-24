import 'package:device_preview/device_preview.dart';
import 'package:digitechedge/home_page.dart';
import 'package:digitechedge/screens/about_us.dart';
import 'package:digitechedge/screens/get_in_touch.dart';
import 'package:digitechedge/screens/projects_page_details.dart';
import 'package:digitechedge/screens/services_page_details.dart';
//import 'package:digitechedge/about_page.dart';
import 'package:digitechedge/services_page.dart';
//import 'package:digitechedge/projects_page_details.dart';
//import 'package:digitechedge/contact_page.dart';
import 'package:digitechedge/desktop_page.dart';
import 'package:digitechedge/mobile_page.dart';
import 'package:digitechedge/tablet_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  DevicePreview(enabled: !kReleaseMode, builder: (context) => const MyApp()),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,

      // 🔹 Define initial route
      initialRoute: '/home',

      // 🔹 Define routes for all pages
      routes: {
        '/home': (context) => const HomePage(),
        '/about': (context) => const AboutUs(),
        '/services': (context) => const ServicesPageDetails(),
        '/projects': (context) => const ProjectsPageDetails(),
        'getintouch': (context) => const GetInTouch(),
      },
    );
  }
}

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(title: const Text('Responsive App')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // 🖥️ DESKTOP VIEW
          if (constraints.maxWidth >= 1024) {
            return const DesktopPage();
          }
          // 💻 TABLET VIEW
          else if (constraints.maxWidth >= 600) {
            return const TabletPage();
          }
          // 📱 MOBILE VIEW
          else {
            return const MobilePage();
          }
        },
      ),
    );
  }
}
