class Response {
  final int errorNum;
  final int successNum;

  Response({required this.errorNum, required this.successNum});

  factory Response.fromJson(Map<String, dynamic> json) {
    return Response(
      errorNum: json['errorNum'],
      successNum: json["successNum"],
    );
  }
}
