import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final List<String> topics = [
    "Linux",
    "DevOps",
    "Networking",
    "Programming",
    "Cloud",
    "Mix"
  ];
  String _selectedTopic = "Linux";
  final List<String> difficultys = ["Easy", "Medium", "Hard", "Mix"];
  String _selectedDifficulty = "Easy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Linux / Programmer Quiz"),
      ),
      body: Column(
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
          ElevatedButton(onPressed: () {}, child: const Text("Start"))
        ],
      ),
    );
  }
}
