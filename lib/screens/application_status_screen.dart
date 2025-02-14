import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:student_application_tracking/providers/application_provider.dart';
import 'package:student_application_tracking/widgets/progress_bar.dart';

class ApplicationStatusScreen extends StatelessWidget {
  const ApplicationStatusScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Application Status')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your application is in progress...', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Consumer<ApplicationProvider>(
              builder: (context, provider, child) {
                return ProgressBar(progress: provider.applicationStage);
              },
            ),
          ],
        ),
      ),
    );
  }
}
