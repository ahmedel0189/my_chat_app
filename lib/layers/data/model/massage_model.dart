class MassageModel {
  final String massgae;
  final String id;
  MassageModel({
    required this.massgae,
    required this.id,
  });

  factory MassageModel.fromjson(json) {
    return MassageModel(
      massgae: json['message'],
      id: json['id'],
    );
  }
}
