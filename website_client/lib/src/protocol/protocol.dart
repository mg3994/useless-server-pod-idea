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
import 'package:website_client/src/protocol/helphub/borrowable_item.dart'
    as _if3ypwc4;
import 'package:website_client/src/protocol/helphub/carpool_ride.dart'
    as _ih37wqku;
import 'package:website_client/src/protocol/helphub/community_announcement.dart'
    as _if9166ew;
import 'package:website_client/src/protocol/helphub/community_group.dart'
    as _iux57j0g;
import 'package:website_client/src/protocol/helphub/favor_chat_message.dart'
    as _irf5posj;
import 'package:website_client/src/protocol/helphub/hazard_report.dart'
    as _i47xxilf;
import 'package:website_client/src/protocol/helphub/help_request.dart'
    as _ilm5roly;
import 'package:website_client/src/protocol/helphub/lost_found_item.dart'
    as _ijgap0jh;
import 'package:website_client/src/protocol/helphub/request_comment.dart'
    as _iq4ufam1;
import 'package:website_client/src/protocol/helphub/request_rating.dart'
    as _ib2k1m8u;
import 'package:website_client/src/protocol/helphub/skill_offer.dart'
    as _ipzxy2lt;
import 'package:website_client/src/protocol/helphub/user_notification.dart'
    as _ihs35lap;
import 'package:website_client/src/protocol/helphub/user_profile.dart'
    as _if5f0yyd;
import 'package:website_client/src/protocol/helphub/volunteer_event.dart'
    as _ijz6y5wx;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'helphub/borrowable_item.dart' as _i391fcoh;
