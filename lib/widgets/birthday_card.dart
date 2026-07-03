import 'package:flutter/material.dart';

class BirthdayCard extends StatelessWidget {
  const BirthdayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xff35304A),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "✨",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "Today Birthday",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "✨",
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),

          const SizedBox(height: 20),

          /// Avatars
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              BirthdayAvatar(
                image: "assets/images/profile.png",
              ),
              SizedBox(width: 22),
              BirthdayAvatar(
                image: "assets/images/profile.png",
              ),
            ],
          ),

          const SizedBox(height: 24),

          /// Total Row
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

          const SizedBox(height: 24),

          /// Button
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
                "Birthday Wishing",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffC96EFF),
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

class BirthdayAvatar extends StatelessWidget {
  final String image;

  const BirthdayAvatar({
    super.key,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: const Color(0xff4A4561),
            border: Border.all(
              color: const Color(0xff6555B9),
              width: 2,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: CircleAvatar(
              backgroundImage: AssetImage(image),
            ),
          ),
        ),

        Positioned(
          top: -12,
          child: Container(
            padding: const EdgeInsets.all(2),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: const Text(
              "🎂",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}