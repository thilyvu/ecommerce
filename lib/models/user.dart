class UserType {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final bool isDarkMode;

  const UserType({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.isDarkMode,
  });

  UserType copy({
    String? imagePath,
    String? name,
    String? email,
    String? about,
    bool? isDarkMode,
  }) =>
      UserType(
          imagePath: imagePath ?? this.imagePath,
          name: name ?? this.name,
          email: email ?? this.email,
          about: about ?? this.about,
          isDarkMode: isDarkMode ?? this.isDarkMode);

  static UserType fromJson(Map<String, dynamic> json) => UserType(
      imagePath: json['imagePath'],
      name: json['name'],
      email: json['email'],
      about: json['about'],
      isDarkMode: json['isDarkMode']);

  Map<String, dynamic> toJson() => {
        'imagePath': imagePath,
        'name': name,
        'email': email,
        'about': about,
        'isDarkMode': isDarkMode
      };
}
