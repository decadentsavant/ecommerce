class UserData {
  UserData({
    required this.email,
    required this.uid,
  });

  UserData.fromMap(Map<String, dynamic> map)
      : email = map['email'] as String? ?? '',
        uid = map['uid'] as String? ?? '';

  String email;
  String uid;

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'uid': uid,
    };
  }
}
