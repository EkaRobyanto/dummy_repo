class ContohSoalModel {
  int? questionNumber;
  String? type;
  String? questionHeader;
  List<String>? questionImages;
  String? questionBody;
  List<List>? options;
  String? category;
  String? explanation;
  String? purpose;

  ContohSoalModel(
      {required this.questionNumber,
      required this.type,
      required this.questionHeader,
      required this.questionImages,
      required this.questionBody,
      required this.options,
      required this.category,
      required this.explanation,
      required this.purpose});

  factory ContohSoalModel.fromJson(Map<String, dynamic> json) {
    return ContohSoalModel(
      questionNumber: json['question_number'],
      type: json['type'],
      questionHeader: json['question_header'],
      questionImages: json['question_images'].cast<String>(),
      questionBody: json['question_body'],
      category: json['category'],
      explanation: json['explanation'],
      purpose: json['purpose'],
      options: json['options'].cast<List>(),
    );
  }
}
