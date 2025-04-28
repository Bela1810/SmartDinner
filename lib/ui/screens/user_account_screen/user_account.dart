import 'package:flutter/material.dart';
import 'package:smartdinner/model/user_model.dart';
import 'package:smartdinner/ui/widgets/bottom_nav_bar.dart'; 

class UserAccountScreen extends StatefulWidget {
  @override
  _UserAccountScreenState createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  // Datos quemados del usuario
  final User _user = User(
    username: 'usuario123',
    previousPassword: '', // Inicialmente vacío
    newPassword: '',     // Inicialmente vacío
    profileImage: 'https://png.pngtree.com/png-vector/20220709/ourmid/pngtree-businessman-user-avatar-wearing-suit-with-red-tie-png-image_5809521.png', // Reemplaza con una URL o path local
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
        title: Text('CUENTA', style: 
        TextStyle(
          color: Color(0xFF073B4C),
          fontWeight: FontWeight.bold
        ),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Acción para volver atrás
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              // Acción para mostrar la lista (si es necesario)
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 130.0, 
                    backgroundImage: NetworkImage(_user.profileImage),
                    backgroundColor: Colors.grey[300],
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () {
                        print('Seleccionar imagen');
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Color(0xFF073B4C),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60.0),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Nombre de Usuario',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30.0),
            TextFormField(
              controller: _previousPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Contraseña Anterior',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30.0),
            TextFormField(
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Nueva Contraseña',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              onPressed: () {
                // Acción para guardar cambios
                setState(() {
                  _user.username = _usernameController.text;
                  _user.previousPassword = _previousPasswordController.text;
                  _user.newPassword = _newPasswordController.text;
                  // Aquí podrías implementar la lógica para guardar los cambios
                  print('Guardar cambios: ${_user.username}, ${_user.previousPassword}, ${_user.newPassword}');
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Cambios guardados')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF073B4C),
                padding: EdgeInsets.symmetric(vertical: 15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'GUARDAR CAMBIOS',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const TableBottomNavBar(),
    );
  }
}