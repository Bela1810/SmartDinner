import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartdinner/domain/model/user_model.dart';
import 'package:smartdinner/provider/controller_provider.dart';
import 'package:smartdinner/ui/widgets/bottom_nav_bar.dart';
import 'package:smartdinner/ui/widgets/profile_image.dart';
import 'package:google_fonts/google_fonts.dart';

class UserAccountScreen extends ConsumerStatefulWidget {
  const UserAccountScreen({super.key});

  @override
  ConsumerState<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends ConsumerState<UserAccountScreen> {
  User? _user;

  final _usernameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user_data');

    if (userData != null) {
      try {
        final userMap = jsonDecode(userData);

        final user = User.fromJson(userMap);

        setState(() {
          _user = user;
          _usernameController.text = user.name;
        });
      } catch (e) {
        //
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CUENTA',
          style: TextStyle(
              color: Color(0xFF073B4C),
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              ref.read(authControllerProvider.notifier).logout();
              context.go('/auth');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UserProfileImage(imageUrl: _user!.profileImage),
            const SizedBox(height: 30),
            Text(
              '¡BIENVENIDO A SMART DINNER!',
              textAlign: TextAlign.center,
              style: GoogleFonts.openSans(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF073B4C),
                shadows: [
                  Shadow(
                    color: Colors.blue.withOpacity(0.4),
                    offset: const Offset(2, 2),
                    blurRadius: 4,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text(
              _user!.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF073B4C)),
            ),
            const SizedBox(height: 10),
            Text(
              _user!.email,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Color(0xFF073B4C)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const TableBottomNavBar(currentIndex: 2, tables: []),
    );
  }
}
