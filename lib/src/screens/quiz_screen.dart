import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:linuxquiz/src/controllers/api_helper.dart';
import 'package:linuxquiz/src/models/api_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<APIModel> data = [];
  int _currentPos = 0;

  Future fillList() async {
    data = await NetWorkHelper().getData();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fillList();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return data.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Material(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 15.0),
                  Card(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Question ${_currentPos + 1}",
                          style: const TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: height * 0.3,
                    child: Card(
                      child: Center(
                          child: AutoSizeText(data[_currentPos].question)),
                    ),
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: const EdgeInsets.all(5.0),
                      children: data[_currentPos]
                          .answers
                          .map((e) => ListTile(
                                title: Center(child: AutoSizeText(e)),
                                onTap: () {
                                  data[_currentPos].choosenAnswers.add(
                                      data[_currentPos].question.indexOf(e));
                                  _currentPos++;
                                  setState(() {});
                                },
                              ))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
