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
import 'package:serverpod/protocol.dart' as _isp;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import 'package:website_server/src/generated/helphub/borrowable_item.dart'
    as _irz6m6c4;
import 'package:website_server/src/generated/helphub/community_announcement.dart'
    as _io88z89c;
import 'package:website_server/src/generated/helphub/community_group.dart'
    as _ivzqtrjb;
import 'package:website_server/src/generated/helphub/favor_chat_message.dart'
    as _ifpz7dq1;
import 'package:website_server/src/generated/helphub/hazard_report.dart'
    as _itsw36ae;
import 'package:website_server/src/generated/helphub/help_request.dart'
    as _i62gi6d1;
import 'package:website_server/src/generated/helphub/request_comment.dart'
    as _itygqzxa;
import 'package:website_server/src/generated/helphub/request_rating.dart'
    as _iopw990x;
import 'package:website_server/src/generated/helphub/skill_offer.dart'
    as _ixk7xcy3;
import 'package:website_server/src/generated/helphub/user_notification.dart'
    as _irisjcz6;
import 'package:website_server/src/generated/helphub/user_profile.dart'
    as _ivj3h5rp;
import 'package:website_server/src/generated/helphub/volunteer_event.dart'
    as _iag6romm;
import 'greetings/greeting.dart' as _izw8z7ou;
import 'helphub/borrowable_item.dart' as _i391fcoh;
import 'helphub/community_announcement.dart' as _iw40l365;
import 'helphub/community_group.dart' as _izwlcf28;
import 'helphub/favor_bookmark.dart' as _ia1oh19d;
import 'helphub/favor_chat_message.dart' as _i2q04olh;
import 'helphub/hazard_report.dart' as _iy374jzj;
import 'helphub/help_request.dart' as _i2hcnfb8;
import 'helphub/request_comment.dart' as _il3090nm;
import 'helphub/request_rating.dart' as _ivm2zgp6;
import 'helphub/reward_redemption.dart' as _ib8vacwb;
import 'helphub/skill_offer.dart' as _i7dv48qr;
import 'helphub/user_notification.dart' as _inwdejad;
import 'helphub/user_profile.dart' as _i2208dl4;
import 'helphub/volunteer_event.dart' as _i5ar5pru;
export 'greetings/greeting.dart';
export 'helphub/borrowable_item.dart';
export 'helphub/community_announcement.dart';
export 'helphub/community_group.dart';
export 'helphub/favor_bookmark.dart';
export 'helphub/favor_chat_message.dart';
export 'helphub/hazard_report.dart';
export 'helphub/help_request.dart';
export 'helphub/request_comment.dart';
export 'helphub/request_rating.dart';
export 'helphub/reward_redemption.dart';
export 'helphub/skill_offer.dart';
export 'helphub/user_notification.dart';
export 'helphub/user_profile.dart';
export 'helphub/volunteer_event.dart';

