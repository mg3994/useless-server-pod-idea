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
import 'package:serverpod/serverpod.dart' as _is;

abstract class HelpRequest
    implements _is.TableRow<int?>, _is.ProtocolSerialization {
  HelpRequest._({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.location,
    required this.urgency,
    required this.status,
    required this.rewardPoints,
    required this.isEmergency,
    required this.creatorUserId,
    required this.creatorEmail,
    this.helperUserId,
    this.helperEmail,
    required this.createdAt,
    this.updatedAt,
  });

  factory HelpRequest({
    int? id,
    required String title,
    required String description,
    required String category,
    required String location,
    required String urgency,
    required String status,
    required int rewardPoints,
    required bool isEmergency,
    required int creatorUserId,
    required String creatorEmail,
    int? helperUserId,
    String? helperEmail,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _HelpRequestImpl;

  factory HelpRequest.fromJson(Map<String, dynamic> jsonSerialization) {
    return HelpRequest(
      id: jsonSerialization['id'] as int?,
      title: jsonSerialization['title'] as String,
      description: jsonSerialization['description'] as String,
      category: jsonSerialization['category'] as String,
      location: jsonSerialization['location'] as String,
      urgency: jsonSerialization['urgency'] as String,
      status: jsonSerialization['status'] as String,
      rewardPoints: jsonSerialization['rewardPoints'] as int,
      isEmergency: _is.BoolJsonExtension.fromJson(
        jsonSerialization['isEmergency'],
      ),
      creatorUserId: jsonSerialization['creatorUserId'] as int,
      creatorEmail: jsonSerialization['creatorEmail'] as String,
      helperUserId: jsonSerialization['helperUserId'] as int?,
      helperEmail: jsonSerialization['helperEmail'] as String?,
      createdAt: _is.DateTimeJsonExtension.fromJson(
        jsonSerialization['createdAt'],
      ),
      updatedAt: jsonSerialization['updatedAt'] == null
          ? null
          : _is.DateTimeJsonExtension.fromJson(jsonSerialization['updatedAt']),
    );
  }

  static final t = HelpRequestTable();

  static const db = HelpRequestRepository._();

  @override
  int? id;

  String title;

  String description;

  String category;

  String location;

  String urgency;

  String status;

  int rewardPoints;

  bool isEmergency;

  int creatorUserId;

  String creatorEmail;

  int? helperUserId;

  String? helperEmail;

  DateTime createdAt;

  DateTime? updatedAt;

  @override
  _is.Table<int?> get table => t;

  /// Returns a shallow copy of this [HelpRequest]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  HelpRequest copyWith({
    int? id,
    String? title,
    String? description,
    String? category,
    String? location,
    String? urgency,
    String? status,
    int? rewardPoints,
    bool? isEmergency,
    int? creatorUserId,
    String? creatorEmail,
    int? helperUserId,
    String? helperEmail,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      '__className__': 'HelpRequest',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'location': location,
      'urgency': urgency,
      'status': status,
      'rewardPoints': rewardPoints,
      'isEmergency': isEmergency,
      'creatorUserId': creatorUserId,
      'creatorEmail': creatorEmail,
      if (helperUserId != null) 'helperUserId': helperUserId,
      if (helperEmail != null) 'helperEmail': helperEmail,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      '__className__': 'HelpRequest',
      if (id != null) 'id': id,
      'title': title,
      'description': description,
      'category': category,
      'location': location,
      'urgency': urgency,
      'status': status,
      'rewardPoints': rewardPoints,
      'isEmergency': isEmergency,
      'creatorUserId': creatorUserId,
      'creatorEmail': creatorEmail,
      if (helperUserId != null) 'helperUserId': helperUserId,
      if (helperEmail != null) 'helperEmail': helperEmail,
      'createdAt': createdAt.toJson(),
      if (updatedAt != null) 'updatedAt': updatedAt?.toJson(),
    };
  }

  static HelpRequestInclude include() {
    return HelpRequestInclude._();
  }

  static HelpRequestIncludeList includeList({
    _is.WhereExpressionBuilder<HelpRequestTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HelpRequestTable>? orderBy,
    _is.OrderByListBuilder<HelpRequestTable>? orderByList,
    HelpRequestInclude? include,
  }) {
    return HelpRequestIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(HelpRequest.t),
      orderByList: orderByList?.call(HelpRequest.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _is.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _HelpRequestImpl extends HelpRequest {
  _HelpRequestImpl({
    int? id,
    required String title,
    required String description,
    required String category,
    required String location,
    required String urgency,
    required String status,
    required int rewardPoints,
    required bool isEmergency,
    required int creatorUserId,
    required String creatorEmail,
    int? helperUserId,
    String? helperEmail,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) : super._(
         id: id,
         title: title,
         description: description,
         category: category,
         location: location,
         urgency: urgency,
         status: status,
         rewardPoints: rewardPoints,
         isEmergency: isEmergency,
         creatorUserId: creatorUserId,
         creatorEmail: creatorEmail,
         helperUserId: helperUserId,
         helperEmail: helperEmail,
         createdAt: createdAt,
         updatedAt: updatedAt,
       );

  /// Returns a shallow copy of this [HelpRequest]
  /// with some or all fields replaced by the given arguments.
  @_is.useResult
  @override
  HelpRequest copyWith({
    Object? id = _Undefined,
    String? title,
    String? description,
    String? category,
    String? location,
    String? urgency,
    String? status,
    int? rewardPoints,
    bool? isEmergency,
    int? creatorUserId,
    String? creatorEmail,
    Object? helperUserId = _Undefined,
    Object? helperEmail = _Undefined,
    DateTime? createdAt,
    Object? updatedAt = _Undefined,
  }) {
    return HelpRequest(
      id: id is int? ? id : this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      location: location ?? this.location,
      urgency: urgency ?? this.urgency,
      status: status ?? this.status,
      rewardPoints: rewardPoints ?? this.rewardPoints,
      isEmergency: isEmergency ?? this.isEmergency,
      creatorUserId: creatorUserId ?? this.creatorUserId,
      creatorEmail: creatorEmail ?? this.creatorEmail,
      helperUserId: helperUserId is int? ? helperUserId : this.helperUserId,
      helperEmail: helperEmail is String? ? helperEmail : this.helperEmail,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt is DateTime? ? updatedAt : this.updatedAt,
    );
  }
}

class HelpRequestUpdateTable extends _is.UpdateTable<HelpRequestTable> {
  HelpRequestUpdateTable(super.table);

  _is.ColumnValue<String, String> title(String value) => _is.ColumnValue(
    table.title,
    value,
  );

  _is.ColumnValue<String, String> description(String value) => _is.ColumnValue(
    table.description,
    value,
  );

  _is.ColumnValue<String, String> category(String value) => _is.ColumnValue(
    table.category,
    value,
  );

  _is.ColumnValue<String, String> location(String value) => _is.ColumnValue(
    table.location,
    value,
  );

  _is.ColumnValue<String, String> urgency(String value) => _is.ColumnValue(
    table.urgency,
    value,
  );

  _is.ColumnValue<String, String> status(String value) => _is.ColumnValue(
    table.status,
    value,
  );

  _is.ColumnValue<int, int> rewardPoints(int value) => _is.ColumnValue(
    table.rewardPoints,
    value,
  );

  _is.ColumnValue<bool, bool> isEmergency(bool value) => _is.ColumnValue(
    table.isEmergency,
    value,
  );

  _is.ColumnValue<int, int> creatorUserId(int value) => _is.ColumnValue(
    table.creatorUserId,
    value,
  );

  _is.ColumnValue<String, String> creatorEmail(String value) => _is.ColumnValue(
    table.creatorEmail,
    value,
  );

  _is.ColumnValue<int, int> helperUserId(int? value) => _is.ColumnValue(
    table.helperUserId,
    value,
  );

  _is.ColumnValue<String, String> helperEmail(String? value) => _is.ColumnValue(
    table.helperEmail,
    value,
  );

  _is.ColumnValue<DateTime, DateTime> createdAt(DateTime value) =>
      _is.ColumnValue(
        table.createdAt,
        value,
      );

  _is.ColumnValue<DateTime, DateTime> updatedAt(DateTime? value) =>
      _is.ColumnValue(
        table.updatedAt,
        value,
      );
}

class HelpRequestTable extends _is.Table<int?> {
  HelpRequestTable({super.tableRelation}) : super(tableName: 'help_request') {
    updateTable = HelpRequestUpdateTable(this);
    title = _is.ColumnString(
      'title',
      this,
    );
    description = _is.ColumnString(
      'description',
      this,
    );
    category = _is.ColumnString(
      'category',
      this,
    );
    location = _is.ColumnString(
      'location',
      this,
    );
    urgency = _is.ColumnString(
      'urgency',
      this,
    );
    status = _is.ColumnString(
      'status',
      this,
    );
    rewardPoints = _is.ColumnInt(
      'rewardPoints',
      this,
    );
    isEmergency = _is.ColumnBool(
      'isEmergency',
      this,
    );
    creatorUserId = _is.ColumnInt(
      'creatorUserId',
      this,
    );
    creatorEmail = _is.ColumnString(
      'creatorEmail',
      this,
    );
    helperUserId = _is.ColumnInt(
      'helperUserId',
      this,
    );
    helperEmail = _is.ColumnString(
      'helperEmail',
      this,
    );
    createdAt = _is.ColumnDateTime(
      'createdAt',
      this,
    );
    updatedAt = _is.ColumnDateTime(
      'updatedAt',
      this,
    );
  }

  late final HelpRequestUpdateTable updateTable;

  late final _is.ColumnString title;

  late final _is.ColumnString description;

  late final _is.ColumnString category;

  late final _is.ColumnString location;

  late final _is.ColumnString urgency;

  late final _is.ColumnString status;

  late final _is.ColumnInt rewardPoints;

  late final _is.ColumnBool isEmergency;

  late final _is.ColumnInt creatorUserId;

  late final _is.ColumnString creatorEmail;

  late final _is.ColumnInt helperUserId;

  late final _is.ColumnString helperEmail;

  late final _is.ColumnDateTime createdAt;

  late final _is.ColumnDateTime updatedAt;

  @override
  List<_is.Column> get columns => [
    id,
    title,
    description,
    category,
    location,
    urgency,
    status,
    rewardPoints,
    isEmergency,
    creatorUserId,
    creatorEmail,
    helperUserId,
    helperEmail,
    createdAt,
    updatedAt,
  ];
}

class HelpRequestInclude extends _is.IncludeObject {
  HelpRequestInclude._();

  @override
  Map<String, _is.Include?> get includes => {};

  @override
  _is.Table<int?> get table => HelpRequest.t;
}

class HelpRequestIncludeList extends _is.IncludeList {
  HelpRequestIncludeList._({
    _is.WhereExpressionBuilder<HelpRequestTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(HelpRequest.t);
  }

  @override
  Map<String, _is.Include?> get includes => include?.includes ?? {};

  @override
  _is.Table<int?> get table => HelpRequest.t;
}

class HelpRequestRepository {
  const HelpRequestRepository._();

  /// Returns a list of [HelpRequest]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<HelpRequest>> find(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HelpRequestTable>? where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HelpRequestTable>? orderBy,
    _is.OrderByListBuilder<HelpRequestTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.find<HelpRequest>(
      where: where?.call(HelpRequest.t),
      orderBy: orderBy?.call(HelpRequest.t),
      orderByList: orderByList?.call(HelpRequest.t),
      limit: limit,
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Returns the first matching [HelpRequest] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<HelpRequest?> findFirstRow(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HelpRequestTable>? where,
    int? offset,
    _is.OrderByBuilder<HelpRequestTable>? orderBy,
    _is.OrderByListBuilder<HelpRequestTable>? orderByList,
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findFirstRow<HelpRequest>(
      where: where?.call(HelpRequest.t),
      orderBy: orderBy?.call(HelpRequest.t),
      orderByList: orderByList?.call(HelpRequest.t),
      offset: offset,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Finds a single [HelpRequest] by its [id] or null if no such row exists.
  Future<HelpRequest?> findById(
    _is.DatabaseSession session,
    int id, {
    _is.Transaction? transaction,
    _is.LockMode? lockMode,
    _is.LockBehavior? lockBehavior,
  }) async {
    return session.db.findById<HelpRequest>(
      id,
      transaction: transaction,
      lockMode: lockMode,
      lockBehavior: lockBehavior,
    );
  }

  /// Inserts all [HelpRequest]s in the list and returns the inserted rows.
  ///
  /// The returned [HelpRequest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  ///
  /// If [ignoreConflicts] is set to `true`, rows that conflict with existing
  /// rows are silently skipped, and only the successfully inserted rows are
  /// returned.
  ///
  /// If [noReturn] is set to `true`, the inserted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HelpRequest>> insert(
    _is.DatabaseSession session,
    List<HelpRequest> rows, {
    _is.Transaction? transaction,
    bool ignoreConflicts = false,
    bool noReturn = false,
  }) async {
    return session.db.insert<HelpRequest>(
      rows,
      transaction: transaction,
      ignoreConflicts: ignoreConflicts,
      noReturn: noReturn,
    );
  }

  /// Inserts a single [HelpRequest] and returns the inserted row.
  ///
  /// The returned [HelpRequest] will have its `id` field set.
  Future<HelpRequest> insertRow(
    _is.DatabaseSession session,
    HelpRequest row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.insertRow<HelpRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Upserts all [HelpRequest]s in the list and returns the resulting rows.
  ///
  /// If a row conflicts on the given [conflictColumns], the existing row is
  /// updated with the new values. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies to rows matching the
  /// given expression. Conflicting rows that don't match are skipped and not
  /// returned, so the resulting list may be shorter than [rows].
  ///
  /// The returned [HelpRequest]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails,
  /// none of the rows will be affected.
  ///
  /// If [noReturn] is set to `true`, the resulting rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HelpRequest>> upsert(
    _is.DatabaseSession session,
    List<HelpRequest> rows, {
    required _is.ColumnSelections<HelpRequestTable> conflictColumns,
    _is.ColumnSelections<HelpRequestTable>? updateColumns,
    _is.WhereExpressionBuilder<HelpRequestTable>? updateWhere,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.upsert<HelpRequest>(
      rows,
      conflictColumns: conflictColumns(HelpRequest.t),
      updateColumns: updateColumns?.call(HelpRequest.t),
      updateWhere: updateWhere?.call(HelpRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Upserts a single [HelpRequest] and returns the resulting row.
  ///
  /// If the row conflicts on the given [conflictColumns], the existing row is
  /// updated. Otherwise, a new row is inserted.
  ///
  /// If [updateColumns] is provided, only those columns will be updated on
  /// conflict. If null, all non-conflict, non-id columns are updated.
  ///
  /// If [updateWhere] is provided, the update only applies when the existing
  /// row matches the expression. Returns `null` if no row was affected — for
  /// example when [updateWhere] does not match the conflicting row.
  ///
  /// The returned [HelpRequest] will have its `id` field set.
  Future<HelpRequest?> upsertRow(
    _is.DatabaseSession session,
    HelpRequest row, {
    required _is.ColumnSelections<HelpRequestTable> conflictColumns,
    _is.ColumnSelections<HelpRequestTable>? updateColumns,
    _is.WhereExpressionBuilder<HelpRequestTable>? updateWhere,
    _is.Transaction? transaction,
  }) async {
    return session.db.upsertRow<HelpRequest>(
      row,
      conflictColumns: conflictColumns(HelpRequest.t),
      updateColumns: updateColumns?.call(HelpRequest.t),
      updateWhere: updateWhere?.call(HelpRequest.t),
      transaction: transaction,
    );
  }

  /// Updates all [HelpRequest]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HelpRequest>> update(
    _is.DatabaseSession session,
    List<HelpRequest> rows, {
    _is.ColumnSelections<HelpRequestTable>? columns,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.update<HelpRequest>(
      rows,
      columns: columns?.call(HelpRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Updates a single [HelpRequest]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<HelpRequest> updateRow(
    _is.DatabaseSession session,
    HelpRequest row, {
    _is.ColumnSelections<HelpRequestTable>? columns,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateRow<HelpRequest>(
      row,
      columns: columns?.call(HelpRequest.t),
      transaction: transaction,
    );
  }

  /// Updates a single [HelpRequest] by its [id] with the specified [columnValues].
  /// Returns the updated row or null if no row with the given id exists.
  Future<HelpRequest?> updateById(
    _is.DatabaseSession session,
    int id, {
    required _is.ColumnValueListBuilder<HelpRequestUpdateTable> columnValues,
    _is.Transaction? transaction,
  }) async {
    return session.db.updateById<HelpRequest>(
      id,
      columnValues: columnValues(HelpRequest.t.updateTable),
      transaction: transaction,
    );
  }

  /// Updates all [HelpRequest]s matching the [where] expression with the specified [columnValues].
  /// Returns the list of updated rows.
  ///
  /// If [noReturn] is set to `true`, the updated rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HelpRequest>> updateWhere(
    _is.DatabaseSession session, {
    required _is.ColumnValueListBuilder<HelpRequestUpdateTable> columnValues,
    required _is.WhereExpressionBuilder<HelpRequestTable> where,
    int? limit,
    int? offset,
    _is.OrderByBuilder<HelpRequestTable>? orderBy,
    _is.OrderByListBuilder<HelpRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.updateWhere<HelpRequest>(
      columnValues: columnValues(HelpRequest.t.updateTable),
      where: where(HelpRequest.t),
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(HelpRequest.t),
      orderByList: orderByList?.call(HelpRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes all [HelpRequest]s in the list and returns the deleted rows.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HelpRequest>> delete(
    _is.DatabaseSession session,
    List<HelpRequest> rows, {
    _is.OrderByBuilder<HelpRequestTable>? orderBy,
    _is.OrderByListBuilder<HelpRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.delete<HelpRequest>(
      rows,
      orderBy: orderBy?.call(HelpRequest.t),
      orderByList: orderByList?.call(HelpRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Deletes a single [HelpRequest].
  Future<HelpRequest> deleteRow(
    _is.DatabaseSession session,
    HelpRequest row, {
    _is.Transaction? transaction,
  }) async {
    return session.db.deleteRow<HelpRequest>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  ///
  /// To specify the order of the returned rows use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// If [noReturn] is set to `true`, the deleted rows are not read back from
  /// the database and an empty list is returned. This avoids the overhead of
  /// transferring and deserializing the rows when the result is not needed.
  Future<List<HelpRequest>> deleteWhere(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<HelpRequestTable> where,
    _is.OrderByBuilder<HelpRequestTable>? orderBy,
    _is.OrderByListBuilder<HelpRequestTable>? orderByList,
    _is.Transaction? transaction,
    bool noReturn = false,
  }) async {
    return session.db.deleteWhere<HelpRequest>(
      where: where(HelpRequest.t),
      orderBy: orderBy?.call(HelpRequest.t),
      orderByList: orderByList?.call(HelpRequest.t),
      transaction: transaction,
      noReturn: noReturn,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _is.DatabaseSession session, {
    _is.WhereExpressionBuilder<HelpRequestTable>? where,
    int? limit,
    _is.Transaction? transaction,
  }) async {
    return session.db.count<HelpRequest>(
      where: where?.call(HelpRequest.t),
      limit: limit,
      transaction: transaction,
    );
  }

  /// Acquires row-level locks on [HelpRequest] rows matching the [where] expression.
  Future<void> lockRows(
    _is.DatabaseSession session, {
    required _is.WhereExpressionBuilder<HelpRequestTable> where,
    required _is.LockMode lockMode,
    required _is.Transaction transaction,
    _is.LockBehavior lockBehavior = _is.LockBehavior.wait,
  }) async {
    return session.db.lockRows<HelpRequest>(
      where: where(HelpRequest.t),
      lockMode: lockMode,
      lockBehavior: lockBehavior,
      transaction: transaction,
    );
  }
}
