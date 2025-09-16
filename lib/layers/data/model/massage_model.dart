class MassageModel {
  final String massgae;
  MassageModel({required this.massgae});

  factory MassageModel.fromjson(json) {
    return MassageModel(
      massgae: json['message'],
    );
  }
}
