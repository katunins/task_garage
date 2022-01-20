class GetUserBody {
  final String code;

  GetUserBody({required this.code});

  Map<String, dynamic> toApi() {
    return {
      'data': code,
    };
  }
}
