class authUserBody {
  final String code;

  authUserBody({required this.code});

  Map<String, dynamic> toApi() {
    return {
      'data': code,
    };
  }
}
