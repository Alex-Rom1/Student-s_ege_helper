abstract interface class Repository {
  String? get authToken;

  Future<void> tokenLogin({required String token});

  Future<String> getCompletion({required String prompt});
}
