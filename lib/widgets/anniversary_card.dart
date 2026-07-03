import 'package:flutter/material.dart';

class AnniversaryCard extends StatelessWidget {
  const AnniversaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xff1D1F38),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          /// Header
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "✨",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 8),
              Text(
                "Work Anniversary",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 8),
              Text(
                "✨",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),

          const SizedBox(height: 24),

          /// Employees
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnniversaryUser(
                image: "assets/images/profile.png",
                name: "David",
                years: "5 Years",
              ),
              AnniversaryUser(
                image: "assets/images/profile.png",
                name: "Sophia",
                years: "3 Years",
              ),
            ],
          ),

          const SizedBox(height: 24),

          /// Total Section
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  color: Color(0xff9B92B7),
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 25),
              Text(
                "|",
                style: TextStyle(
                  color: Color(0xff8F87A9),
                  fontSize: 28,
                ),
              ),
              SizedBox(width: 25),
              Text(
                "2",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 25),
              Text(
                "|",
                style: TextStyle(
                  color: Color(0xff8F87A9),
                  fontSize: 28,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 52,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.send_outlined,
                size: 18,
                color: Colors.white,
              ),
              label: const Text(
                "Anniversary Wishes",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff6C4BFF),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AnniversaryUser extends StatelessWidget {
  final String image;
  final String name;
  final String years;

  const AnniversaryUser({
    super.key,
    required this.image,
    required this.name,
    required this.years,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            const Positioned(
              left: -10,
              top: 0,
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 14,
              ),
            ),
            const Positioned(
              right: -10,
              top: 10,
              child: Icon(
                Icons.star,
                color: Colors.amber,
                size: 12,
              ),
            ),

            CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(image),
            ),

            Positioned(
              top: -16,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 3,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff6C4BFF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  years,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}