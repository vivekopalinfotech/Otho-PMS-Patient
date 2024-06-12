class LogInResponse {
  final bool valid;
  final String email;
  final String accessToken;
  final String refreshToken;
  final String errorMessage;
  final int numberOfAttemptsRemaining;

  LogInResponse({
    required this.valid,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
    required this.errorMessage,
    required this.numberOfAttemptsRemaining,
  });

  factory LogInResponse.fromJson(Map<String, dynamic> json)
  {
    return LogInResponse(
      valid: json['valid'] ?? false,
      email: json['email'] ?? '',
      accessToken: json['accessToken'] ?? '',
      refreshToken: json['refreshToken'] ?? '',
      errorMessage: json['errorMessage'] ?? '',
      numberOfAttemptsRemaining: json['numberOfAttemptsRemaining'] ?? 0,
    );
  }
}
