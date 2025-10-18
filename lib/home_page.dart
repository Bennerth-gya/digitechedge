import 'package:digitechedge/letushelpyou.dart';
import 'package:digitechedge/projects.dart';
import 'package:digitechedge/services_page.dart';
import 'package:digitechedge/welcome_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Define breakpoints
        double width = constraints.maxWidth;
        bool isMobile = width < 600;
        bool isTablet = width >= 600 && width < 1024;
        bool isDesktop = width >= 1024;

        // Responsive values
        double appBarHeight = isMobile ? 200 : isTablet ? 300 : 400;
        double containerHeight = isMobile ? 300 : isTablet ? 400 : 500;
        double fontSize = isMobile ? 16 : isTablet ? 24 : 32;
        EdgeInsets contentPadding = isMobile
            ? const EdgeInsets.all(8)
            : const EdgeInsets.symmetric(horizontal: 32, vertical: 16);

        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: const Icon(Icons.menu),
                pinned: true,
                expandedHeight: 320,
                title: const Text('S L I V E R A P P B A R'),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'lib/images/bigcomapany.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // First Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: contentPadding,
                  child: Container(
                    height: 500,
                    color: Colors.deepPurple,
                    child: Center(
                      child:WelcomePage()
                    ),
                  ),
                ),
              ),

              // Spacing
              const SliverToBoxAdapter(child: SizedBox(height:20)),

              // Second Section
            SliverToBoxAdapter(
            child: Column(
              children: [
                ProjectsPage(),
                Padding(
                  padding: contentPadding,
                  child: Container(
                    height: 1500,
                    child: Center(
                      child:ServicesPage()
                    ),
                  ),
                ),
              ],
            ),
          ),



              // Third Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: contentPadding,
                  child: Container(
                    height: 600,
                    color: Colors.deepPurple,
                    child: Center(
                      child: LetUsHelpYou(),
                      ),
                    ),
                  ),
                ),
              

              // Fourth Section (Black)
              SliverToBoxAdapter(
                child: Padding(
                  padding: contentPadding,
                  child: Container(
                    height: containerHeight,
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        'Responsive Container 4',
                        style: TextStyle(
                          fontSize: fontSize,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
