import 'package:hive/hive.dart';

part 'repository_model.g.dart';

@HiveType(typeId: 0)
class RepositoryModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String fullName;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final String ownerLogin;

  @HiveField(5)
  final String ownerAvatarUrl;

  @HiveField(6)
  final int stargazersCount;

  @HiveField(7)
  final int forksCount;

  @HiveField(8)
  final String? language;

  @HiveField(9)
  final DateTime updatedAt;

  @HiveField(10)
  final DateTime createdAt;

  @HiveField(11)
  final String htmlUrl;

  @HiveField(12)
  final int watchersCount;

  @HiveField(13)
  final int openIssuesCount;

  @HiveField(14)
  final String? homepage;

  @HiveField(15)
  final bool isPrivate;

  RepositoryModel({
    required this.id,
    required this.name,
    required this.fullName,
    this.description,
    required this.ownerLogin,
    required this.ownerAvatarUrl,
    required this.stargazersCount,
    required this.forksCount,
    this.language,
    required this.updatedAt,
    required this.createdAt,
    required this.htmlUrl,
    required this.watchersCount,
    required this.openIssuesCount,
    this.homepage,
    required this.isPrivate,
  });

  // From JSON
  factory RepositoryModel.fromJson(Map<String, dynamic> json) {
    return RepositoryModel(
      id: json['id'] as int,
      name: json['name'] as String,
      fullName: json['full_name'] as String,
      description: json['description'] as String?,
      ownerLogin: json['owner']['login'] as String,
      ownerAvatarUrl: json['owner']['avatar_url'] as String,
      stargazersCount: json['stargazers_count'] as int,
      forksCount: json['forks_count'] as int,
      language: json['language'] as String?,
      updatedAt: DateTime.parse(json['updated_at'] as String),
      createdAt: DateTime.parse(json['created_at'] as String),
      htmlUrl: json['html_url'] as String,
      watchersCount: json['watchers_count'] as int,
      openIssuesCount: json['open_issues_count'] as int,
      homepage: json['homepage'] as String?,
      isPrivate: json['private'] as bool,
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'full_name': fullName,
      'description': description,
      'owner': {
        'login': ownerLogin,
        'avatar_url': ownerAvatarUrl,
      },
      'stargazers_count': stargazersCount,
      'forks_count': forksCount,
      'language': language,
      'updated_at': updatedAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'html_url': htmlUrl,
      'watchers_count': watchersCount,
      'open_issues_count': openIssuesCount,
      'homepage': homepage,
      'private': isPrivate,
    };
  }

  // Copy with
  RepositoryModel copyWith({
    int? id,
    String? name,
    String? fullName,
    String? description,
    String? ownerLogin,
    String? ownerAvatarUrl,
    int? stargazersCount,
    int? forksCount,
    String? language,
    DateTime? updatedAt,
    DateTime? createdAt,
    String? htmlUrl,
    int? watchersCount,
    int? openIssuesCount,
    String? homepage,
    bool? isPrivate,
  }) {
    return RepositoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      fullName: fullName ?? this.fullName,
      description: description ?? this.description,
      ownerLogin: ownerLogin ?? this.ownerLogin,
      ownerAvatarUrl: ownerAvatarUrl ?? this.ownerAvatarUrl,
      stargazersCount: stargazersCount ?? this.stargazersCount,
      forksCount: forksCount ?? this.forksCount,
      language: language ?? this.language,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
      htmlUrl: htmlUrl ?? this.htmlUrl,
      watchersCount: watchersCount ?? this.watchersCount,
      openIssuesCount: openIssuesCount ?? this.openIssuesCount,
      homepage: homepage ?? this.homepage,
      isPrivate: isPrivate ?? this.isPrivate,
    );
  }
}