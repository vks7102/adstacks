import 'package:flutter/material.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Attendance",
                        style: TextStyle(
                          color: Color(0xFF2D3436),
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Today • July 2, 2026",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6C4BFF).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.calendar_month_rounded,
                    color: Color(0xFF6C4BFF),
                    size: 36,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _attendanceStat("Present", "18", const Color(0xFF00B894),
                  Icons.check_circle, 0.75),
              const SizedBox(width: 12),
              _attendanceStat("Late", "3", const Color(0xFFFDCB6E),
                  Icons.access_time, 0.125),
              const SizedBox(width: 12),
              _attendanceStat("Absent", "3", const Color(0xFFE17055),
                  Icons.cancel, 0.125),
            ],
          ),
          const SizedBox(height: 24),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "This Week",
                  style: TextStyle(
                    color: Color(0xFF2D3436),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _dayChip("Mon", true, const Color(0xFF00B894)),
                    _dayChip("Tue", true, const Color(0xFF00B894)),
                    _dayChip("Wed", true, const Color(0xFFFDCB6E)),
                    _dayChip("Thu", true, const Color(0xFF00B894)),
                    _dayChip("Fri", false, const Color(0xFFE17055)),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Today's Record",
            style: TextStyle(
              color: Color(0xFF2D3436),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _recordTile("Alice Wonderland", "9:00 AM", "6:00 PM", "Present",
              const Color(0xFF00B894)),
          _recordTile("Bob Builder", "9:15 AM", "6:30 PM", "Present",
              const Color(0xFF00B894)),
          _recordTile("Carol Creates", "9:30 AM", "5:00 PM", "Present",
              const Color(0xFF00B894)),
          _recordTile("Dave Designer", "10:00 AM", "-", "Late",
              const Color(0xFFFDCB6E)),
          _recordTile("Eve Engineer", "-", "-", "Absent",
              const Color(0xFFE17055)),
          _recordTile("Frank Manager", "8:45 AM", "5:30 PM", "Present",
              const Color(0xFF00B894)),
        ],
      ),
    );
  }

  Widget _attendanceStat(
      String label, String value, Color color, IconData icon, double ratio) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 22),
            ),
            const SizedBox(height: 10),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dayChip(String day, bool present, Color color) {
    return Column(
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: present
                ? color.withOpacity(0.1)
                : color.withOpacity(0.05),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: present ? color : color.withOpacity(0.3),
              width: 1.5,
            ),
          ),
          child: Icon(
            present ? Icons.check : Icons.close,
            color: color,
            size: 20,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          day,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _recordTile(
    String name,
    String checkIn,
    String checkOut,
    String status,
    Color statusColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(Icons.person, color: statusColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF2D3436),
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      checkIn == "-" ? "—" : checkIn,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: 12,
                      ),
                    ),
                    if (checkOut != "-") ...[
                      const SizedBox(width: 6),
                      Icon(Icons.arrow_forward,
                          size: 12, color: Colors.grey.shade400),
                      const SizedBox(width: 6),
                      Text(
                        checkOut,
                        style: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: statusColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
