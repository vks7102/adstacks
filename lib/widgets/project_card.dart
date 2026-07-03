import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key});

  Widget projectItem({
    required String title,
    required String projectNo,
    required bool isSelected,
    required String imagePath,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFFE54B6A)
            : const Color(0xFF1C2555),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Project Image
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 14),

          // Text Section
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Row(
                  children: [
                    Text(
                      projectNo,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(width: 8),

                    const Text(
                      "•",
                      style: TextStyle(color: Colors.white54),
                    ),

                    const SizedBox(width: 8),

                    const Text(
                      "See project details",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Edit Icon
          Icon(
            Icons.edit_outlined,
            color: Colors.white.withOpacity(0.9),
            size: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF0E1B4D),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "All Projects",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          projectItem(
            title: "Technology behind the Blockchain",
            projectNo: "Project #1",
            isSelected: true,
            imagePath: "assets/images/project1.png",
          ),

          projectItem(
            title: "Technology behind the Blockchain",
            projectNo: "Project #1",
            isSelected: false,
            imagePath: "assets/images/project2.png",
          ),

          projectItem(
            title: "Technology behind the Blockchain",
            projectNo: "Project #1",
            isSelected: false,
            imagePath: "assets/images/project3.png",
          ),
        ],
      ),
    );
  }
}