import 'package:flutter/material.dart';
import 'package:digitechedge/ourclients.dart';
import 'package:digitechedge/letushelpyou.dart';
import 'package:digitechedge/projects.dart';
import 'package:digitechedge/services_page.dart';
import 'package:digitechedge/welcome_page.dart';
import 'package:digitechedge/statscard.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: const [
            WelcomePage(),
            ServicesPage(),
            ProjectsPage(), // 👈 this one now has fixed height
            LetUsHelpYou(),
            StatsSection(),
            OurClients(),
          ],
        ),
      ),
    );
  }
}
