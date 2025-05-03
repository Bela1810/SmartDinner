import 'package:flutter/material.dart';
import 'package:smartdinner/model/user_model.dart';
import 'package:smartdinner/ui/widgets/bottom_nav_bar.dart'; 

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({super.key});

  @override
  _UserAccountScreenState createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  // Datos quemados del usuario
  final User _user = User(
    username: 'usuario123',
    previousPassword: '', 
    newPassword: '',     
    profileImage: 'https://images.unsplash.com/photo-1633332755192-727a05c4013d?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D', // Reemplaza con una URL o path local
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
      bottomNavigationBar: const TableBottomNavBar(currentIndex: 2, tables: [],),
    );
  }
}

//TO DO : separar widgets y refactorizar este codigo