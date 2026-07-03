import 'package:flutter/material.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return Container(
          height: isMobile ? 240 : 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            image: const DecorationImage(
              image: AssetImage("assets/images/banner_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Container(
              padding: EdgeInsets.all(isMobile ? 24 : 40),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.black.withOpacity(.20),
                    Colors.transparent,
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: FractionallySizedBox(
                  widthFactor: isMobile ? 0.55 : 0.45,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "ETHEREUM 2.0",
                          style: TextStyle(
                            color: Colors.white.withOpacity(.8),
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),

                      SizedBox(height: isMobile ? 6 : 10),

                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Top Rating\nProject",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: isMobile ? 22 : 30,
                            fontWeight: FontWeight.bold,
                            height: 1.1,
                          ),
                        ),
                      ),

                      SizedBox(height: isMobile ? 8 : 12),

                      FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Trending project and high rating\nProject Created by team.",
                          style: TextStyle(
                            color: Colors.white.withOpacity(.75),
                            fontSize: 13,
                          ),
                        ),
                      ),

                      SizedBox(height: isMobile ? 14 : 20),

                      SizedBox(
                        width: isMobile ? 110 : 140,
                        height: isMobile ? 38 : 46,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff17182D),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              "Learn More",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