import 'helphub/carpool_ride.dart' as _iilj6fti;
import 'helphub/community_announcement.dart' as _iw40l365;
import 'helphub/community_group.dart' as _izwlcf28;
import 'helphub/favor_bookmark.dart' as _ia1oh19d;
import 'helphub/favor_chat_message.dart' as _i2q04olh;
import 'helphub/hazard_report.dart' as _iy374jzj;
import 'helphub/help_request.dart' as _i2hcnfb8;
import 'helphub/lost_found_item.dart' as _ie948yrj;
import 'helphub/request_comment.dart' as _il3090nm;
import 'helphub/request_rating.dart' as _ivm2zgp6;
import 'helphub/reward_redemption.dart' as _ib8vacwb;
import 'helphub/skill_offer.dart' as _i7dv48qr;
import 'helphub/user_notification.dart' as _inwdejad;
import 'helphub/user_profile.dart' as _i2208dl4;
import 'helphub/volunteer_event.dart' as _i5ar5pru;
export 'greetings/greeting.dart';
export 'helphub/borrowable_item.dart';
export 'helphub/carpool_ride.dart';
export 'helphub/community_announcement.dart';
export 'helphub/community_group.dart';
export 'helphub/favor_bookmark.dart';
export 'helphub/favor_chat_message.dart';
export 'helphub/hazard_report.dart';
export 'helphub/help_request.dart';
export 'helphub/lost_found_item.dart';
export 'helphub/request_comment.dart';
export 'helphub/request_rating.dart';
export 'helphub/reward_redemption.dart';
export 'helphub/skill_offer.dart';
export 'helphub/user_notification.dart';
export 'helphub/user_profile.dart';
export 'helphub/volunteer_event.dart';
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
    if (t == _i391fcoh.BorrowableItem) {
      return _i391fcoh.BorrowableItem.fromJson(data) as T;
    }
    if (t == _iilj6fti.CarpoolRide) {
      return _iilj6fti.CarpoolRide.fromJson(data) as T;
    }
    if (t == _iw40l365.CommunityAnnouncement) {
      return _iw40l365.CommunityAnnouncement.fromJson(data) as T;
    }
    if (t == _izwlcf28.CommunityGroup) {
      return _izwlcf28.CommunityGroup.fromJson(data) as T;
    }
    if (t == _ia1oh19d.FavorBookmark) {
      return _ia1oh19d.FavorBookmark.fromJson(data) as T;
    }
    if (t == _i2q04olh.FavorChatMessage) {
      return _i2q04olh.FavorChatMessage.fromJson(data) as T;
    }
    if (t == _iy374jzj.HazardReport) {
      return _iy374jzj.HazardReport.fromJson(data) as T;
    }
    if (t == _i2hcnfb8.HelpRequest) {
      return _i2hcnfb8.HelpRequest.fromJson(data) as T;
    }
    if (t == _ie948yrj.LostFoundItem) {
      return _ie948yrj.LostFoundItem.fromJson(data) as T;
    }
    if (t == _il3090nm.RequestComment) {
      return _il3090nm.RequestComment.fromJson(data) as T;
    }
    if (t == _ivm2zgp6.RequestRating) {
      return _ivm2zgp6.RequestRating.fromJson(data) as T;
    }
    if (t == _ib8vacwb.RewardRedemption) {
      return _ib8vacwb.RewardRedemption.fromJson(data) as T;
    }
    if (t == _i7dv48qr.SkillOffer) {
      return _i7dv48qr.SkillOffer.fromJson(data) as T;
    }
    if (t == _inwdejad.UserNotification) {
      return _inwdejad.UserNotification.fromJson(data) as T;
    }
    if (t == _i2208dl4.UserProfile) {
      return _i2208dl4.UserProfile.fromJson(data) as T;
    }
    if (t == _i5ar5pru.VolunteerEvent) {
      return _i5ar5pru.VolunteerEvent.fromJson(data) as T;
    }
    if (t == _isc.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i391fcoh.BorrowableItem?>()) {
      return (data != null ? _i391fcoh.BorrowableItem.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iilj6fti.CarpoolRide?>()) {
      return (data != null ? _iilj6fti.CarpoolRide.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_iw40l365.CommunityAnnouncement?>()) {
      return (data != null
              ? _iw40l365.CommunityAnnouncement.fromJson(data)
              : null)
          as T;
    }
    if (t == _isc.getType<_izwlcf28.CommunityGroup?>()) {
      return (data != null ? _izwlcf28.CommunityGroup.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ia1oh19d.FavorBookmark?>()) {
      return (data != null ? _ia1oh19d.FavorBookmark.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i2q04olh.FavorChatMessage?>()) {
      return (data != null ? _i2q04olh.FavorChatMessage.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_iy374jzj.HazardReport?>()) {
      return (data != null ? _iy374jzj.HazardReport.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i2hcnfb8.HelpRequest?>()) {
      return (data != null ? _i2hcnfb8.HelpRequest.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_ie948yrj.LostFoundItem?>()) {
      return (data != null ? _ie948yrj.LostFoundItem.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_il3090nm.RequestComment?>()) {
      return (data != null ? _il3090nm.RequestComment.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ivm2zgp6.RequestRating?>()) {
      return (data != null ? _ivm2zgp6.RequestRating.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_ib8vacwb.RewardRedemption?>()) {
      return (data != null ? _ib8vacwb.RewardRedemption.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i7dv48qr.SkillOffer?>()) {
      return (data != null ? _i7dv48qr.SkillOffer.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_inwdejad.UserNotification?>()) {
      return (data != null ? _inwdejad.UserNotification.fromJson(data) : null)
          as T;
    }
    if (t == _isc.getType<_i2208dl4.UserProfile?>()) {
      return (data != null ? _i2208dl4.UserProfile.fromJson(data) : null) as T;
    }
    if (t == _isc.getType<_i5ar5pru.VolunteerEvent?>()) {
      return (data != null ? _i5ar5pru.VolunteerEvent.fromJson(data) : null)
          as T;
    }
    if (t == List<_ih37wqku.CarpoolRide>) {
      return (data as List)
              .map((e) => deserialize<_ih37wqku.CarpoolRide>(e))
              .toList()
          as T;
    }
    if (t == List<_ijgap0jh.LostFoundItem>) {
      return (data as List)
              .map((e) => deserialize<_ijgap0jh.LostFoundItem>(e))
              .toList()
          as T;
    }
    if (t == List<_i47xxilf.HazardReport>) {
      return (data as List)
              .map((e) => deserialize<_i47xxilf.HazardReport>(e))
              .toList()
          as T;
    }
    if (t == List<_if3ypwc4.BorrowableItem>) {
      return (data as List)
              .map((e) => deserialize<_if3ypwc4.BorrowableItem>(e))
              .toList()
          as T;
    }
    if (t == List<_ijz6y5wx.VolunteerEvent>) {
      return (data as List)
              .map((e) => deserialize<_ijz6y5wx.VolunteerEvent>(e))
              .toList()
          as T;
    }
    if (t == List<_ipzxy2lt.SkillOffer>) {
      return (data as List)
              .map((e) => deserialize<_ipzxy2lt.SkillOffer>(e))
              .toList()
          as T;
    }
    if (t == List<_iux57j0g.CommunityGroup>) {
      return (data as List)
              .map((e) => deserialize<_iux57j0g.CommunityGroup>(e))
              .toList()
          as T;
    }
    if (t == List<_ihs35lap.UserNotification>) {
      return (data as List)
              .map((e) => deserialize<_ihs35lap.UserNotification>(e))
              .toList()
          as T;
    }
    if (t == List<_irf5posj.FavorChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_irf5posj.FavorChatMessage>(e))
              .toList()
          as T;
    }
    if (t == Map<String, int>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<int>(v)),
          )
          as T;
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
      _i391fcoh.BorrowableItem => 'BorrowableItem',
      _iilj6fti.CarpoolRide => 'CarpoolRide',
      _iw40l365.CommunityAnnouncement => 'CommunityAnnouncement',
      _izwlcf28.CommunityGroup => 'CommunityGroup',
      _ia1oh19d.FavorBookmark => 'FavorBookmark',
      _i2q04olh.FavorChatMessage => 'FavorChatMessage',
      _iy374jzj.HazardReport => 'HazardReport',
      _i2hcnfb8.HelpRequest => 'HelpRequest',
      _ie948yrj.LostFoundItem => 'LostFoundItem',
      _il3090nm.RequestComment => 'RequestComment',
      _ivm2zgp6.RequestRating => 'RequestRating',
      _ib8vacwb.RewardRedemption => 'RewardRedemption',
      _i7dv48qr.SkillOffer => 'SkillOffer',
      _inwdejad.UserNotification => 'UserNotification',
      _i2208dl4.UserProfile => 'UserProfile',
      _i5ar5pru.VolunteerEvent => 'VolunteerEvent',
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
      case _i391fcoh.BorrowableItem():
        return 'BorrowableItem';
      case _iilj6fti.CarpoolRide():
        return 'CarpoolRide';
      case _iw40l365.CommunityAnnouncement():
        return 'CommunityAnnouncement';
      case _izwlcf28.CommunityGroup():
        return 'CommunityGroup';
      case _ia1oh19d.FavorBookmark():
        return 'FavorBookmark';
      case _i2q04olh.FavorChatMessage():
        return 'FavorChatMessage';
      case _iy374jzj.HazardReport():
        return 'HazardReport';
      case _i2hcnfb8.HelpRequest():
        return 'HelpRequest';
      case _ie948yrj.LostFoundItem():
        return 'LostFoundItem';
      case _il3090nm.RequestComment():
        return 'RequestComment';
      case _ivm2zgp6.RequestRating():
        return 'RequestRating';
      case _ib8vacwb.RewardRedemption():
        return 'RewardRedemption';
      case _i7dv48qr.SkillOffer():
        return 'SkillOffer';
      case _inwdejad.UserNotification():
        return 'UserNotification';
      case _i2208dl4.UserProfile():
        return 'UserProfile';
      case _i5ar5pru.VolunteerEvent():
        return 'VolunteerEvent';
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
    if (dataClassName == 'BorrowableItem') {
      return deserialize<_i391fcoh.BorrowableItem>(data['data']);
    }
    if (dataClassName == 'CarpoolRide') {
      return deserialize<_iilj6fti.CarpoolRide>(data['data']);
    }
    if (dataClassName == 'CommunityAnnouncement') {
      return deserialize<_iw40l365.CommunityAnnouncement>(data['data']);
    }
    if (dataClassName == 'CommunityGroup') {
      return deserialize<_izwlcf28.CommunityGroup>(data['data']);
    }
    if (dataClassName == 'FavorBookmark') {
      return deserialize<_ia1oh19d.FavorBookmark>(data['data']);
    }
    if (dataClassName == 'FavorChatMessage') {
      return deserialize<_i2q04olh.FavorChatMessage>(data['data']);
    }
    if (dataClassName == 'HazardReport') {
      return deserialize<_iy374jzj.HazardReport>(data['data']);
    }
    if (dataClassName == 'HelpRequest') {
      return deserialize<_i2hcnfb8.HelpRequest>(data['data']);
    }
    if (dataClassName == 'LostFoundItem') {
      return deserialize<_ie948yrj.LostFoundItem>(data['data']);
    }
    if (dataClassName == 'RequestComment') {
      return deserialize<_il3090nm.RequestComment>(data['data']);
    }
    if (dataClassName == 'RequestRating') {
      return deserialize<_ivm2zgp6.RequestRating>(data['data']);
    }
    if (dataClassName == 'RewardRedemption') {
      return deserialize<_ib8vacwb.RewardRedemption>(data['data']);
    }
    if (dataClassName == 'SkillOffer') {
      return deserialize<_i7dv48qr.SkillOffer>(data['data']);
    }
    if (dataClassName == 'UserNotification') {
      return deserialize<_inwdejad.UserNotification>(data['data']);
    }
    if (dataClassName == 'UserProfile') {
      return deserialize<_i2208dl4.UserProfile>(data['data']);
    }
    if (dataClassName == 'VolunteerEvent') {
      return deserialize<_i5ar5pru.VolunteerEvent>(data['data']);
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