class Protocol extends _is.DatabaseSerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._().._registerHostProtocols();

  static List<_isp.TableDefinition> get targetTableDefinitions => [
    _isp.TableDefinition(
      name: 'community_announcement',
      dartName: 'CommunityAnnouncement',
      schema: 'public',
      module: 'website',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'content',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'category',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'authorEmail',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'isPinned',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'favor_bookmark',
      dartName: 'FavorBookmark',
      schema: 'public',
      module: 'website',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'userEmail',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'requestId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'favor_chat_message',
      dartName: 'FavorChatMessage',
      schema: 'public',
      module: 'website',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'requestId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'senderUserId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'senderEmail',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'message',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'help_request',
      dartName: 'HelpRequest',
      schema: 'public',
      module: 'website',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'category',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'location',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'urgency',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'status',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'rewardPoints',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'isEmergency',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'creatorUserId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'creatorEmail',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'helperUserId',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'helperEmail',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'neighborhoodZone',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'estimatedDuration',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'upvotes',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'completionProofNote',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'shareableCode',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'expiresAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _isp.ColumnDefinition(
          name: 'updatedAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'helphub_borrowable_item',
      dartName: 'BorrowableItem',
      schema: 'public',
      module: 'website',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'category',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'ownerUserId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'ownerEmail',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'depositRequired',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'neighborhoodZone',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'isAvailable',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'borrowedByEmail',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'helphub_community_group',
      dartName: 'CommunityGroup',
      schema: 'public',
      module: 'website',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'name',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'category',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'neighborhoodZone',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'memberCount',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'leaderEmail',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'membersList',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'helphub_hazard_report',
      dartName: 'HazardReport',
      schema: 'public',
      module: 'website',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'severity',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'location',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'neighborhoodZone',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'reporterEmail',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'isResolved',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'helphub_reward_redemption',
      dartName: 'RewardRedemption',
      schema: 'public',
      module: 'website',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'perkTitle',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'pointsCost',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'partnerName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'userEmail',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'redemptionCode',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'helphub_skill_offer',
      dartName: 'SkillOffer',
      schema: 'public',
      module: 'website',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'category',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'offererUserId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'offererEmail',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'availability',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'neighborhoodZone',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'isAvailable',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'claimedByEmail',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'helphub_volunteer_event',
      dartName: 'VolunteerEvent',
      schema: 'public',
      module: 'website',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'description',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'organizerEmail',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'eventDate',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'location',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'neighborhoodZone',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'volunteersCount',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'volunteersList',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'pointsReward',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'request_comment',
      dartName: 'RequestComment',
      schema: 'public',
      module: 'website',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'requestId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'authorUserId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'authorEmail',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'content',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'request_rating',
      dartName: 'RequestRating',
      schema: 'public',
      module: 'website',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'requestId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'fromUserId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'toUserId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'rating',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'feedback',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'user_notification',
      dartName: 'UserNotification',
      schema: 'public',
      module: 'website',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'recipientEmail',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'title',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'message',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'requestId',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'isRead',
          columnType: _isp.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _isp.ColumnDefinition(
          name: 'createdAt',
          columnType: _isp.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    _isp.TableDefinition(
      name: 'user_profile',
      dartName: 'UserProfile',
      schema: 'public',
      module: 'website',
      columns: [
        _isp.ColumnDefinition(
          name: 'id',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'serial',
        ),
        _isp.ColumnDefinition(
          name: 'userId',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'email',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'displayName',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'points',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'completedCount',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'requestedCount',
          columnType: _isp.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _isp.ColumnDefinition(
          name: 'avatarBadge',
          columnType: _isp.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _isp.ColumnDefinition(
          name: 'ratingAverage',
          columnType: _isp.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _isp.ColumnDefinition(
          name: 'ratingCount',
          columnType: _isp.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _isp.ColumnDefinition(
          name: 'skills',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _isp.ColumnDefinition(
          name: 'unlockedBadges',
          columnType: _isp.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
      ],
      foreignKeys: [],
      indexes: [],
      managed: true,
    ),
    ..._iais.Protocol.targetTableDefinitions,
    ..._iacs.Protocol.targetTableDefinitions,
    ..._isp.Protocol.targetTableDefinitions,
  ];

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
      } on _is.DeserializationClassNameNotFoundException catch (_) {
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
    if (t == _is.getType<_izw8z7ou.Greeting?>()) {
      return (data != null ? _izw8z7ou.Greeting.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i391fcoh.BorrowableItem?>()) {
      return (data != null ? _i391fcoh.BorrowableItem.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iw40l365.CommunityAnnouncement?>()) {
      return (data != null
              ? _iw40l365.CommunityAnnouncement.fromJson(data)
              : null)
          as T;
    }
    if (t == _is.getType<_izwlcf28.CommunityGroup?>()) {
      return (data != null ? _izwlcf28.CommunityGroup.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ia1oh19d.FavorBookmark?>()) {
      return (data != null ? _ia1oh19d.FavorBookmark.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_i2q04olh.FavorChatMessage?>()) {
      return (data != null ? _i2q04olh.FavorChatMessage.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_iy374jzj.HazardReport?>()) {
      return (data != null ? _iy374jzj.HazardReport.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i2hcnfb8.HelpRequest?>()) {
      return (data != null ? _i2hcnfb8.HelpRequest.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_il3090nm.RequestComment?>()) {
      return (data != null ? _il3090nm.RequestComment.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ivm2zgp6.RequestRating?>()) {
      return (data != null ? _ivm2zgp6.RequestRating.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_ib8vacwb.RewardRedemption?>()) {
      return (data != null ? _ib8vacwb.RewardRedemption.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_i7dv48qr.SkillOffer?>()) {
      return (data != null ? _i7dv48qr.SkillOffer.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_inwdejad.UserNotification?>()) {
      return (data != null ? _inwdejad.UserNotification.fromJson(data) : null)
          as T;
    }
    if (t == _is.getType<_i2208dl4.UserProfile?>()) {
      return (data != null ? _i2208dl4.UserProfile.fromJson(data) : null) as T;
    }
    if (t == _is.getType<_i5ar5pru.VolunteerEvent?>()) {
      return (data != null ? _i5ar5pru.VolunteerEvent.fromJson(data) : null)
          as T;
    }
    if (t == List<_itsw36ae.HazardReport>) {
      return (data as List)
              .map((e) => deserialize<_itsw36ae.HazardReport>(e))
              .toList()
          as T;
    }
    if (t == List<_irz6m6c4.BorrowableItem>) {
      return (data as List)
              .map((e) => deserialize<_irz6m6c4.BorrowableItem>(e))
              .toList()
          as T;
    }
    if (t == List<_iag6romm.VolunteerEvent>) {
      return (data as List)
              .map((e) => deserialize<_iag6romm.VolunteerEvent>(e))
              .toList()
          as T;
    }
    if (t == List<_ixk7xcy3.SkillOffer>) {
      return (data as List)
              .map((e) => deserialize<_ixk7xcy3.SkillOffer>(e))
              .toList()
          as T;
    }
    if (t == List<_ivzqtrjb.CommunityGroup>) {
      return (data as List)
              .map((e) => deserialize<_ivzqtrjb.CommunityGroup>(e))
              .toList()
          as T;
    }
    if (t == List<_irisjcz6.UserNotification>) {
      return (data as List)
              .map((e) => deserialize<_irisjcz6.UserNotification>(e))
              .toList()
          as T;
    }
    if (t == List<_ifpz7dq1.FavorChatMessage>) {
      return (data as List)
              .map((e) => deserialize<_ifpz7dq1.FavorChatMessage>(e))
              .toList()
          as T;
    }
    if (t == Map<String, int>) {
      return (data as Map).map(
            (k, v) => MapEntry(deserialize<String>(k), deserialize<int>(v)),
          )
          as T;
    }
    if (t == List<_i62gi6d1.HelpRequest>) {
      return (data as List)
              .map((e) => deserialize<_i62gi6d1.HelpRequest>(e))
              .toList()
          as T;
    }
    if (t == List<_itygqzxa.RequestComment>) {
      return (data as List)
              .map((e) => deserialize<_itygqzxa.RequestComment>(e))
              .toList()
          as T;
    }
    if (t == List<_iopw990x.RequestRating>) {
      return (data as List)
              .map((e) => deserialize<_iopw990x.RequestRating>(e))
              .toList()
          as T;
    }
    if (t == List<_ivj3h5rp.UserProfile>) {
      return (data as List)
              .map((e) => deserialize<_ivj3h5rp.UserProfile>(e))
              .toList()
          as T;
    }
    if (t == List<_io88z89c.CommunityAnnouncement>) {
      return (data as List)
              .map((e) => deserialize<_io88z89c.CommunityAnnouncement>(e))
              .toList()
          as T;
    }
    try {
      return _iais.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _iacs.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _isp.Protocol().deserialize<T>(data, t);
    } on _is.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  static String? getClassNameForType(Type type) {
    return switch (type) {
      _izw8z7ou.Greeting => 'Greeting',
      _i391fcoh.BorrowableItem => 'BorrowableItem',
      _iw40l365.CommunityAnnouncement => 'CommunityAnnouncement',
      _izwlcf28.CommunityGroup => 'CommunityGroup',
      _ia1oh19d.FavorBookmark => 'FavorBookmark',
      _i2q04olh.FavorChatMessage => 'FavorChatMessage',
      _iy374jzj.HazardReport => 'HazardReport',
      _i2hcnfb8.HelpRequest => 'HelpRequest',
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
    className = _iais.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_idp.$className';
    }
    className = _iacs.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.')
          ? className
          : 'serverpod_auth_core.$className';
    }
    className = _isp.Protocol().getClassNameForObject(data);
    if (className != null) {
      return className.contains('.') ? className : 'serverpod.$className';
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
      return _iais.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth_core.')) {
      data['className'] = dataClassName.substring(20);
      return _iacs.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _isp.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  void _registerHostProtocols() {
    _iais.Protocol().registerHostProtocol('website', this);
    _iacs.Protocol().registerHostProtocol('website', this);
  }

  @override
  _is.Table? getTableForType(Type t) {
    {
      var table = _iais.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _iacs.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _isp.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i391fcoh.BorrowableItem:
        return _i391fcoh.BorrowableItem.t;
      case _iw40l365.CommunityAnnouncement:
        return _iw40l365.CommunityAnnouncement.t;
      case _izwlcf28.CommunityGroup:
        return _izwlcf28.CommunityGroup.t;
      case _ia1oh19d.FavorBookmark:
        return _ia1oh19d.FavorBookmark.t;
      case _i2q04olh.FavorChatMessage:
        return _i2q04olh.FavorChatMessage.t;
      case _iy374jzj.HazardReport:
        return _iy374jzj.HazardReport.t;
      case _i2hcnfb8.HelpRequest:
        return _i2hcnfb8.HelpRequest.t;
      case _il3090nm.RequestComment:
        return _il3090nm.RequestComment.t;
      case _ivm2zgp6.RequestRating:
        return _ivm2zgp6.RequestRating.t;
      case _ib8vacwb.RewardRedemption:
        return _ib8vacwb.RewardRedemption.t;
      case _i7dv48qr.SkillOffer:
        return _i7dv48qr.SkillOffer.t;
      case _inwdejad.UserNotification:
        return _inwdejad.UserNotification.t;
      case _i2208dl4.UserProfile:
        return _i2208dl4.UserProfile.t;
      case _i5ar5pru.VolunteerEvent:
        return _i5ar5pru.VolunteerEvent.t;
    }
    return null;
  }

  @override
  List<_isp.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

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
      return _iais.Protocol().mapRecordToJson(record);
    } catch (_) {}
    try {
      return _iacs.Protocol().mapRecordToJson(record);
    } catch (_) {}
    throw Exception('Unsupported record type ${record.runtimeType}');
  }
}
