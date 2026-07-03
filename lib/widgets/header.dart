import 'package:flutter/material.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;

        return Container(
          height: isMobile ? 60 : 80,
          padding: EdgeInsets.symmetric(
            horizontal: isMobile ? 0 : 24,
            vertical: isMobile ? 0 : 12,
          ),
          child: Row(
            children: [
              if (isMobile)
                Builder(
                  builder: (ctx) => IconButton(
                    icon: const Icon(Icons.menu, color: Color(0xff1F1F1F)),
                    onPressed: () => Scaffold.of(ctx).openDrawer(),
                  ),
                ),

              Text(
                "Home",
                style: TextStyle(
                  fontSize: isMobile ? 24 : 34,
                  color: const Color(0xffB3B3B3),
                  fontWeight: FontWeight.w500,
                ),
              ),

              const Spacer(),

              if (!isMobile)
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: constraints.maxWidth * 0.30,
                    minWidth: 140,
                  ),
                  child: Container(
                    height: 48,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    decoration: BoxDecoration(
                      color: const Color(0xff211A3E),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: TextField(
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(
                                color: Colors.white70,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.search,
                          color: Colors.white70,
                        ),
                      ],
                    ),
                  ),
                ),

              if (isMobile)
                IconButton(
                  icon: const Icon(Icons.search, color: Color(0xff1F1F1F)),
                  onPressed: () {},
                ),

              if (!isMobile) ...[
                const SizedBox(width: 12),

                const Icon(
                  Icons.message_outlined,
                  size: 30,
                  color: Color(0xff1F1F1F),
                ),

                const SizedBox(width: 20),

                Stack(
                  children: [
                    const Icon(
                      Icons.notifications_none,
                      size: 30,
                      color: Color(0xff1F1F1F),
                    ),
                    Positioned(
                      right: 2,
                      top: 2,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                ),

                const SizedBox(width: 20),

                const Icon(
                  Icons.power_settings_new,
                  size: 30,
                  color: Color(0xff1F1F1F),
                ),

                const SizedBox(width: 120),

                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                  ),
                  child: const CircleAvatar(
                    backgroundImage:
                    AssetImage("assets/images/profile.png"),
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
