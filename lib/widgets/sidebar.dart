import 'package:flutter/material.dart';

class Sidebar extends StatefulWidget {
  final Function(String)? onMenuSelected;

  const Sidebar({
    super.key,
    this.onMenuSelected,
  });

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  String selectedMenu = "Home";

  void selectMenu(String menu) {
    setState(() {
      selectedMenu = menu;
    });

    widget.onMenuSelected?.call(menu);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      color: const Color(0xffF8F8F8),
      child: Column(
        children: [
          /// LOGO
          Container(
            height: 90,
            alignment: Alignment.center,
            child: Image.asset(
              "assets/images/logo.png",
              height: 55,
            ),
          ),

          const Divider(),

          /// PROFILE
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xffF5C542),
                      width: 3,
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 38,
                    backgroundImage:
                    AssetImage("assets/images/profile.png"),
                  ),
                ),

                const SizedBox(height: 12),

                const Text(
                  "Pooja Mishra",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 28,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  child: const Text("Admin"),
                )
              ],
            ),
          ),

          const Divider(),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _menuItem(
                  title: "Home",
                  icon: Icons.home_rounded,
                ),

                _menuItem(
                  title: "Employees",
                  icon: Icons.groups_outlined,
                ),

                _menuItem(
                  title: "Attendance",
                  icon: Icons.fact_check_outlined,
                ),

                _menuItem(
                  title: "Summary",
                  icon: Icons.calendar_month_outlined,
                ),

                _menuItem(
                  title: "Information",
                  icon: Icons.info_outline,
                ),

                const SizedBox(height: 10),

                Container(
                  height: 55,
                  color: const Color(0xffE8EAFE),
                  padding:
                  const EdgeInsets.symmetric(horizontal: 24),
                  child: Row(
                    children: [
                      const Text(
                        "WORKSPACES",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                      )
                    ],
                  ),
                ),

                _workspaceTile("Adstacks"),
                _workspaceTile("Finance"),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              bottom: 30,
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () => selectMenu("Settings"),
                  child: Row(
                    children: const [
                      Icon(Icons.settings_outlined),
                      SizedBox(width: 20),
                      Text(
                        "Setting",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                InkWell(
                  onTap: () {
                    debugPrint("Logout Clicked");
                  },
                  child: Row(
                    children: const [
                      Icon(Icons.logout),
                      SizedBox(width: 20),
                      Text(
                        "Logout",
                        style: TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _menuItem({
    required String title,
    required IconData icon,
  }) {
    final isSelected = selectedMenu == title;

    return Container(
      height: 55,
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 3,
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: () => selectMenu(title),
          child: Container(
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xffF1F1F1)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Row(
              children: [
                const SizedBox(width: 20),
                Icon(
                  icon,
                  color: Colors.black87,
                ),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: isSelected
                        ? FontWeight.bold
                        : FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _workspaceTile(String title) {
    return ExpansionTile(
      title: Text(title),
      childrenPadding:
      const EdgeInsets.only(left: 40, bottom: 10),
      children: [
        ListTile(
          dense: true,
          title: Text("$title Project 1"),
          onTap: () {},
        ),
        ListTile(
          dense: true,
          title: Text("$title Project 2"),
          onTap: () {},
        ),
      ],
    );
  }
}