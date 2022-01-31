import 'package:flutter/material.dart';
import 'package:linuxquiz/src/controllers/api_helper.dart';
import 'package:linuxquiz/src/models/api_model.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<APIModel> data;
  int _current_pos = 0;

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
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            child: Text("Question ${_current_pos + 1}"),
          ),
          Card(
            child: Text(data[_current_pos].question),
          ),
          GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(5.0),
            children: data[_current_pos]
                .answers
                .map((e) => ListTile(
                      title: Text(e),
                      onTap: () {
                        data[_current_pos]
                            .choosenAnswers
                            .add(data[_current_pos].question.indexOf(e));
                        _current_pos++;
                        setState(() {});
                      },
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
