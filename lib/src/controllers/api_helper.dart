import 'package:http/http.dart' as http;
import 'package:linuxquiz/src/models/api_model.dart';

class NetWorkHelper {
  final String url = "https://quizapi.io/api/v1/questions";
  final String apiKey = "";

  Future<List<APIModel>> getData() async {
    List<APIModel> op = const [
      APIModel(
          id: 1,
          question: "First Quest",
          multipleCorrectAnswers: false,
          difficulty: "Easy",
          explanation: "IDK",
          answers: ["asdas", "asnfklan", "haisnf", "askdlöas"],
          correctAnswers: ["true", "false", "false", "false", "false", "false"],
          choosenAnswers: []),
      APIModel(
          id: 2,
          question: "Another quest",
          multipleCorrectAnswers: false,
          difficulty: "Easy",
          explanation: "Google",
          answers: ["asdklsad", "ahskdn", "asdmlas"],
          correctAnswers: ["false", "false", "true" "false", "false", "false"],
          choosenAnswers: [])
    ];
    await Future.delayed(const Duration(seconds: 1), () => op);
    return op;
  }
}
