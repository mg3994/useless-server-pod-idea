/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member
// ignore_for_file: dead_code, unnecessary_type_check

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'package:website_client/src/protocol/helphub/community_announcement.dart'
    as _if9166ew;
import 'package:website_client/src/protocol/helphub/help_request.dart'
    as _ilm5roly;
import 'package:website_client/src/protocol/helphub/request_comment.dart'
    as _iq4ufam1;
import 'package:website_client/src/protocol/helphub/request_rating.dart'
    as _ib2k1m8u;
import 'package:website_client/src/protocol/helphub/user_notification.dart'
    as _ihs35lap;
import 'package:website_client/src/protocol/helphub/user_profile.dart'
    as _if5f0yyd;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'helphub/community_announcement.dart' as _iw40l365;
import 'helphub/help_request.dart' as _i2hcnfb8;
import 'helphub/request_comment.dart' as _il3090nm;
import 'helphub/request_rating.dart' as _ivm2zgp6;
import 'helphub/user_notification.dart' as _inwdejad;
import 'helphub/user_profile.dart' as _i2208dl4;
export 'greetings/greeting.dart';
export 'helphub/community_announcement.dart';
export 'helphub/help_request.dart';
export 'helphub/request_comment.dart';
export 'helphub/request_rating.dart';
export 'helphub/user_notification.dart';
export 'helphub/user_profile.dart';
export 'client.dart';

class Protocol extends _isc.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static String? getClassNameFromObjectJson(dynamic data) {
    if (data is! Map) return null;
    final className = data['__className__'] as String?;
    return className;
  }

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;

    final dataClassName = getClassNameFromObjectJson(data);
    if (dataClassName != null && dataClassName != getClassNameForType(t)) {
      try {
        return deserializeByClassName({
          'className': dataClassName,
          'data': data,
        });
      } on _isc.DeserializationClassNameNotFoundException catch (_) {
        // If the className is not recognized (e.g., older client receiving
        // data with a new subtype), fall back to deserializing without the
        // className, using the expected type T.
      }
    }

    if (t == _izw8z7ou.Greeting) {
      return _izw8z7ou.Greeting.fromJson(data) as T;
    }
    if (t == _iw40l365.CommunityAnnouncement) {
      return _iw40l365.CommunityAnnouncement.fromJson(data) as T;
    }
    if (t == _i2hcnfb8.HelpRequest) {
      return _i2hcnfb8.HelpRequest.fromJson(data) as T;
    }
    if (t == _il3090nm.RequestComment) {
      return _il3090nm.RequestComment.fromJson(data) as T;
    }
    if (t == _ivm2zgp6.RequestRating) {
      return _ivm2zgp6.RequestRating.fromJson(data) as T;
    }
    if (t == _inwdejad.UserNotification) {
      return _inwdejad.UserNotification.fromJson(data) as T;
    }
    if (t == _i2208dl4.UserProfile) {
      return _i2208dl4.UserProfile.fromJson(data) as T;
    }
    if (t == _isc.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iw40l365.CommunityAnnouncement?>()) {
      return (data != null
              ? _iw40l365.CommunityAnnouncement.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_i2hcnfb8.HelpRequest?>()) {
      return (data != null ? _i2hcnfb8.HelpRequest.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_il3090nm.RequestComment?>()) {
      return (data != null ? _il3090nm.RequestComment.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ivm2zgp6.RequestRating?>()) {
      return (data != null ? _ivm2zgp6.RequestRating.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_inwdejad.UserNotification?>()) {
      return (data != null ? _inwdejad.UserNotification.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i2208dl4.UserProfile?>()) {
      return (data != null ? _i2208dl4.UserProfile.fromJson(data) : null) as T;
    }
    if (t == List<_ilm5roly.HelpRequest>) {
      return (data as List)
              .map((e) => deserialize<_ilm5roly.HelpRequest>(e))
              .toList()
          as T;
    }
    if (t == List<_iq4ufam1.RequestComment>) {
      return (data as List)
              .map((e) => deserialize<_iq4ufam1.RequestComment>(e))
              .toList()
          as T;
    }
    if (t == List<_ib2k1m8u.RequestRating>) {
      return (data as List)
              .map((e) => deserialize<_ib2k1m8u.RequestRating>(e))
              .toList()
          as T;
    }
    if (t == List<_ihs35lap.UserNotification>) {
      return (data as List)
              .map((e) => deserialize<_ihs35lap.UserNotification>(e))
              .toList()
          as T;
    }
    if (t == List<_if5f0yyd.UserProfile>) {
      return (data as List)
              .map((e) => deserialize<_if5f0yyd.UserProfile>(e))
              .toList()
          as T;
    }
    if (t == List<_if9166ew.CommunityAnnouncement>) {
      return (data as List)
              .map((e) => deserialize<_if9166ew.CommunityAnnouncement>(e))
              .toList()
          as T;
    }
    try {
      return _iaic.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacc.Protocol().deserialize<T>(data, t);
    } on _isc.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _izw8z7ou.Greeting => 'Greeting',
      _iw40l365.CommunityAnnouncement => 'CommunityAnnouncement',
      _i2hcnfb8.HelpRequest => 'HelpRequest',
      _il3090nm.RequestComment => 'RequestComment',
      _ivm2zgp6.RequestRating => 'RequestRating',
      _inwdejad.UserNotification => 'UserNotification',
      _i2208dl4.UserProfile => 'UserProfile',
      _ => null,
    };
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;

    if (data is Map<String, dynamic> && data['__className__'] is String) {
      return (data['__className__'] as String).replaceFirst('website.', '');
    }

    switch (data) {
      case _izw8z7ou.Greeting():
        return 'Greeting';
      case _iw40l365.CommunityAnnouncement():
        return 'CommunityAnnouncement';
      case _i2hcnfb8.HelpRequest():
        return 'HelpRequest';
      case _il3090nm.RequestComment():
        return 'RequestComment';
      case _ivm2zgp6.RequestRating():
        return 'RequestRating';
      case _inwdejad.UserNotification():
        return 'UserNotification';
      case _i2208dl4.UserProfile():
        return 'UserProfile';
    }
    className = _iaic.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacc.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_izw8z7ou.Greeting>(data['data']);
    }
    if (dataClassName == 'CommunityAnnouncement') {
      return deserialize<_iw40l365.CommunityAnnouncement>(data['data']);
    }
    if (dataClassName == 'HelpRequest') {
      return deserialize<_i2hcnfb8.HelpRequest>(data['data']);
    }
    if (dataClassName == 'RequestComment') {
      return deserialize<_il3090nm.RequestComment>(data['data']);
    }
    if (dataClassName == 'RequestRating') {
      return deserialize<_ivm2zgp6.RequestRating>(data['data']);
    }
    if (dataClassName == 'UserNotification') {
      return deserialize<_inwdejad.UserNotification>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_i2208dl4.UserProfile>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth_idp.')) {
      data['className'] = dataClassName.substring(19);
      return _iaic.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacc.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iaic.Protocol().registerHostProtocol('website', this);
    _iacc.Protocol().registerHostProtocol('website', this);
  }

  @override
  String getModuleName() => 'website';

  /// Maps any `Record`s known to this [Protocol] to their JSON representation
  ///
  /// Throws in case the record type is not known.
  ///
  /// This method will return `null` (only) for `null` inputs.
  Map<String, dynamic>? mapRecordToJson(Record? record) {
    if (record == null) {
      return null;
    }
    try {
      return _iaic.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacc.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
