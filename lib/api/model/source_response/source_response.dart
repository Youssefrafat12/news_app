import 'source.dart';

class SourceResponse {
  String? status;
  List<Source>? sources;
  String? code;
  String? message;

  SourceResponse({this.status, this.sources, this.code, this.message});

  factory SourceResponse.fromJson(Map<String, dynamic> json) {
    return SourceResponse(
      status: json['status'] as String?,

      code: json['code'] as String?,
      message: json['message'] as String?,
      sources: (json['sources'] as List<dynamic>?)
          ?.map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'status': status,
    'code': code,
    'message': message,
    'sources': sources?.map((e) => e.toJson()).toList(),
  };
}
