import 'package:device_preview/device_preview.dart';
import 'package:digitechedge/desktop_page.dart';
import 'package:digitechedge/home_page.dart';
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
      home: const HomePage(),
    );
  }
}

class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        
        title: const Text('Responsive App'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // DESKTOP
          if (constraints.maxWidth >= 1024) {
            return const DesktopPage(); // Desktop layout
          }
          // Tablet
          else if (constraints.maxWidth >= 600) {
            return const TabletPage(); // Tablet layout
          }
          // MOBILE
          else {
            return const MobilePage(); // Mobile layout
          }
        },
      ),
    );
  }
}
