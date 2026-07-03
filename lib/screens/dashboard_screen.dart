import 'package:flutter/material.dart';

import '../widgets/sidebar.dart';
import '../widgets/header.dart';
import '../widgets/banner_card.dart';
import '../widgets/project_card.dart';
import '../widgets/creators_table.dart';
import '../widgets/performance_chart.dart';
import '../widgets/calendar_card.dart';
import '../widgets/birthday_card.dart';
import '../widgets/anniversary_card.dart';
import 'employees_page.dart';
import 'attendance_page.dart';
import 'summary_page.dart';
import 'information_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _currentPage = "Home";

  void _onMenuSelected(String menu) {
    setState(() {
      _currentPage = menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isMobile = width < 900;

        return Scaffold(
          backgroundColor: const Color(0xffF5F6FA),
          drawer: isMobile
              ? Drawer(
                  child: Sidebar(
                    onMenuSelected: (menu) {
                      _onMenuSelected(menu);
                      Navigator.of(context).pop();
                    },
                  ),
                )
              : null,
          body: SafeArea(
            child: Builder(
              builder: (_) {
                if (isMobile) {
                  return _buildMobileLayout();
                } else if (width < 1300) {
                  return _buildTabletLayout();
                } else {
                  return _buildDesktopLayout();
                }
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 300,
          child: Sidebar(onMenuSelected: _onMenuSelected),
        ),
        Expanded(
          child: Column(
            children: [
              const DashboardHeader(),
              Expanded(child: _buildPageContent()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 260,
          child: Sidebar(onMenuSelected: _onMenuSelected),
        ),
        Expanded(
          child: Column(
            children: [
              const DashboardHeader(),
              Expanded(child: _buildPageContent()),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout() {
    if (_currentPage == "Home") {
      return SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const DashboardHeader(),
            const SizedBox(height: 16),
            _buildDashboardMobileContent(),
          ],
        ),
      );
    }
    return Column(
      children: [
        const DashboardHeader(),
        Expanded(child: _buildPageContent()),
      ],
    );
  }

  Widget _buildPageContent() {
    switch (_currentPage) {
      case "Employees":
        return const EmployeesPage();
      case "Attendance":
        return const AttendancePage();
      case "Summary":
        return const SummaryPage();
      case "Information":
        return const InformationPage();
      default:
        return _buildDashboardContent();
    }
  }

  Widget _buildDashboardContent() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            child: const Column(
              children: [
                BannerCard(),
                SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: ProjectCard()),
                    SizedBox(width: 20),
                    Expanded(child: CreatorsTable()),
                  ],
                ),
                SizedBox(height: 20),
                PerformanceChart(),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 350,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                const CalendarCard(),
                const SizedBox(height: 20),
                const BirthdayCard(),
                const SizedBox(height: 20),
                const AnniversaryCard(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDashboardMobileContent() {
    return const Column(
      children: [
        BannerCard(),
        SizedBox(height: 16),
        ProjectCard(),
        SizedBox(height: 16),
        CreatorsTable(),
        SizedBox(height: 16),
        PerformanceChart(),
        SizedBox(height: 16),
        CalendarCard(),
        SizedBox(height: 16),
        BirthdayCard(),
        SizedBox(height: 16),
        AnniversaryCard(),
      ],
    );
  }
}
