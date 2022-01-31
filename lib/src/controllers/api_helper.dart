import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:linuxquiz/src/keys.dart' as keys;
import 'package:linuxquiz/src/models/api_model.dart';

class NetWorkHelper {
  final String url = "https://quizapi.io/api/v1/questions?limit=20";
  final String apiKey = keys.apiKey;

  Future<List<APIModel>> getData(String category, String diffi) async {
    String cat = category == "Mix" ? "" : "&category=$category";
    String difficulty = diffi == "" ? "" : "&difficulty=$diffi";
    Uri link = Uri.parse(url + cat + difficulty);
    Map<String, String> header = {'X-Api-Key': apiKey};
    http.Response res = await http.get(link, headers: header);

    if (res.statusCode == 200) {
      return (jsonDecode(res.body) as List)
          .map((el) => APIModel.fromJson(el))
          .toList();
    } else {
      print(res.body);
      throw Exception(res.statusCode);
    }
  }

  Future<List<APIModel>> sample() async {
    List<APIModel> op = [
      APIModel(
          id: 1,
          question: "First Quest",
          multipleCorrectAnswers: false,
          difficulty: "Easy",
          explanation: "IDK",
          tip: "",
          answers: ["asdas", "asnfklan", "haisnf", "askdlöas"],
          correctAnswers: ["true", "false", "false", "false", "false", "false"],
          choosenAnswers: []),
      APIModel(
          id: 2,
          question: "Another quest",
          multipleCorrectAnswers: false,
          difficulty: "Easy",
          explanation: "Google",
          tip: "",
          answers: ["asdklsad", "ahskdn", "asdmlas"],
          correctAnswers: ["false", "false", "true" "false", "false", "false"],
          choosenAnswers: [])
    ];
    await Future.delayed(const Duration(seconds: 1), () => op);
    return op;
  }
}
