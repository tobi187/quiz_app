import 'package:flutter/material.dart';
import 'package:linuxquiz/src/screens/quiz_screen.dart';
import 'package:linuxquiz/src/settings/settings_view.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  static const routeName = 'introScreen';

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<String> topics = [
    "Mix",
    "DevOps",
    "Networking",
    "Code",
    "Cloud",
    "Linux"
  ];
  String _selectedTopic = "Linux";
  final List<String> difficultys = ["Mix", "Easy", "Medium", "Hard"];
  String _selectedDifficulty = "Easy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Linux / Programmer Quiz"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: Align(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Quiz Topic:"),
            DropdownButton(
                value: _selectedTopic,
                items: topics.map((e) {
                  return DropdownMenuItem(
                    child: Text(e),
                    value: e,
                  );
                }).toList(),
                onChanged: (String? item) {
                  if (item != null && item != _selectedTopic) {
                    setState(() {
                      _selectedTopic = item;
                    });
                  }
                }),
            const Text("Difficulty:"),
            DropdownButton(
              value: _selectedDifficulty,
              items: difficultys.map((e) {
                return DropdownMenuItem(
                  child: Text(e),
                  value: e,
                );
              }).toList(),
              onChanged: (String? item) {
                if (item != null && item != _selectedDifficulty) {
                  setState(() {
                    _selectedDifficulty = item;
                  });
                }
              },
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizScreen(
                        topic: _selectedTopic,
                        difficulty: _selectedDifficulty,
                      ),
                    ),
                  );
                },
                child: const Text("Start"))
          ],
        ),
      ),
    );
  }
}
