// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserData {
  /// API 토큰
  final String accessToken;

  /// 토큰 만료 시간 (초)
  final int expireAt;

  /// 이메일
  final String email;

  /// 이름
  final String name;

  /// 학번
  final String stdNumber;

  UserData({
    required this.accessToken,
    required this.expireAt,
    required this.email,
    required this.name,
    required this.stdNumber,
  });

  UserData copyWith({
    String? accessToken,
    int? expireAt,
    String? email,
    String? name,
    String? stdNumber,
  }) {
    return UserData(
      accessToken: accessToken ?? this.accessToken,
      expireAt: expireAt ?? this.expireAt,
      email: email ?? this.email,
      name: name ?? this.name,
      stdNumber: stdNumber ?? this.stdNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'accessToken': accessToken,
      'expireAt': expireAt,
      'email': email,
      'name': name,
      'stdNumber': stdNumber,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      accessToken: map['access_token'] as String,
      expireAt: map['expires_at'] as int,
      email: map['email'] as String,
      name: map['name'] as String,
      stdNumber: map['student_number'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) => UserData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserData(accessToken: $accessToken, expireAt: $expireAt, email: $email, name: $name, stdNumber: $stdNumber)';
  }

  @override
  bool operator ==(covariant UserData other) {
    if (identical(this, other)) return true;

    return other.accessToken == accessToken &&
        other.expireAt == expireAt &&
        other.email == email &&
        other.name == name &&
        other.stdNumber == stdNumber;
  }

  @override
  int get hashCode {
    return accessToken.hashCode ^ expireAt.hashCode ^ email.hashCode ^ name.hashCode ^ stdNumber.hashCode;
  }
}
