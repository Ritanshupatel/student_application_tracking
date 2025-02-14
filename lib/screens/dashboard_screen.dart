import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_application_tracking/providers/auth_provider.dart';
import 'login_screen.dart';
import 'application_status_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).signOut();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginScreen()));
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => ApplicationStatusScreen()));
          },
          child: Text('Check Application Status'),
        ),
      ),
    );
  }
}
