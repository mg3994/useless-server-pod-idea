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

abstract class HazardReport
    implements _isc.SerializableModel, _isc.ProtocolSerialization {
  HazardReport._({
    this.id,
    required this.title,
    required this.description,
    required this.severity,
    required this.location,
    required this.neighborhoodZone,
    required this.reporterEmail,
    required this.isResolved,
    required this.createdAt,
  });

  factory HazardReport({
    int? id,
    required String title,
    required String description,
    required String severity,
    required String location,
    required String neighborhoodZone,
    required String reporterEmail,
    required bool isResolved,
    required DateTime createdAt,
  }) = _HazardReportImpl;

  factory HazardReport.fromJson(Map<String, dynamic> jsonSerialization) {
    return HazardReport(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      severity: jsonSerialization['severity'] as String,
      location: jsonSerialization['location'] as String,
      neighborhoodZone: jsonSerialization['neighborhoodZone'] as String,
      reporterEmail: jsonSerialization['reporterEmail'] as String,
      isResolved: _isc.BoolJsonExtension.fromJson(
        jsonSerialization['isResolved'],
      ),
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

  String description;

  String severity;

  String location;

  String neighborhoodZone;

  String reporterEmail;

  bool isResolved;

  DateTime createdAt;

  /// Returns a shallow copy of this [HazardReport]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  HazardReport copyWith({
    int? id,
    String? title,
    String? description,
    String? severity,
    String? location,
    String? neighborhoodZone,
    String? reporterEmail,
    bool? isResolved,
    DateTime? createdAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HazardReport',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'severity': severity,
      'location': location,
      'neighborhoodZone': neighborhoodZone,
      'reporterEmail': reporterEmail,
      'isResolved': isResolved,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'HazardReport',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'severity': severity,
      'location': location,
      'neighborhoodZone': neighborhoodZone,
      'reporterEmail': reporterEmail,
      'isResolved': isResolved,
      'createdAt': createdAt.toJson(),
    };
  }

  @override
  String toString() {
    return _isc.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HazardReportImpl extends HazardReport {
  _HazardReportImpl({
    int? id,
    required String title,
    required String description,
    required String severity,
    required String location,
    required String neighborhoodZone,
    required String reporterEmail,
    required bool isResolved,
    required DateTime createdAt,
  }) : super._(
         id: id,
         title: title,
         description: description,
         severity: severity,
         location: location,
         neighborhoodZone: neighborhoodZone,
         reporterEmail: reporterEmail,
         isResolved: isResolved,
         createdAt: createdAt,
       );

  /// Returns a shallow copy of this [HazardReport]
  /// with some or all fields replaced by the given arguments.
  @_isc.useResult
  @override
  HazardReport copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    String? severity,
    String? location,
    String? neighborhoodZone,
    String? reporterEmail,
    bool? isResolved,
    DateTime? createdAt,
  }) {
    return HazardReport(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      severity: severity ?? this.severity,
      location: location ?? this.location,
      neighborhoodZone: neighborhoodZone ?? this.neighborhoodZone,
      reporterEmail: reporterEmail ?? this.reporterEmail,
      isResolved: isResolved ?? this.isResolved,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
