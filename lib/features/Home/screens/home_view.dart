import 'package:flutter/material.dart';

import '../../../shared/widget/app_bottom_nav_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  void onBottomNavTap(int index) {
    setState(() {
      currentIndex = index;
    });

    if (index == 0) {
      // Home
    } else if (index == 1) {
      // Community / Network
    } else if (index == 2) {
      // Add
    } else if (index == 3) {
      // Message
    } else if (index == 4) {
      // Saved
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 30, 24, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),

              const SizedBox(height: 22),

              _buildBanner(),

              const SizedBox(height: 22),

              const Text(
                'Find Your Job',
                style: TextStyle(
                  color: Color(0xFF150B4D),
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 20),

              _buildJobStats(),

              const SizedBox(height: 22),

              const Text(
                'Recent Job List',
                style: TextStyle(
                  color: Color(0xFF150B4D),
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),

              const SizedBox(height: 16),

              _buildRecentJobCard(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: currentIndex,
        onTap: onBottomNavTap,
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        const Expanded(
          child: Text(
            'Hello\nOrlando Diggs.',
            style: TextStyle(
              color: Color(0xFF150B4D),
              fontSize: 20,
              fontWeight: FontWeight.w800,
              height: 1.15,
            ),
          ),
        ),
        CircleAvatar(
          radius: 18,
          backgroundColor: const Color(0xFFE9DDFF),
          child: ClipOval(
            child: Image.asset(
              'assets/images/img.png',
              width: 36,
              height: 36,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.person,
                  color: Color(0xFF1B0066),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBanner() {
    return Container(
      width: double.infinity,
      height: 130,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1B0066),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          const Positioned(
            left: 0,
            top: 0,
            child: Text(
              '50% off\ntake any courses',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 8,
            child: Container(
              width: 78,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color(0xFFFCA34D),
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Text(
                'Join Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Positioned(
            right: -8,
            bottom: -12,
            child: Image.asset(
              'assets/images/office-girl.png',
              width: 135,
              height: 135,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 90,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildJobStats() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              color: const Color(0xFFB7F0FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.badge_outlined,
                  color: Color(0xFF150B4D),
                  size: 30,
                ),
                SizedBox(height: 18),
                Text(
                  '44.5k',
                  style: TextStyle(
                    color: Color(0xFF150B4D),
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'Remote Job',
                  style: TextStyle(
                    color: Color(0xFF150B4D),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Column(
            children: [
              _buildSmallStatCard(
                value: '66.8k',
                label: 'Full Time',
                color: const Color(0xFFC5A8FF),
              ),
              const SizedBox(height: 18),
              _buildSmallStatCard(
                value: '38.9k',
                label: 'Part Time',
                color: const Color(0xFFFFD1A3),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSmallStatCard({
    required String value,
    required String label,
    required Color color,
  }) {
    return Container(
      height: 66,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF150B4D),
              fontSize: 15,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF150B4D),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentJobCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(18),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 18,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: const BoxDecoration(
                  color: Color(0xFFE9DDFF),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.apple,
                  color: Colors.black,
                  size: 28,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Designer',
                      style: TextStyle(
                        color: Color(0xFF150B4D),
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Google inc · California, USA',
                      style: TextStyle(
                        color: Color(0xFF6E6885),
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.bookmark_border,
                color: Color(0xFF150B4D),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              const Text(
                '\$15K',
                style: TextStyle(
                  color: Color(0xFF150B4D),
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const Text(
                '/Mo',
                style: TextStyle(
                  color: Color(0xFF6E6885),
                  fontSize: 11,
                ),
              ),
              const Spacer(),
              _buildTag('Senior designer'),
              const SizedBox(width: 8),
              _buildTag('Full time'),
              const SizedBox(width: 8),
              _buildApplyButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF6E6885),
          fontSize: 8,
        ),
      ),
    );
  }

  Widget _buildApplyButton() {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFFFE1D8),
        borderRadius: BorderRadius.circular(6),
      ),
      child: const Text(
        'Apply',
        style: TextStyle(
          color: Color(0xFFFCA34D),
          fontSize: 8,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}