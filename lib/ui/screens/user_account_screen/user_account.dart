import 'package:flutter/material.dart';
import 'package:smartdinner/domain/model/user_model.dart';
import 'package:smartdinner/ui/screens/auth/auth_screen.dart';
import 'package:smartdinner/ui/screens/table_screen/table_screen.dart';
import 'package:smartdinner/ui/widgets/bottom_nav_bar.dart';
import 'package:smartdinner/ui/widgets/profile_image.dart';
import 'package:smartdinner/ui/widgets/user_account_form.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({super.key});

  @override
  _UserAccountScreenState createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  final User _user = User(
    username: 'usuario123',
    previousPassword: '',
    newPassword: '',
    profileImage:
        'https://images.unsplash.com/photo-1633332755192-727a05c4013d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D',
  );

  final _usernameController = TextEditingController();
  final _previousPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _usernameController.text = _user.username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CUENTA',
          style: TextStyle(
            color: Color(0xFF073B4C),
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TableScreen()),
            );
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AuthScreen()));
              }),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            UserProfileImage(imageUrl: _user.profileImage),
            SizedBox(height: 55),
            UserAccountForm(
              usernameController: _usernameController,
              previousPasswordController: _previousPasswordController,
              newPasswordController: _newPasswordController,
              onSave: () {
                setState(() {
                  _user.username = _usernameController.text;
                  _user.previousPassword = _previousPasswordController.text;
                  _user.newPassword = _newPasswordController.text;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Cambios guardados')),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: const TableBottomNavBar(currentIndex: 2, tables: []),
    );
  }
}
