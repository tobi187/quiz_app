class APIModel {
  final int id;
  final String question;
  final bool multipleCorrectAnswers;
  final String tip;
  final String difficulty;
  final String explanation;
  final List answers;
  final List correctAnswers;
  List<int> choosenAnswers;

  APIModel(
      {required this.id,
      required this.question,
      required this.multipleCorrectAnswers,
      required this.tip,
      required this.difficulty,
      required this.explanation,
      required this.answers,
      required this.choosenAnswers,
      required this.correctAnswers});

  factory APIModel.fromJson(Map<String, dynamic> json) {
    return APIModel(
        id: json["id"],
        question: json["question"],
        multipleCorrectAnswers:
            json["multiple_correct_answers"] == "false" ? false : true,
        difficulty: json["difficulty"] ?? "",
        explanation: json["explanation"] ?? "",
        tip: json["tip"] ?? "",
        answers: [
          json["answers"]["answer_a"] ?? "",
          json["answers"]["answer_b"] ?? "",
          json["answers"]["answer_c"] ?? "",
          json["answers"]["answer_d"] ?? "",
          json["answers"]["answer_e"] ?? "",
          json["answers"]["answer_f"] ?? "",
        ].where((element) => element != "").toList(),
        correctAnswers: [
          json["correct_answers"]["answer_a_correct"],
          json["correct_answers"]["answer_b_correct"],
          json["correct_answers"]["answer_c_correct"],
          json["correct_answers"]["answer_d_correct"],
          json["correct_answers"]["answer_e_correct"],
          json["correct_answers"]["answer_f_correct"],
        ],
        choosenAnswers: []);
  }
}
