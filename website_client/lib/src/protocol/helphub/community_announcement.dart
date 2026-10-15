/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _isc;

abstract class CommunityAnnouncement
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  CommunityAnnouncement._({
    this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.authorEmail,
    required this.isPinned,
    required this.createdAt,
  });

  factory CommunityAnnouncement({
    int? id,
    required String title,
    required String content,
    required String category,
    required String authorEmail,
    required bool isPinned,
    required DateTime createdAt,
  }) = _CommunityAnnouncementImpl;

  factory CommunityAnnouncement.fromJson(
    Map<String, dynamic> jsonSerialization,
  ) {
    return CommunityAnnouncement(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      content: jsonSerialization['content'] as String,
      category: jsonSerialization['category'] as String,
      authorEmail: jsonSerialization['authorEmail'] as String,
      isPinned: _isc.BoolJsonExtension.fromJson(jsonSerialization['isPinned']),
      createdAt: _isc.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String title;

  String content;

  String category;

  String authorEmail;

  bool isPinned;

  DateTime createdAt;

  /// Returns a shallow copy of this [CommunityAnnouncement]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  CommunityAnnouncement copyWith({
    int? id,
    String? title,
    String? content,
    String? category,
    String? authorEmail,
    bool? isPinned,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'CommunityAnnouncement',
      if (id != null) 'id': id,
      'title': title,
      'content': content,
      'category': category,
      'authorEmail': authorEmail,
      'isPinned': isPinned,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'CommunityAnnouncement',
      if (id != null) 'id': id,
      'title': title,
      'content': content,
      'category': category,
      'authorEmail': authorEmail,
      'isPinned': isPinned,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CommunityAnnouncementImpl extends CommunityAnnouncement {
  _CommunityAnnouncementImpl({
    int? id,
    required String title,
    required String content,
    required String category,
    required String authorEmail,
    required bool isPinned,
    required DateTime createdAt,
  }) : super._(
         id: id,
         title: title,
         content: content,
         category: category,
         authorEmail: authorEmail,
         isPinned: isPinned,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [CommunityAnnouncement]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  CommunityAnnouncement copyWith({
    Object? id = _Undefined,
    String? title,
    String? content,
    String? category,
    String? authorEmail,
    bool? isPinned,
    DateTime? createdAt,
  }) {
    return CommunityAnnouncement(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      category: category ?? this.category,
      authorEmail: authorEmail ?? this.authorEmail,
      isPinned: isPinned ?? this.isPinned,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
