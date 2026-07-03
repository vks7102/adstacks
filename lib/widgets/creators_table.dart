import 'package:flutter/material.dart';

class CreatorsTable extends StatelessWidget {
  const CreatorsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final creators = [
      {
        "name": "@maddison_c21",
        "artworks": "9821",
        "rating": 0.85,
        "image":
        "assets/images/profile.png",
      },
      {
        "name": "@karl.will02",
        "artworks": "7032",
        "rating": 0.75,
        "image":
        "assets/images/profile.png",
      },
      {
        "name": "@maddison_c21",
        "artworks": "9821",
        "rating": 0.88,
        "image":
        "assets/images/profile.png",
      },
      // {
      //   "name": "@maddison_c21",
      //   "artworks": "9821",
      //   "rating": 0.82,
      //   "image":
      //   "https://i.pravatar.cc/150?img=3",
      // },
    ];

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF111B4D),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Top Creators",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 30),

          // Header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "Name",
                    style: TextStyle(
                      color: Color(0xFF8A93B8),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Artworks",
                    style: TextStyle(
                      color: Color(0xFF8A93B8),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Rating",
                    style: TextStyle(
                      color: Color(0xFF8A93B8),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Divider(
            color: Color(0xFF202C63),
            thickness: 1,
          ),

          const SizedBox(height: 10),

          ...creators.map(
                (creator) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage:
                          NetworkImage(creator["image"] as String),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          creator["name"] as String,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Text(
                      creator["artworks"] as String,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: const Color(0xFF2B3468),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: creator["rating"] as double,
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFF8B5CF6),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}