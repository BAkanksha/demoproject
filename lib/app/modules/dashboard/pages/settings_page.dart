import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_intern_app/app/modules/dashboard/dashboard_controller.dart';

class SettingsPage extends GetView<DashboardController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2196F3),
            ),
          ),
          const SizedBox(height: 16),
          _buildSettingItem(
            icon: Icons.language,
            title: 'Language',
            subtitle: 'English',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.dark_mode,
            title: 'Dark Mode',
            subtitle: 'System default',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.notifications,
            title: 'Notifications',
            subtitle: 'Enabled',
            onTap: () {},
          ),
          const SizedBox(height: 32),
          const Text(
            'Account',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2196F3),
            ),
          ),
          const SizedBox(height: 16),
          _buildSettingItem(
            icon: Icons.sync,
            title: 'Sync Data',
            subtitle: 'Last synced 2 hours ago',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.backup,
            title: 'Backup',
            subtitle: 'Auto backup enabled',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.storage,
            title: 'Storage',
            subtitle: '2.5 GB used',
            onTap: () {},
          ),
          const SizedBox(height: 32),
          const Text(
            'Support',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2196F3),
            ),
          ),
          const SizedBox(height: 16),
          _buildSettingItem(
            icon: Icons.help,
            title: 'Help Center',
            subtitle: 'Get help and support',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.feedback,
            title: 'Send Feedback',
            subtitle: 'Help us improve',
            onTap: () {},
          ),
          _buildSettingItem(
            icon: Icons.info,
            title: 'About',
            subtitle: 'Version 1.0.0',
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF2196F3)),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}